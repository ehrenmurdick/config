BOLD_AND_UNDERLINED=”\e[1;4m”
GREEN=”\e[32m”
STANDARD=”\e[0m”
TODO_LIST_LABEL=”\n — — — — — — — — — — — -TODO — — — — — — — — — — — — -\n”
TODO_LIST_END=” — — — — — — — — — — — — — — — — — — — — — — — — — — \n\n”
TASKS_DIR=~/TODO/outstanding_tasks/
COMPLETED_DIR=~/TODO/completed_tasks/
function todo {
 if [ -z “$1” ]
 then
 printf “${TODO_LIST_LABEL}”
 find ${TASKS_DIR} -not -path ‘*/\.*’ -type f -execdir echo ‘{}’ ‘;’ | nl -s ‘[] ‘ -b n
 printf “${TODO_LIST_END}”
 else
 touch ${TASKS_DIR}”${*}”
 todo
 fi
}
_fin () {
 IFS=$’\n’ tmp=( $(compgen -W “$(ls “${TASKS_DIR}”)” — “${COMP_WORDS[$COMP_CWORD]}” ))
 COMPREPLY=( “${tmp[@]// /\ }” )
 IFS=$’ ‘
}
function fin
{
 if ! [ -z "$1" ] && [ -a ${TASKS_DIR}"${*}" ]
 then
 mv ${TASKS_DIR}"$1" ${COMPLETED_DIR}
 todo
 printf “ ${GREEN}DONE ${STANDARD}with ${BOLD_AND_UNDERLINED}$1${STANDARD}\n\n”
 else
 echo -e “\nusage: fin [existing task to complete]\n”
 fi
}
complete -o default -F _fin fin
