# SYNOPSIS
#   pacregex <operation> package
# DESCRIPTION
#   install\removes\info packages matching some regex 
#   installation sources includes AUR
#
#
#   
#   
#   
#
#   
#   
#   
#
# EXAMPLES
#   pacregex -R git-      
#   pacregex -S git-
#   pacregex -I git-
#   manopt sort reverse   
#   manopt find -print    
#   manopt find '-exec.*' 

function pacregex()
{
    case $1 in
	    -R) pacaur -Rcs $(pacaur -Qsq "$2");;
	    -S) pacaur -S $(pacaur -Ssq "$2");;
	    -I) pacaur -Si $(pacaur -Ssq "$2");;
    esac		   
		   
}

