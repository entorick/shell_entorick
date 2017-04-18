if [ "${BASH-no}" != "no" ]; then  
    [ -r ~/.bashrc ] && . ~/.bashrc  
fi

# 显示git分支
find_git_branch () {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch=" → ${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch=" → (detached)"
            else
                git_branch=" → (unknow)"
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
export PS1="\[\e[32;1m\]\u\[\e[40;1m\]@\[\e[36;1m\]\H:\w\[\e[0;m\]$ \[\e[32;1m\]\$git_branch\n-->"

#startecho 看另外的代码
export DISPLAY=:0 && /bin/sh /home/work/local/bin/startecho.sh
#export PS1="\[\e[32;1m\]\u\[\e[40;1m\]@\[\e[36;1m\]\H:\w\[\e[0;m\]$ \[\e[32;1m\]\n-->"

#export LS_OPTIONS='--color=auto' 
#export CLICOLOR='Yes' 
#export LSCOLORS='Exfxcxdxbxegedabagacad'
