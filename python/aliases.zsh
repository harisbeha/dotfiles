# remove pyc files
alias pyclean='find . -type f -name "*.py[co]" -exec rm -f \{\} \; && find . -type d -name "__pycache__" | xargs rm -r && echo "Removed pycs and __pycache__"'

#py2 virtualenv
alias mkenv2='mkvirtualenv --python=/usr/local/bin/python'
#py3 virtualenv
alias mkenv3='mkvirtualenv --python=/usr/local/bin/python3'
