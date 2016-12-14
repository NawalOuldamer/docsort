#!/bin/bash

# LC_ALL=C sed 's|\\xC3| |g' frwiki-20140608-pages-articles-multistream-200Mo.txt > frwiki-20140608-pages-articles-multistream-200Mo-test_sed.txt
# LC_ALL=C sed 's|\xC3| |g' frwiki-20140608-pages-articles-multistream-200Mo.txt > frwiki-20140608-pages-articles-multistream-200Mo-test_sed.txt
#                 "\xC3"


# USAGE:
# bash clean.sh out.txt > out_cleaned.txt

#    sed -e 's/\.//g'  -e 's/\,//g' -e 's/  / /g' "$1" | tr 'A-Z' 'a-z'
# sed 's|||g' |
# cat $line |

while IFS='' read -r line || [[ -n "$line" ]]; do
    sed -e 's/\.//g' -e 's/\,//g' |
    sed -e 's/&[^;]*;/ /g' |  # remove URL encoded chars
    sed 's|<.*>||g' |
    sed 's|&amp;|&|g' |  # decode URL encoded chars
    sed 's|&lt;|<|g' |
    sed 's|&gt;|>|g' |
    sed 's|<ref[^<]*<\/ref>||g' |  # remove references <ref...> ... </ref>
    sed 's|*| |g' |
    sed 's|#| |g' |
    sed 's|·| |g' |
    sed 's|_| |g' |
    sed 's|:| |g' |
    sed 's|"| |g' |
    sed 's|\\| |g' |
    sed 's|\/| |g' |
    sed 's|(| |g' |
    sed 's|)| |g' |
    sed 's|\[| |g' |
    sed 's|\]| |g' |
    sed 's|\!| |g' |
    sed 's|\?| |g' |
    sed 's|\;| |g' |
    tr -cd '\00-\255' |  # to suppress chinese characters and others...
    tr 'A-Z' 'a-z' |
    sed -e 's/0/ zero /g' |
    sed -e 's/1/ one /g' |
    sed -e 's/2/ two /g' |
    sed -e 's/3/ three /g' |
    sed -e 's/4/ four /g' |
    sed -e 's/5/ five /g' |
    sed -e 's/6/ six /g' |
    sed -e 's/7/ seven /g' |
    sed -e 's/8/ eight /g' |
    sed -e 's/9/ nine /g' |
    sed '/^[[:space:]]*$/d' |
    sed -e 's/  / /g' -e 's/  / /g' -e 's/  / /g'
done < "$1"
