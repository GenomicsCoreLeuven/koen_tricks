# Koen Tricks and Scripts

Tool list:

 - cgrep.sh

 - cless.sh

 - koen_tricks.sh

 - ls_names.sh

 - viewer_csv.sh

 - viewer_html.sh

 - viewer_md.sh

 - viewer_tsv.sh



## *cgrep*

A modified version of grep

Usage:
```bash
cgrep pattern file
```
Parameters:

 - pattern	the pattern or string to search

 - file       	the file to search in

 - \-\-h		*cgrep \-\-h* : the help of grep



## *cless*

A modified version of less, to use with cgrep

Usage:
```bash
cless file
cgrep pattern file | cless
```
Parameters:

 - file       	the file to display

 - \-\-h		*cless \-\-h* : the help of less



## koen_tricks

This script generates a help page for all other tools in this package

Usage:
```bash
koen_tricks
```

Parameters:

 - \-mute		Only generate the README.md file



## *ls_names*

This script is a ls, but changes the user numbers into names

Usage:
```bash
ls_gc
```


## *viewer_csv*

A clear view of csv files

Usage:
```bash
viewer_csv file.csv
```
Parameters:

 - file.csv	the CSV file to view


## *viewer_html*

A clear view of HTML files

Note: this viewer can not render images. To see images, please use a GUI browser (like firefox).
	The best way to do this, is to download the file, and view it locally.

Usage:
```bash
viewer_html file.html
```
Parameters:

 - file.html       the HTML file to view


## *viewer_md*

A clear view of md files (mark-down)

Usage:
```bash
viewer_md file.md
```
Parameters:

 - file.md       the MD file to view


## *viewer_tsv*

A clear view of tsv files

Usage:
```bash
viewer_tsv file.tsv
```
Parameters:

 - file.tsv       the TSV file to view

