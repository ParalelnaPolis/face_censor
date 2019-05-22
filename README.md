# Installation

We are using [facedetect](https://gitlab.com/wavexx/facedetect).

## For Mac with installed homebrew:

```bash
git clone 'https://gitlab.com/wavexx/facedetect'
cd facedetect
patch < ../facedetect-mac.patch
cp facedetect /usr/local/bin
brew install opencv imagemagick python
pip3 install numpy
```

## For Linux (Ubuntu 18.04):

```bash
######################################################################################################
# install tools
#

sudo apt install git
sudo apt install imagemagick
sudo apt install python3
sudo apt install python-numpy

######################################################################################################
# install opencv
# Instructions from: https://linuxize.com/post/how-to-install-opencv-on-ubuntu-18-04/
#

# install all required and optional dependencies
sudo apt install build-essential cmake git pkg-config libgtk-3-dev
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev
sudo apt install libjpeg-dev libpng-dev libtiff-dev gfortran openexr libatlas-base-dev
sudo apt install python3-dev python3-numpy libtbb2 libtbb-dev libdc1394-22-dev

# Cloning the OpenCV source code
mkdir ~/opencv_build && cd ~/opencv_build
git clone https://github.com/opencv/opencv.git
cd opencv && git checkout 4.1.0 && ..
git clone https://github.com/opencv/opencv_contrib.git
cd opencv && git checkout 4.1.0 && ..

# Configuring OpenCV with CMake
cd ~/opencv_build/opencv
mkdir build && cd build

# Set up the OpenCV build with CMake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON ..

# Compiling OpenCV
# `nproc` to find number of processors
# takes some time - grab a coffee!
make -j`nproc`

# Installing OpenCV
sudo make install

# Verifying OpenCV installation
pkg-config --modversion opencv4
# or
python3 -c "\
import cv2
print(cv2.__version__)"

######################################################################################################
# install facedetect
#
git clone https://github.com/ParalelnaPolis/face_censor.git
cd face_censor
git clone https://gitlab.com/wavexx/facedetect.git
cd facedetect
patch < ../facedetect-mac.patch
sudo cp facedetect /usr/local/bin
cd ..

# Start using as described below...
```

# Usage

Censor one image:

```bash
./censor.sh path_to_image
```

This will censor an image and will output it in blurred/

Censor many images

```bash
for i in path_to_images/*.jpg; do echo "Censoring ${i}..."; ./censor.sh "$i";done
```

By default, censor.sh blurs and censor-pixelate.sh pixelates. Choose
whatever works best for your use-case.
