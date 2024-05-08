#!/bin/bash

set -e

clear

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[92m'
YELLOW='\e[33m'
ORANGE='\e[93m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[96m'
WHITE='\e[37m'
NC='\e[0m'
purpal='\033[35m'


clear

counter=0
(

while :
do
cat <<EOF
XXX
$counter
APT-Framework YÜKLENİYOR ....( $counter%):
XXX
EOF

(( counter+=20 ))
[ $counter -eq 100 ] && break

sleep 1
done
) |
whiptail --title "APT-Framework" --gauge "Lütfen bekleyin" 7 70 0



clear

echo -e "${RED} "
echo ""                                                                         
echo "   ___  ______ _____  ______                                           _        ";
echo "  / _ \ | ___ \_   _| |  ___|                                         | |       ";
echo " / /_\ \| |_/ / | |   | |_ _ __ __ _ _ __ ___   _____      _____  _ __| | __    ";
echo " |  _  ||  __/  | |   |  _| '__/ _` | '_ ` _ \ / _ \ \ /\ / / _ \| '__| |/ /    ";
echo " | | | || |     | |   | | | | | (_| | | | | | |  __/\ V  V / (_) | |  |   <     ";
echo " \_| |_/\_|     \_/   \_| |_|  \__,_|_| |_| |_|\___| \_/\_/ \___/|_|  |_|\_\    "; 
echo "                                                                                ";
echo "                                     APT-Framework Yükleyici'ye Hoşgeldiniz     ";
echo -e "${GREEN}===================================================================${NC} "                                                                                                                                                                                                                                
echo -e "${BLUE}           | github.com/umutsaglam/APT-Framework |                  ${NC} "
echo -e "${GREEN}===================================================================${NC} "
echo -e "${RED}                                   [!] Bu Araç ROOT Olarak Çalıştırılmalıdır [!]${NC}\n"
echo ""
echo -e "${CYAN}[>] APT-Framework'ü Kurmak İçin ENTER'a Basın, Çıkmak İçin CTRL+C'ye Basın.${NC}"
read INPUT
echo ""

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/APT-Framework"
    BIN_DIR="$PREFIX/usr/bin/"
    pkg install -y git python3
else
    INSTALL_DIR="/usr/share/doc/APT-Framework"
    BIN_DIR="/usr/bin/"
fi

echo "[✔] Dizinler kontrol ediliyor...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[!] Bir APT-Framework Dizini Bulundu.. Değiştirmek İster misiniz ? [e/h]:" ;
    read mama
    if [ "$mama" = "e" ]; then
        rm -R "$INSTALL_DIR"
    else
        exit
    fi
fi

echo "[✔] Kuruluyor...";
echo "";
git clone https://github.com/aptframework/APT-Framework.git "$INSTALL_DIR";
echo "#!/bin/bash
python3 $INSTALL_DIR/aptframework.py" '${1+"$@"}' > APT-Framework;
chmod +x APT-Framework;
sudo cp APT-Framework /usr/bin/;
rm APT-Framework;


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
        echo "[✔] Başarıyla Kuruldu !!! \n\n";
        echo -e $GREEN "       [+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
        echo            "       [+]                                                             [+]"
        echo -e $GREEN "       [+]  Artık Terminalde Yazarak Çalıştırabilirsiniz (APT-Framework) [+]"
        echo            "       [+]                                                             [+]"
        echo -e $GREEN "       [+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
else
    echo "[✘] Kurulum Başarısız, Lütfen Tekrar Düzgün Bir Şekilde Deneyin !!! [✘]";
    exit
fi
