# don't remove it, just help me to remind people of my city, the great city, SURABAYA
# hokagemadura, or the-cat, or ge, or whatever it is.. 

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

gtkrc="$HOME/.gtkrc-2.0"
GtkTheme=$( grep "gtk-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkIcon=$( grep "gtk-icon-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkFont=$( grep "gtk-font-name" "$gtkrc" | cut -d\" -f2 )

# Wallpaper set by feh
Wallpaper=$(cat ~/.fehbg | cut -c 16-70)

# Settings from ~/.Xdefaults
xdef="~/.Xresources"
TermFont=FiraMono8

# Time and date
time=$( date "+%H.%M")
date=$( date "+%a %d %b" )

# OS
OS=$(uname -r)
dist='Archlinux'
bit=$(uname -m)

# WM version
wm=herbstluftwm

# Other
UPT=`uptime | awk -F'( |,)' '{print $2}' | awk -F ":" '{print $1}'`
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
uptime2=$(uptime | sed -nr 's/.*\s+([[:digit:]]{1,2}):[[:digit:]]{2},.*/\1/p')
size=$(df | grep '^/dev/[hs]d' | awk '{s+=$2} END {printf("%.0f\n", s/1048576)}')
use=$(df | grep '^/dev/[hs]d' | awk -M '{s+=$3} END {printf("%.0f\n", s/1048576)}')
gb=$(echo "G")
pac=$(pacman -Qe | wc -l)
pacman=$(pacman -Q | wc -l)
COUNT=$(cat /proc/cpuinfo | grep 'model name' | sed -e 's/.*: //' | wc -l)
cpu=$(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | cut -c13-40)
#laptop=$(dmidecode | grep Product)
lap1=$(cat /sys/class/dmi/id/sys_vendor)
lap2=$(cat /sys/class/dmi/id/product_name)
vga=$(lspci | grep -i vga | cut -c62-75)
memkb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
ram=$(expr $memkb / 1024)

cat << EOF

$d$f4  $f1 $USER $f6@ $f3$HOSTNAME
$d$f4  $f2 $lap1 $lap2
$d$f4  $f3 $cpu
$d$f4                                          
$d$f4  $f4 OS    $f3» $f5$d$dist $bit
$d$f4  $f5 WM    $f3» $f6$d$wm
$d$f4  $f6 Font  $f3» $f7$d$TermFont
$d$f4  $f7 Theme $f3» $f8$d$GtkTheme
$d$f4  $f8 Icons $f3» $f5$d$GtkIcon
$d$f4  $f5 RAM   $f3» $f1$d$ram MB
$d$f4  $f1 VGA   $f3» $f2$d$vga
$d$f4  $f2 HD    $f3» $f3$size GB
$d$f4  $f3 up    $f3» $f4$d$uptime2 hrs
$d$f4  $f4 pac   $f3» $f5$d$pacman

EOF
