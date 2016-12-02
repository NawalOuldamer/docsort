docsort
========

Usage on Ubuntu:
--------

git clone https://github.com/mdeboc/docsort.git
cd docsort/10-word2vect

sudo apt-get install build-essential gcc
### On Mac:
### brew install gcc
### replace #include <malloc.h> by #include <stdlib.h>
make
time ./word2vec -train ../../data/frwiki-20140608-pages-articles-multistream-200Mo.txt -output ../../data/wiki300d -size 300 -threads 25 -binary 1
./distance ../../dataOuord2vect/wiki300d


