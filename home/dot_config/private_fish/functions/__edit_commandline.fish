function __edit_commandline -d 'Open current commandline with your editor'
  set -l tmp (mktemp /tmp/fish-fc.XXXXXX)
  commandline > $tmp
  eval $EDITOR $tmp
  if [ -s $tmp ]
    cat $tmp | read -l cmd
    commandline -r "$cmd"
  else
    commandline ''
  end
  rm $tmp
end
