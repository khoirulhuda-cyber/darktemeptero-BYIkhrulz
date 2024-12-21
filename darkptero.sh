#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}|-----------------------------------------------|${NC}"
  echo -e "${BLUE}|                                               |${NC}"
  echo -e "${BLUE}|               AUTO INSTALLER THEMA            |${NC}"
  echo -e "${BLUE}|                 © Rulz OFFC                   |${NC}"
  echo -e "${BLUE}|                                               |${NC}"
  echo -e "${BLUE}|-----------------------------------------------|${NC}"
  echo -e ""
  sleep 4
  clear
}

#Update and install jq
install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}                    UPDATETING                   ${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}                UPDATE DONE                      ${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}                      GAGAL                      ${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}               LICENSZ RULZ OFFC                 ${NC}"
  echo -e "                                                       "
  TOKEN=$(jq -r '.token' token.json)

  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "rulz" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}}"
  else
    echo -e "${GREEN}AKSES GAGAL${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}                 Berurutan 3 2 1                 ${NC}"
    echo -e "                                                       "
    echo -e "NOTE : PAS INSTAL BLUEPRINT KALIAN PENCET A TERUS ENTER"
    echo "1. install tema darkenate"
    echo "2. run blueprint"
    echo "3. install blueprint"
    echo "4. i???????"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x32\x2E\x7A\x69\x70")
        break
        ;;
      2)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x31\x2E\x7A\x69\x70")
        break
        ;;
      3)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x33\x2E\x7A\x69\x70")
        break
        ;; 
      4)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x33\x2E\x7A\x69\x70")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
  
if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
if [ "$SELECT_THEME" -eq 1 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}                INSTALLASI THEMA               ${NC}"
  echo -e "                                                       "
  cd /var/www/pterodactyl
  wget https://github.com/JasonHorkles/darkenate/releases/download/v2.0.2/darkenate.blueprint
  blueprint -install darkenate

  echo -e "                                                       "
  echo -e "${GREEN}                 INSTALL BERHASIL                ${NC}"
  echo -e ""
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 2 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}      MENJALANKAN BLUEPRINT TUNGGU SEBENTAR      ${NC}"
  echo -e "                                                       "
  cd /var/www/pterodactyl
  chmod +x blueprint.sh
  bash blueprint.sh
  

  echo -e "                                                       "
  echo -e "${GREEN}              BERHASIL MENJALANKAN               ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return
  
elif [ "$SELECT_THEME" -eq 4 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}      MENGINSTALL TEMA DACTYL PREMIUM      ${NC}"
  echo -e "                                                       "
  sudo apt update -y
  sudo apt install npm
  npm i -g yarn
  cd /var/www/
  git clone https://github.com/khoirulhuda-cyber/darktemeptero-BYIkhrulz
  cd darktemeptero-BYIkhrulz
  unzip -o dactyl.zip -d /var/www
  cd /var/www/pterodactyl
  sudo npm install -g n
  sudo n lts
  yarn install
  yarn run build:production
  
  

  echo -e "                                                       "
  echo -e "${GREEN}              BERHASIL MENJALANKAN               ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 5 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}      MENGINSTALL TEMA DACTYL PREMIUM      ${NC}"
  echo -e "                                                       "
  sudo apt update -y
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  npm i -g yarn
  apt install nodejs -y
  apt install npm -y
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn
  php artisan billing:install stable
  yarn build:production

  echo -e "                                                       "
  echo -e "${GREEN}              BERHASIL MENJALANKAN               ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 3 ]; then
  echo -e "                                                       "
  echo -e "${BLUE}               INSTALLASI BLUEPRINT              ${NC}"
  echo -e "                                                                   "

  sudo apt-get install -y ca-certificates curl gnupg
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
  apt-get update
  apt-get install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn
  yarn add cross-env
  sudo apt install -y zip unzip git curl wget
  wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip
  unzip release.zip

  echo -e "                                                       "
  echo -e "${GREEN}                  INSTALL BERHASIL               ${NC}"
  echo -e ""
  sleep 5
else
  echo ""
  echo "Pilihan tidak valid. silahkan pilih 1/2/3."
fi
}


# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}                    DELETE THEME                 ${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/Foxstoree/pterodactyl-auto-installer/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}                 DELETE THEME SUKSES             ${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# Main script
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                       "
  echo -e "${BLUE}                   SELECT OPTION                 ${NC}"
  echo -e "                                                       "
  echo -e "SELECT OPTION :"
  echo "1. Install theme dan blueprint"
  echo "2. Uninstall theme"
  echo "x. Exit"
  echo -e "Masukkan pilihan (1/2/x):"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
    x)
      echo "Selamat Tinggal My Master :) "
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
