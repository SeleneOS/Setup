echo "Installing packages"
sh installpackages.sh

echo "Installing system files"
sudo cp -r etc/* /etc

echo "Creating home directories"
mkdir -p ~/testing ~/downloads ~/repos/$USER ~/documents ~/music ~/pictures/screenshots ~/videos

echo "Creating temporary folder /tmp/selene_setup"
mkdir -p /tmp/selene_setup && cd /tmp/selene_setup
echo "Downloading dotfiles_setup"
git clone --recursive https://github.com/SeleneOS/dotfiles_setup.git
echo "Copying files to home directory"
cp -rf dotfiles_setup /home/$USER

echo "Adding some color to pacman"
sudo sed -i "/#Color/c\Color" /etc/pacman.conf

echo "Disabling password for sudo"
sudo sed -i "/# %wheel ALL=(ALL) NOPASSWD: ALL/c\%wheel ALL=(ALL) NOPASSWD: ALL" /etc/sudoers