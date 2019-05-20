Installation
============

We are using [facedetect](https://gitlab.com/wavexx/facedetect).

For Mac with installed homebrew:

``bash
git clone 'https://gitlab.com/wavexx/facedetect'
cd facedetect
patch < ../facedetect-mac.patch
cp facedetect /usr/local/bin
brew install opencv imagemagick python
pip3 install numpy
``

Usage
=====

Censor one image:

``bash
./censor.sh path_to_image
``

This will censor an image and will output it in blurred/

Censor many images

``bash
for i in path_to_images/*.jpg; do echo "Censoring ${i}..."; ./censor.sh "$i";done
``
