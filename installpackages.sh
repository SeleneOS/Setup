echo "Installing Yay"
git clone https://aur.archlinux.org/yay.git && cd yay
sudo makepkg -si && cd .. && rm -rf yay

echo "Updating system"
yay

echo "Installing all packages"
sudo pacman -S --needed --force $(cat packagelist) --noconfirm

yay -S $(cat packagelist.aur) --nocofirm