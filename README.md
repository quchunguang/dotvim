Installation
------------

```bash
git clone git://github.com/quchunguang/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git pull
git submodule init
git submodule update
```

Notes
-----

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
