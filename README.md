docsort
========

Usage on Ubuntu:
--------

`git clone https://github.com/mdeboc/docsort.git`

`cd docsort/10-word2vect`


`sudo apt-get install build-essential gcc`

`### On Mac:`
`### brew install gcc`

`make`

`time ./word2vec -train ../../data_word2vec/outclean1m8.txt -output ../../data_word2vec/w2v1m8_300 -size 300 -sample 1e-4 -threads 25 -binary 1 -iter 2`

`./distance ../../data_word2vec/w2v1m8_300`

