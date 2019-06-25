# .bashrc

# Local functions
function de() { docker exec -it $1 bash; }

# Use as in appup aos-qa 1.1.5 -s MAIN_PORT=8000
function appup() { docker-app render admpresales/$1:$2 $3 $4 $5 $6 $7 $8 | docker-compose -p $1 -f - up -d; }
function appstart() { docker-app render admpresales/$1:$2 $3 $4 $5 $6 $7 $8 | docker-compose -p $1 -f - start; }
function appstop() { docker-app render admpresales/$1:$2 $3 $4 $5 $6 $7 $8 | docker-compose -p $1 -f - stop; }
function appdown() { docker-app render admpresales/$1:$2 $3 $4 $5 $6 $7 $8 | docker-compose -p $1 -f - down; }
function apprender() { docker-app render admpresales/$1:$2; }
function appinspect() { docker-app inspect admpresales/$1:$2; }

# Local aliases (use unalias to remove)
alias dstart="docker start "
alias dstop="docker stop "
alias di="docker images "
alias dsa="~/dockerstopall.sh"
alias daos="docker start aos_postgres;sleep 10;docker start aos_accountservice; sleep 10; docker start aos_main"
alias demo="docker start aos_postgres; sleep 10;docker start aos_accountservice; sleep 10; docker start aos_main; sleep 10; docker start octane; sleep 60; docker start devops; sleep 60; docker start sca; sleep 20; docker start ssc_db; sleep 10; docker start ssc; sleep 40; docker start intellij"
alias dsaos="docker stop aos_postgres aos_accountservice aos_main"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Image}}' "
alias dpsa="docker ps -a --format 'table {{.Names}}\t{{.Status}}\t{{.Image}}' "
alias lfts="/opt/leanft/bin/leanft start"
alias lftss="/opt/leanft/bin/leanft stop"
alias lftls="echo 'license-installer status'; /opt/leanft/Tools/license-installer status"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

