# SYNOPSIS
#   fullpath file
#
# DESCRIPTION
#   Returns the full path of file (e.g. fullpath x: /usr/bin/home/aj/x
#
htmlofman() {
  man $1 | man2html > $1.html; $BROWSER $1.html
}
