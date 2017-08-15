#!/bin/sh
## INFO
 
# user is already defined
HOST="$(hostname)"
OS="Arch Linux" #check /etc/os-release
CPU="$(awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | sed 's/ @/\n/' | head -1 | head -c -4)"
KERNEL="$(uname -srm)"
UPTIME="$(uptime -p | sed s:"up "::)"
PACKAGES="$(pacman -Q | wc -l)"
# shell is already defined
WM="$(echo herbstluftwm)"
 
## DEFINE COLORS
 
# probably don't change these
bc="$(tput bold)"   # bold
c0="$(tput setaf 0)"    # black
c1="$(tput setaf 1)"    # red
c2="$(tput setaf 2)"    # green
c3="$(tput setaf 3)"    # yellow
c4="$(tput setaf 4)"    # blue
c5="$(tput setaf 5)"    # magenta
c6="$(tput setaf 6)"    # cyan
c7="$(tput setaf 7)"    # white
rc="$(tput sgr0)"   # reset
 
# you can change these
lc="${bc}${c6}"     # labels
nc="${bc}${c6}"     # user and hostname
tc="${bc}${c7}"     # text
fc="${bc}${c6}"     # first color
sc="${c6}"      # second color
 
## OUTPUT
cat << "EOF"
                  .---.         ,,
       ,,        /     \       ;,,'
      ;, ;      (  o  o )      ; ;
        ;,';,,,  \   ~ /      ,; ;
     ,,,  ;,,,,;;,`   '-,;'''',,,'
    ;,, ;,, ,,,,   ,;  ,,,'';;,,;''';
       ;,,,;    ~~'  '';,,''',,;''''
                          '''
EOF
cat << EOF
${lc}OS:${rc}       ${tc}${OS}${rc}
${lc}KERNEL:${rc}   ${tc}${KERNEL}${rc}
${lc}CPU:${rc}   ${tc}${CPU}${rc}
${lc}UPTIME:${rc}   ${tc}${UPTIME}${rc}
${lc}PACKAGES:${rc} ${tc}${PACKAGES}${rc}
${lc}SHELL:${rc}    ${tc}${SHELL}${rc}
${lc}WM:${rc}       ${tc}${WM}${rc}
EOF