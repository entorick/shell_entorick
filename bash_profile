if [ "${BASH-no}" != "no" ]; then  
    [ -r ~/.bashrc ] && . ~/.bashrc  
fi

#startecho 看另外的代码
export DISPLAY=:0 && /bin/sh /home/work/local/bin/startecho.sh
export PS1="\[\e[32;1m\]\u\[\e[40;1m\]@\[\e[36;1m\]\H:\w\[\e[0;m\]$ \[\e[32;1m\]\n-->"

