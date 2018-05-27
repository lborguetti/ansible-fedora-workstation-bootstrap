# print out the fixed width fonts that are available with their family name
fc-list :scalable=true:spacing=mono: family

# sort and page through the available fonts - not only fixed width fonts
$ fc-list | cut -f2 -d| | sort -u | less

# grep for a specific font
$ fc-list | grep Ubuntu
Run it in XTerm to test
Where -fa is a short-hand for font face and fs is a shorthand for font-size. Note, that some advice says to use an option for font or fn which is for old-style bitmapped fonts only.

$ xterm -fa <truetype font> fs 12
$ xterm -fa "DejaVu Sans Mono"
$ xterm -fa "Ubuntu Mono" -fs 10


source: http://www.futurile.net/2016/06/14/xterm-setup-and-truetype-font-configuration/
