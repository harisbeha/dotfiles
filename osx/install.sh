
# Set OS X defaults
$ZSH/osx/set-defaults.sh
hostname=helios $ZSH/osx/set-machine-name.sh

sed -i '$ a\/usr/local/bin/zsh' /etc/shells
