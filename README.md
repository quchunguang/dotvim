About
-----

**Dotvim** aim to help vim beginner get a powerful vim environment quickly.

Features
-------

PowerBy           Feature
-------           -------
a.vim             A few of quick commands to swtich between source files and header files quickly.
bufexplorer.zip   Quickly and easily switch between buffers by using the one of the default public interfaces.
genutils          Some common functions. Used by, for example, lookupfile.
grep.vim          Allows you to search for a pattern by grep in one or more files and jump to them.
lookupfile        Opening files by typing a pattern to represent the file you are looking for.
Marks-Browser     Provides a graphical browsers of the user marks for the local file [a-z].
mark.vim          Highlight target words.
mkview.vim        Emulate the |mkview| function of vim without requiring the creation of |view-file|s.
OmniCppComplete   Omni completion (intellisense) in C and C++ files.
python-mode       Provide features like python code looking for bugs, refactoring and some other useful things.
ShowMarks         ShowMarks provides a visual representation of the location marks.
snipMate          An unobtrusive, concise vim script that implements some of TextMate's snippets features.
supertab          Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs.
taglist.vim       Overview of the structure of source code files and allows efficiently browse through source code files.
vim-matchit       Configure % to match more than just single characters, and allow match by file type.
vim-pandoc        Writing and editing documents in pandoc's extended markdown.
vim-pathogen      Easy to install plugins and runtime files in their own private directories.
vim-surround      Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
vis               Performs an arbitrary Ex command on a visual highlighted block.
VisIncr           Facilitates making a column of increasing or decreasing numbers, dates, or daynames.
winmanager--Fox   A windows style IDE for vim.
xml.vim           A plugin for editing xml.

Installation
------------

1. Install git and vim.

```bash
sudo apt-get install vim git		# for debian/ubuntu
```

2. Get Dotvim source.

```bash
# NOTICE: MUST get sources to ~/.vim
git clone git://github.com/quchunguang/dotvim.git ~/.vim
```

3. Configure.

```bash
# Backup and remove ~/.vimrc if you already have one.
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

Further Notes
-------------

Create this repos, [synchronizing-plugins-with-git-submodules-and-pathogen][1], [vim-pathogen home][2] for detail,
```bash
 # Add  new repos with name "dotvim" in my github, then
cd ~/.vim
mv ~/.vimrc vimrc
ln -s vimrc ~/.vimrc
git init
touch README.md
git add README.md
git commit -m 'Initialize commit'
git remote add origin https://github.com/quchunguang/dotvim.git
git push origin master
```

Add a new plugin,
```bash
cd ~/.vim
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

Update all submodules,
```bash
cd ~/.vim
git submodule foreach git pull origin master
```

Reinitialize all resposes from exist bundle/* (not submodules) to this all-in-one repos (as submodules),
```bash
cd ~/.vim
for d in bundle/*; do (cd $d && git remote -v show;) done | grep fetch | awk '{print $2}' > /tmp/list
rm -rf bundle && mkdir bundle
for f in `cat /tmp/list`; do name=${f##*/}; git submodule add "$f" "bundle/${name%.git}"; done
git commit -m 'reinitialize all reposes from exist bundle'
git push
```

  [1]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/ "synchronizing-plugins-with-git-submodules-and-pathogen"
  [2]: https://github.com/tpope/vim-pathogen "vim-pathogen home"
