# SYNOPSIS
#   fullpath file
#
# DESCRIPTION
#   Returns the full path of file (e.g. fullpath x: /usr/bin/home/aj/x
#
fullpath() {
  echo $PWD/$1
}
