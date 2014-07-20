# Does my python module exist?
try() {
    python -c "exec 'try: import ${1} as _; print _.__file__\nexcept Exception, e: print e'"
}

# change to python package directory
cdp() {
    MODULE_DIRECTORY=`python -c "exec 'try: import os.path as _, ${1}; print _.dirname(_.realpath(${1}.__file__))\nexcept Exception, e: print e'"`
    if [[ -d $MODULE_DIRECTORY ]]; then
        cd $MODULE_DIRECTORY
    else
        echo "Module ${1} was not found or is not importable: $MODULE_DIRECTORY"
    fi
}