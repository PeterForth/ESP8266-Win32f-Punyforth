\ $Id: FileLister.f,v 1.11 2010/06/03 08:56:38 jos_ven Exp $

\ FileLister.f          List Files in a Folder
\ Thursday, August 19 2004 - Ezra Boyce
\ Code adapted from ProjectManager.f, a.k.a shamelessly ripped off :-)
\ See the FileWindow class at end of file for available methods and uses

cr .( Loading FileLister.f : file lister...)

anew -FileLister.f

needs linklist.f
needs treeview.f
needs bitmap.f
needs quiksort.f

load-bitmap folderbmp "apps\forthform\res\folder.bmp"

: rootdir?  { pathstr cnt -- f } \ f = true if path is at root
            pathstr cnt + 2 - w@ s" :\" drop w@ = ?dup ?exit
            pathstr cnt + 1- c@ ':' = ;

\- ?exitm macro ?exitm " if exitm then"

:Object FileFinder                 <Super Object

max-path bytes findpath
32       bytes findspecs

:M FindFirstFile:   ( addr cnt -- ior )  \ ior = 0 = success
                    find-first-file nip
                    ;M

:M FindNextFile:     ( -- ior ) \ ior = 0 = success
                     find-next-file nip ;M

:M FindClose:        ( -- ior ) \ ior = 0 = success
                     find-close drop ;M

:M GetFileAttributes:  ( -- n )
                       _Win32-Find-Data @ ;M

:M GetFileName:        ( -- adr cnt )
                       get-file-name zcount ;M

:M GetFileSize:         ( -- d )
                        get-file-size
                        ;M

:M ClassInit:           ( -- )
                        ClassInit: super
                        findpath max-path erase
                        s" *.*" findspecs place   \ default
                        ;M

: .or..?            ( -- f ) \ is found file directories . or ..?
                        GetFileName: self drop c@ '.' = ;

:M IsDirectory?:        ( -- f ) \ exclude . and ..
                        GetFileAttributes: self FILE_ATTRIBUTE_DIRECTORY and 0<>
                        .or..? not and
                        ;M

:M IsFile?:             ( -- f )
                        GetFileAttributes: self FILE_ATTRIBUTE_DIRECTORY and 0=
                        ;M

:M SetUp:               ( pathstr len spec$ cnt -- )
\ pathstr len = pointer to path to search
\ spec$ cnt = file specs to search for
                        dup 0=
                        if      2drop s" *.*"
                        then    31 min 0max findspecs place
                        findpath place ;M

:M FindFiles:           ( -- f ) \ specs should be already setup
                        new$ >r
                        findpath count r@ place
                        findspecs count dup
                        if      r@ ?+\
                        then    r@ +place
                        r> count FindFirstFile: self
                        ;M

:M FullPath:           ( -- addr cnt ) \ return full path of directory found
                        findpath count new$ dup>r place
                        GetFileName: self dup
                        if      r@ ?+\
                        then    r@ +place
                        r> count
                        ;M

;Object

:Class FolderItem           <super Object

record: iteminfo
max-path 1+ bytes itemname
    int parenttree        \ parent treeview control
    int parentitem        \ parent item in treeview control
    int hwnditem          \ handle for item
  short itemflags
 2 bits itemid            \ item id, 0 for child item
14 bits reservedflags
;recordsize: sizeof(iteminfo)

int iconhandle
int itemhandle  \ parent handle
cell bytes index

\ save information for each individual file
Record: Win32_Find_Data
         int   FileAttributes
         int   FileCreationTimeLow
         int   FileCreationTimeHigh
         int   FileLastAccessTimeLow
         int   FileLastAccessTimeHigh
         int   FileLastWriteTimeLow
         int   FileLastWriteTimeHigh
         int   FileSizeHigh
         int   FileSizeLow
         int   Reserved0
         int   Reserved1
max-path bytes FileName
      14 bytes AlternateFileName
;RecordSize: sizeof(Win32_Find_Data)

:M GetFileAttributes:  ( -- n )
                       FileAttributes ;M

:M GetFileName:        ( -- adr cnt )
                       FileName zcount ;M

:M GetFileSize:         ( -- d )
                        FileSizeLow
                        ;M

: .or..?            ( -- f ) \ is found file directories . or ..?
                        GetFileName: self drop c@ '.' = ;

:M IsFile?:             ( -- f )
                        GetFileAttributes: self FILE_ATTRIBUTE_DIRECTORY and 0=
                        ;M

:M IsDirectory?:        ( -- f ) \ exclude . and ..
                        IsFile?: self not
                        .or..? not and
                        ;M

:M classinit:   ( -- )
            classinit: super
            iteminfo sizeof(iteminfo) erase
            Win32_Find_Data sizeof(Win32_Find_Data) erase
            0 to iconhandle
            -1 index !
            ;M

:m GetData: ( -- addr cnt ) \ access for any additional information needed
            Win32_Find_Data sizeof(Win32_Find_Data) ;m

:M setname: ( addr cnt -- ) \ assumes name is set for FindFirstFile, FindNextFile etc.
            itemname max-path erase
            max-path min 0max itemname swap move
            \ transfer the info
            _Win32-Find-Data Win32_Find_Data sizeof(Win32_Find_Data) move
            ;M

:m getname: ( -- addrz )
        itemname ;m

:m getname$: ( -- addr cnt )
        itemname zcount ;m

:m isparentitem: ( n -- )
        to parentitem ;m

:m parentitem:  ( -- n )
        parentitem ;m

:m isparenttree: ( n -- )
        to parenttree ;m

:m parenttree:  ( -- n )
        parenttree ;m

:m handle:  ( -- hwnd )
        hwnditem ;m

:m ishandle:    ( n -- )
        to hwnditem ;m

:m itemid:  ( -- f )
        itemid ;m

:m isitemid:    ( f -- )
        to itemid ;m

:m iconhandle: ( -- n )
               iconhandle ;m

:m isiconhandle: ( n -- )
                to iconhandle ;m

:m index:       ( -- n )
                index @ ;m

:m isindex:     ( n -- )
                index ! ;m

:M AddIcon:     ( -- )
                index itemname itemhandle Call ExtractAssociatedIcon to iconhandle
                ;M

:M SetHandle:	( hwnd -- )
		to itemhandle ;M

\ Windows API say the following isn't necessary
\ :M ~:           ( -- )
\                 iconhandle ?dup
\                 if         Call DestroyIcon drop
\                            0 to iconhandle
\                 then       ;M

;class

:Class TreeList     <super linked-list

int hwndlist
int itemid
32 constant listmax     \ maximum length of list name
listmax 1+ bytes listname

:m handle:  ( -- n )
            hwndlist ;m

:m ishandle:    ( hwnd -- )
                to hwndlist ;m

:m itemid:  ( -- f )
            itemid ;m

:m isitemid:    ( f -- )
                to itemid ;m

:m setname:     ( addr cnt  -- )
                listname dup listmax erase swap listmax min 0max move ;m

:m getname:     ( -- namez )
                listname ;m

:m classinit:   ( -- )
                classinit: super
                s" .." setname: self
                -1 isitemid: self  ;m   \ identifies parent

:m DeleteItem: { item \ flag -- }
                Data@: self 0= ?exitm
                false to flag
                #Links: self 1+ 1
                ?do      i >Link#: self Data@: self item =
                         if     0 Data!: self DeleteLink: self
                                item dispose
                                true to flag   \ mark as found
                                leave
                         then
                loop     flag 0= abort" Item not found in list!"
                ;m
:m total:  ( -- n )
            Data@: self
            if      #links: self
            else    0
            then    ;m

:m GetEntry: { n -- obj | 0 }
        0 total: self 0= ?exitm
        n 1 total: self between not ?exitm
        drop n >Link#: self Data@: self ;m

;class

:Class FolderTree       <super TreeViewControl

int ThisItem            \ temp pointer to new item
int hwndmain            \ handle of root item in tree
int hwndimage           \ handle to imagelist
int FolderList
int sortorder
int tree-click          \ called when an item is clicked
int on_update           \ called when folder tree is refreshed
int SelectedItem        \ tree item object
int show-files?         \ do we want to display files as well as directories?
int #dirs               \ number of directories found when updating
int #fls                \ ditto files
int hwndlabel           \ handle to window to display path
\ number of files shown is limited only by available memory
\ however only first 4k will be sorted. Of course the buffer size could always be increased
16 1024 * constant recbuffer-size
recbuffer-size cell / constant max-recs  \ about 4000 files and directories for sorting
int recbuffer       \ pointer to memory used for sorting

2 cells bytes rootname
max-path 1+ bytes Treepath
\ path: thespecs
2 cells class-allot
max-path 1+ bytes thespecs


: free-recbuffer  ( -- )
                  recbuffer ?dup
                  if        release
                            0 to recbuffer
                  then      ;

:M Handle:      ( -- hwndmain )
                hwndmain ;M

:m SetRootName: ( addr cnt -- )
        rootname 2 cells erase
        rootname swap move ;m

:m Setpath: { addr cnt -- }  \ check for valid path
            addr cnt + 2 - w@ 0x5C3A =         \ are the last chars ':\' i.e root dir?
            if   addr cnt treepath place
                 treepath +null
                 exitm
            then addr cnt find-first-file ?exitm     \ does not exist so exit
            @ FILE_ATTRIBUTE_DIRECTORY and     \ something was found
            if     addr cnt treepath place     \ it is a directory
                   treepath +null
            then   find-close drop ;M

:m Getpath: ( -- addr cnt )
            treepath count ;M

:M SetSpecs:    ( addr cnt -- )
                thespecs place ;M

:M GetSpecs:    ( -- addr cnt )
                thespecs count ;M

:M IsLabelHandle: ( hwnd -- )
                  to hwndlabel ;M

: CreateImageList ( -- )    \ create image list for treeview control
            total: folderlist 2 +              \ maximum images
            dup 2 max                          \ number of images to use
            ILC_COLOR16                         \ color depth
            18 16                              \ bitmap size height,width
            Call ImageList_Create to hwndimage ;

: RegisterList  ( -- )  \ register list with this treeview control
            hwndimage ?dup 0= ?exit
            TVSIL_NORMAL
            TVM_SETIMAGELIST
            hwnd
            send-window ;

: add-icons { \ item -- }         \ add icon for each file
            total: folderlist 1+ 1
            ?do    i >Link#: FolderList
                   Data@: FolderList to item
                   IconHandle: item
                   hwndimage Call ImageList_AddIcon dup -1 <>
                   if        isindex: item
                   else      drop
                   then
            loop   ;

\ A folder has a default icon to represent it but I find it displays kinda dark in the
\ treeview imagelist. I am sure it is simply something I am missing about image lists
\ but for now I will use my own folder bitmap to represent folders in the treeview
: Add-folderbmp { \ hbitmap -- }
            hwndimage 0= ?exit                   \ we don't have any
            folderbmp usebitmap map-3dcolors     \ create bitmap handle
            GetDc: self dup>r CreateDIBitmap to hbitmap
            r> ReleaseDc: self
            hbitmap                             \ was it successful?
            if      NULL                        \ no overlay image list
                    hbitmap
                    hwndimage
                    Call ImageList_Add drop
                    hbitmap Call DeleteObject drop \ discard, windows has a copy
            then    ;

: AddImages ( -- )
            CreateImageList
            RegisterList
            Color: WHITE hwndimage Call ImageList_SetBkColor drop
            add-folderbmp
            add-icons ;

: ?Hasfiles     ( -- f )    \ does a directory have any files?
                IsDirectory?: ThisItem
                if      treepath count pad place
                        pad ?+\
                        s" *.*" pad +place      \ not necessarily the "thespecs" value
                        pad count find-first-file nip 0=
                        if      find-close drop 1
                        else    0
                        then
                else    0
                then    ;

: ?itemimage    ( -- n )
                IsDirectory?: ThisItem
                if      1                  \ use my folder bitmap for directory entries
                else    index: ThisItem    \ use associated file icon
                then    ;

: AddTreeItem   ( -- )  \ add file or directory to tree
                tvins  /tvins  erase
                ?HasFiles                       to cChildren
                Handle: FolderList              to hParent
                TVI_LAST                        to hInsertAfter
                GetName$: ThisItem "to-pathend" asciiz
                                                to pszText
                ThisItem                        to lparam
                ?itemimage dup                  to iImage
                                                to iSelectedImage
                [ TVIF_TEXT TVIF_CHILDREN or TVIF_PARAM or TVIF_IMAGE or TVIF_SELECTEDIMAGE or ] LITERAL
                                                to mask
                tvins 0 TVM_INSERTITEMA hWnd Call SendMessage IsHandle: ThisItem
                 ;

: UpdateList    ( addr cnt -- )         \ save file info
                SetName: ThisItem
                FolderList IsParentItem: ThisItem
                self IsParentTree: ThisItem
                IsDirectory?: Thisitem isitemid: ThisItem
                AddIcon: ThisItem ;

: add-items ( -- )  \ actually add found files to tree
            AddImages
            >FirstLink: FolderList
            #dirs 0                             \ directories first
            ?do     Data@: FolderList to ThisItem
                    AddTreeItem
                    >NextLink: FolderList
            loop    show-files? #fls 0<> and    \ and then files
            if      #dirs 1+ dup >Link#: FolderList
                    total: FolderList 1+ swap
                    ?do     Data@: FolderList to ThisItem
                            AddTreeItem
                            >NextLink: FolderList
                    loop
            then    ;

: AddFile   ( str cnt -- )
        Data@: FolderList
        if  AddLink: FolderList
        then    New> FolderItem dup Data!: FolderList to ThisItem
        hwnd SetHandle: ThisItem
        ( str cnt ) UpdateList ;

: ?rootimage  ( -- n )
              rootname zcount rootdir? 1 and ;

: AddRoot   ( -- )
                tvins  /tvins  erase
                1               to cChildren      \ assuming we have
                TVI_ROOT        to hParent
                TVI_LAST        to hInsertAfter
                Folderlist      to lparam
                getname: lparam to pszText
                ?rootimage dup  to iImage
                                to iSelectedImage
     [ TVIF_TEXT TVIF_CHILDREN or TVIF_PARAM or TVIF_IMAGE or TVIF_SELECTEDIMAGE or ] LITERAL
                                to mask
                tvins 0 TVM_INSERTITEMA hWnd Call SendMessage dup
                ishandle: FolderList to hwndmain ;

: CreateTree    ( -- )
            new> treelist to FolderList
            rootname zcount SetName: FolderList ;

:M start:   ( parent -- )
            start: super
            CreateTree
            AddRoot
            recbuffer-size malloc to recbuffer
            ;M

:m Classinit:   ( -- )
                Classinit: super
                0 to SelectedItem
                s" .." setrootname: self
                treepath off
                -1 thespecs 2 cells - !
                0 thespecs cell- !
                s" *.*" thespecs place
                ['] drop to tree-click
                ['] drop to on_update
                0 to SelectedItem
                true to show-files?
                0 to #dirs
                0 to #fls
                0 to hwndlabel
                0 to recbuffer
                SortAscending: [ self ] ;m

: DisposeTheList ( -- )
            FolderList
            if      Folderlist DisposeList
                    FolderList Dispose
                    0 to FolderList
            then    ;

:M WindowStyle: ( -- style )
                WindowStyle: super
                TVS_HASLINES        or
                TVS_HASBUTTONS      or
                TVS_DISABLEDRAGDROP or
                TVS_SHOWSELALWAYS   or
                TVS_LINESATROOT     or
                ;M

:m ~:   ( -- )
        DisposeTheList
        free-recbuffer ;m

:m Close: ( -- )
        DisposeTheList
        free-recbuffer
        hwndimage ?dup
        if      Call ImageList_Destroy drop
        then    Close: super
        ;m

: FindAllFiles  ( -- )
                0 to #dirs 0 to #fls
                \ we get all directories first
                TreePath count s" *.*" Setup: FileFinder
                FindFiles: FileFinder
                begin   0=
                while   IsDirectory?: FileFinder
                        if      FullPath: FileFinder AddFile
                                1 +to #dirs
                        then    FindNextFile: FileFinder
                repeat  FindClose: FileFinder
                \ now we get the rest of the files
                thespecs first-path"
                begin   dup 0>
                while   TreePath count 2swap SetUp: FileFinder
                        FindFiles: FileFinder
                        begin       0=
                        while       IsFile?: FileFinder
                                    if      FullPath: FileFinder AddFile
                                            1 +to #fls
                                    then    FindNextFile: FileFinder
                        repeat      FindClose: FileFinder
                        thespecs next-path"
                repeat  2drop
              ;

: recbuffer()   ( n -- addr )
                recbuffer +cells ;

:M SortAscending:   ( -- )
                ['] 0< to sortorder ;M

:M SortDescending:  ( -- )
                ['] 0> to sortorder ;M

: null-check    ( a1 -- a1 )
                 ?win-error-enabled 0=
                 if      dup 0=
                         if      drop ['] noop   \ convert null to NOOP
                                 exit            \ and exit
                         then
                 then
                 dup 0= s" Attempt to execute a NULL function" ?TerminateBox
                 ;

: dosortorder   ( n -- f )
                sortorder null-check execute ;

: compare-recs  ( n1 n2 -- f )
                GetName$: [ swap ] "to-pathend"
                GetName$: [ rot ]  "to-pathend" caps-compare dosortorder ;

: readrecbuffer ( -- )  \ load temporary buffer with record pointers
                >FirstLink: FolderList
                total: FolderList max-recs min 0max 0
                ?do     Data@: FolderList i recbuffer() !
                        >NextLink: FolderList
                loop    ;

: writerecbuffer ( -- ) \ rewrite sorted records to database
                >FirstLink: FolderList
                total: FolderList max-recs min 0max 0
                ?do     i recbuffer() @ Data!: FolderList
                        >NextLink: FolderList
                loop    ;

: sortfiles     ( -- )
                recbuffer 0= ?exit                       \ if not allocated abort sorting
                [']  compare-recs is precedes            \ set sort comparator
                total: folderlist 2 < ?exit
                readrecbuffer                            \ load buffer
                #dirs 1 >
                if      0 recbuffer() #dirs sort         \ sort the directories
                then    #fls 1 >
                if      #dirs recbuffer() #fls sort      \ and the files
                then    writerecbuffer ;

: show-path     ( -- )
                hwndlabel 0= ?exit
                hwndlabel Call IsWindow 0= ?exit
                treepath count asciiz 0 WM_SETTEXT hwndlabel send-window ;

:M UpdateFiles:   ( -- )
                treepath c@ 0=
                if      current-dir$ count setpath: self
                then    TreePath count rootdir?
                \ if at root can't go up a level
                if      Treepath dup ?+\ +NULL
                        TreePath count
                else    s" .."      \ indicates ability to ascend
                then    SetRootName: self
                Close: self         \ clear tree
                parent Start: self  \ and restart
                _Win32-Find-Data [ 11 cells max-path + 14 + ] LITERAL erase
                FindAllFiles
                SortFiles
                add-items
                show-path
                hwndmain ToggleExpandItem: self
                self On_Update null-check execute           \ user function
                ;M

:M ascend:      ( -- )
                GetPath: self 2dup rootdir?
                if      2drop exitm
                then    2dup + swap '\' -scan drop over - SetPath: self
                Updatefiles: self
                ;m

:m descend:     ( --)
                SelectedItem 0= ?exitm
                IsDirectory?: SelectedItem not ?exitm
                GetName$: SelectedItem SetPath: self
                Updatefiles: self
                ;m

:M On_SelChanged: ( -- f )      \
                lparamNew to SelectedItem
                SelectedItem tree-click null-check execute
                false
                ;M

:m DeleteFile:  ( -- )
                Selecteditem 0=          ?exitm
                itemid: SelectedItem 0<> ?exitm \ can't delete folder or root
                s" Delete " new$ dup>r place
                getname$: SelectedItem r@ +place
                s" ?" r@ +place
                r@ +NULL
                r> 1+               ( sztext )
                z" Are you sure?"   ( ztitle )
                MB_YESNO            ( style  )
                MessageBox: parent IDNO = ?exitm
                Getname$: SelectedItem delete-file dup
                s" Delete file failed" ?MessageBox
                ?exitm
                handle: SelectedItem    \ save it
                SelectedItem dup parentitem: [ ] DeleteItem: [ ]
                ( handle )      \ lparam
                0               \ wparam
                TVM_DELETEITEM  \ msg
                hwnd send-window
                0 to SelectedItem
                UpdateFiles: self ;m

:M SelectedItem:    ( -- n )
                    SelectedItem ;M

:M #Dirs:       ( -- n )
                #dirs ;M

:M #Files:      ( -- n )
                #fls ;m

:M Showfiles:   ( f -- )
                to show-files? ;m

:M IsOn_Update: ( cfa -- )
                to on_update ;m

:M IsTree-Click: ( cfa -- )
                to tree-click ;m

:M FileList:   ( -- list )
                FolderList ;M

;Class

:Class FileWindow              <Super Child-Window

FolderTree ThisFolder
int tree-dblclick
int wstyle   \ additional window style e.g WS_BORDER

:M ClassInit:   ( -- )
                ClassInit: Super
                ['] drop to tree-dblclick
                NextId to ID
                0 to wstyle ;M

:M On_Init: ( -- )
                 self Start: ThisFolder
                 Updatefiles: ThisFolder
                 ;m

:M WindowStyle: ( -- style )
                WindowStyle: super
                wstyle or ;M     \ add in user style

:M AddStyle:    ( n -- )
                to wstyle ;M

:M On_Size:     ( -- )
                autosize: thisfolder ;M

:M #Dirs:       ( -- n )
                #dirs: thisfolder ;M

:M #Files:      ( -- n )
                #files: thisfolder ;m

:M Showfiles:   ( f -- ) \ allow or disallow display of files in tree
                showfiles: thisfolder ;m

:M IsOn_Update: ( cfa -- ) \ cfa to execute whenever the display is updated
                ison_update: thisfolder ;m

:M IsTree-Click: ( cfa -- )  \ set cfa to be executed when item in tree is clicked
                istree-click: thisfolder ;m

:M IsTree-Dblclick: ( cfa -- )  \ set cfa to be executed when item in tree is double-clicked
                to tree-dblclick ;M

:M TheFolderTree:   ( -- obj ) \ direct access to the tree
                Addr: ThisFolder ;M

:M UpdateFiles: ( -- ) \ update the display
                UpdateFiles: ThisFolder
                ;M

:M SetPath:     ( addr cnt -- ) \ set for valid path
                SetPath: ThisFolder ;M

:M GetPath:     ( -- addr cnt )
                GetPath: ThisFolder ;M

:M SetSpecs:    ( addr cnt -- ) \ e.g s" *.f;*.seq;*.frm;*.txt"
                SetSpecs: Thisfolder ;M

:M GetSpecs:    ( -- addr cnt )
                GetSpecs: ThisFolder ;M

:M IsLabelhandle:  ( hwnd -- ) \ handle of window that will display path name
                   IsLabelHandle: ThisFolder ;M

:M SortAscending:   ( -- )
                SortAscending: ThisFolder ;M

:M SortDescending:  ( -- )
                SortDescending: ThisFolder ;M

:M DeleteFile:  ( -- ) \ delete selected file after confirmation
                DeleteFile: ThisFolder ;M

:M SelectedItem:    ( -- )  \ selected file or directory, itemid = 0 means it is a file
                    SelectedItem: ThisFolder ;M

:M Total:           ( -- n )      \ sum of files and directories
                    #dirs: self #files: self + ;M

:M FileList:   ( -- list )
                FileList: ThisFolder ;M

:M ChooseFolder: ( -- )   \ change folder programatically, also available by right clicking
                 hwnd 0= ?exitm
                 z" Select a drive or folder"
                 \ use a copy of path because if cancelled path info is changed to null
                 GetPath: self pad place
                 pad hwnd BrowseForFolder
                 if       pad count SetPath: self
                          UpdateFiles: self
                 then     ;M

:M Close:       ( -- )
                Close: ThisFolder
                Close: Super ;M

:M WM_NOTIFY    ( h m w l -- f )
                dup @  GetHandle: ThisFolder <> if false exitm then
                dup 2 cells+ @
                dup  NM_DBLCLK  =
                if   drop ItemId: [ SelectedItem: ThisFolder ] dup 0=  \ is a file?
                     if      drop SelectedItem: ThisFolder tree-dblclick null-check execute
                     else    -1 =    \ .. selection?
                             if      ascend: ThisFolder
                             else    descend: ThisFolder
                             then
                     then    false
                else NM_RCLICK =
                     if    ChooseFolder: self false
                     else  Handle_Notify: ThisFolder
                     then
                then
                ;M

;Class

\s
