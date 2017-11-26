

################################################################################
# Futurama Fortune
################################################################################

shufExists=false;
xcowsayExists=false;

if ! [ -f $HOME/.futurama ]; then
echo "Downloading futurama quotes"
curl -s https://raw.githubusercontent.com/vsbuffalo/good-news-everyone/master/futurama.txt > $HOME/.futurama
fi


if ! [ -x "$(command -v shuf)" ]; then
echo 'Error: shuf is not installed.'>&2
  exit 1
else
shufExists=true;
fi

if ! [ -x "$(command -v xcowsay)" ]; then
echo 'Error: xcowsay is not installed.'>&2
  exit 1
else
xcowsayExists=true;
fi

if [ $shufExists=true ] && [ $xcowsayExists=true ]; then
  shuf -n1 $HOME/.futurama | xcowsay --time=1
fi
