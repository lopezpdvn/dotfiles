export USER=$(id -un)
export USERNAME=$USER
export HOST=$(uname -n)

# Remove domain from HOST. Ex: /[dir]/HOSTNAME -> HOSTNAME
export HOSTNAME=$(echo "${HOST}" | sed -e 's/\..*$//g')

printf "Sourcing $USER@$HOSTNAME posixshell profile\n"

export SHELL="/bin/mksh"
export SHELLNAME=$(echo "${SHELL}" | sed -e 's/^\/.*\///g')

# It is not an error to reference unset parameters.
set +u

LOGINSHELL=true

export USERID=$(id -u)
export PS1="$(if test 0 != ${USERID}; then printf "\$"; else printf "#"; fi) "

# Keep the original PATH.
if [ -z "${OLDPATH}" ]
then
    export OLDPATH="${PATH}"
fi

# Default options passed to PAGER.
export LESS='-r -M'

# less set as default pager.
export PAGER="less"

export EDITOR='vim'

who

# vim: ft=sh
