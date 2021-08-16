#! /bin/bash
# setup.sh
#
# author: Julien Barrier <julien.barrier@espci.org>
# a Bash script to automate the setup of a new computer. made for macOS.

xcode-select --install
if test ! $(which brew)
then
    echo " Installing Homebrew for you."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew upgrade --all

brew install xquartz
brew install vim --with-client-server
brew install --cask iterm2
brew install --cask firefox
brew install --cask ccleaner
brew install ffmpeg
brew install imagemagick
brew install jupyterlab
brew install mutt
brew install node
brew install python@3.9
brew install wget
brew tap zegervdv/zathura
brew install zathura
brew install zathura-pdf-poppler
brew install xdotool
mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib

brew clenup

echo " Installing configuration files for you."
cd ~/ && git init
git remote add origin git@github.com:julienbarrier/dotfiles
git pull origin master --allow-unrelated-historiea

echo " Installing python configuration."
pip install jupyter
pip install matplotlib
pip install pandas
pip install numpy
pip install scipy
pip install seaborn

