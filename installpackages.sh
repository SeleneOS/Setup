echo "Installing all packages"
sudo pacman -Sy --needed --noconfirm --force $(cat packagelist)

if [ ! -f /usr/bin/yay ]; then
    echo "Installing Yay"
    git clone https://aur.archlinux.org/yay.git && cd yay
    makepkg -si --noconfirm && cd .. && rm -rf yay
fi

echo "Updating system"
yay --noconfirm --needed

yay -S --noconfirm --needed $(cat packagelist.aur)