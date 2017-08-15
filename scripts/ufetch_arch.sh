#!/bin/sh
#
# ufetch-arch - tiny system info for arch linux
#

## INFO

# user is already defined
hostname="$(hostname)"
os='Arch Linux'
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename ${SHELL})"
if [ -z "${WM}" ]; then
	WM="$(echo Herbstluftwm)"
fi

## DEFINE COLORS

# probably don't change these		# bold
c0="$(tput setaf 0)"	# black
c1="$(tput setaf 1)"	# red
c2="$(tput setaf 2)"	# green
c3="$(tput setaf 3)"	# yellow
c4="$(tput setaf 4)"	# blue
c5="$(tput setaf 5)"	# magenta
c6="$(tput setaf 6)"	# cyan
c7="$(tput setaf 7)"	# white
rc="$(tput sgr0)"		# reset

# you can change these
lc="${rc}${bc}${c4}"	# labels
nc="${rc}${bc}${c4}"	# user and hostname
ic="${rc}${bc}${c7}"	# info
fc="${rc}${bc}${c4}"	# first color
sc="${rc}${c4}"			# second color

## OUTPUT

cat <<EOF


${fc}        /\        ${nc}${USER}${ic}@${nc}${hostname}${rc}
${fc}       /^^\       ${lc}OS:        ${ic}${os}${rc}
${fc}      /\   \      ${lc}KERNEL:    ${ic}${kernel}${rc}
${fc}     /  ${sc}__  \     ${lc}UPTIME:    ${ic}${uptime}${rc}
${sc}    /  (  )  \    ${lc}PACKAGES:  ${ic}${packages}${rc}
${sc}   / __|  |__\\\\   ${lc}SHELL:     ${ic}${shell}${rc}
${sc}  ///        \\\\\  ${lc}WM:        ${ic}${WM}${rc}


EOF
