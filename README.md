DotVim
======

**Help vim beginner get a powerful vim environment quickly.**

Features
--------
<table><tr><th>PowerBy</th><th>Feature</th></tr>
<tr><td>a.vim</td><td>A few of quick commands to swtich between source files and header files quickly.</td></tr>
<tr><td>bufexplorer.zip</td><td>Quickly and easily switch between buffers by using the one of the default public interfaces.</td></tr>
<tr><td>genutils</td><td>Some common functions. Used by, for example, lookupfile.</td></tr>
<tr><td>grep.vim</td><td>Allows you to search for a pattern by grep in one or more files and jump to them.</td></tr>
<tr><td>lookupfile</td><td>Opening files by typing a pattern to represent the file you are looking for.</td></tr>
<tr><td>Marks-Browser</td><td>Provides a graphical browsers of the user marks for the local file [a-z].</td></tr>
<tr><td>mark.vim</td><td>Highlight target words.</td></tr>
<tr><td>mkview.vim</td><td>Emulate the |mkview| function of vim without requiring the creation of |view-file|s.</td></tr>
<tr><td>OmniCppComplete</td><td>Omni completion (intellisense) in C and C++ files.</td></tr>
<tr><td>python-mode</td><td>Provide features like python code looking for bugs, refactoring and some other useful things.</td></tr>
<tr><td>ShowMarks</td><td>ShowMarks provides a visual representation of the location marks.</td></tr>
<tr><td>snipMate</td><td>An unobtrusive, concise vim script that implements some of TextMate's snippets features.</td></tr>
<tr><td>supertab</td><td>Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs.</td></tr>
<tr><td>taglist.vim</td><td>Overview of the structure of source code files and allows efficiently browse through source code files.</td></tr>
<tr><td>vim-matchit</td><td>Configure % to match more than just single characters, and allow match by file type.</td></tr>
<tr><td>vim-pandoc</td><td>Writing and editing documents in pandoc's extended markdown.</td></tr>
<tr><td>vim-pathogen</td><td>Easy to install plugins and runtime files in their own private directories.</td></tr>
<tr><td>vim-surround</td><td>Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.</td></tr>
<tr><td>vis</td><td>Performs an arbitrary Ex command on a visual highlighted block.</td></tr>
<tr><td>VisIncr</td><td>Facilitates making a column of increasing or decreasing numbers, dates, or daynames.</td></tr>
<tr><td>winmanager--Fox</td><td>A windows style IDE for vim.</td></tr>
<tr><td>xml.vim</td><td>A plugin for editing xml.</td></tr>
</table>

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
