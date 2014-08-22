# VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# # Locate virtualenvwrapper binary
# if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
#     export VENVWRAP=~/.local/bin/virtualenvwrapper.sh
# else
# 	export VENVWRAP=/usr/local/bin/virtualenvwrapper.sh
# fi

# if [ ! -z $VENVWRAP ]; then
#     # virtualenvwrapper -------------------------------------------
#     # make sure env directory exists; else create it
#     [ -d $HOME/.virtualenvs ] || mkdir -p $HOME/.virtualenvs
#     export WORKON_HOME=$HOME/.virtualenvs
#     source $VENVWRAP

#     # virtualenv --------------------------------------------------
#     export VIRTUALENV_USE_DISTRIBUTE=true

#     # pip ---------------------------------------------------------
#     export PIP_VIRTUALENV_BASE=$WORKON_HOME
#     export PIP_REQUIRE_VIRTUALENV=true
#     export PIP_RESPECT_VIRTUALENV=true
#     export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# fi

# remove pyc files
alias pyclean='find . -type f -name "*.py[co]" -exec rm -f \{\} \; && find . -type d -name "__pycache__" | xargs rm -r && echo "Removed pycs and __pycache__"'

#py2 virtualenv
alias mkenv2='mkvirtualenv --python=/usr/local/bin/python'
#py3 virtualenv
alias mkenv3='mkvirtualenv --python=/usr/local/bin/python3'
