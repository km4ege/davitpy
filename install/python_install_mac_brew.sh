#!/bin/bash

# Python install script for mac
#   installs all pre-requisite software to run DaViT-py
#   requires HomeBrew

# Non-python dependencies
brew install gfortran
brew install mpich2
brew install coreutils
brew install pkg-config
brew install freetype
brew install libpng
brew install python
# Python dependencies
easy_install pip
brew install readline
brew install zeromq
pip install --upgrade pyzmq tornado pygments
pip install --upgrade ipython
python -c 'from IPython.external import mathjax; mathjax.install_mathjax()'
pip install --upgrade numpy
pip install --upgrade matplotlib
pip install --upgrade scipy
pip install --upgrade h5py
pip install --upgrade PIL
pip install --upgrade pymongo
pip install --upgrade paramiko
pip install --upgrade jinja2
pip install --upgrade cython
pip install --upgrade scikit-image

dir=$(pwd)
cd /tmp
git clone https://github.com/matplotlib/basemap.git
python2.7 setup.py install


cd $dir
install_dir=$(greadlink -f ../..)
echo "source $install_dir/profile.mac" >> ~/.bash_profile


cd ../..
./mastermake
