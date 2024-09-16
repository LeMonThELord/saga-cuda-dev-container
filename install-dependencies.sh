# System dependencies installation script

# Update and upgrade system
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# Install basic dependencies
sudo apt install -y build-essential git curl wget unzip

# Install Python
sudo apt install -y python3-full pipx && pip install --upgrade pip && pipx ensurepath

# Install uv
pipx install uv

# Install tldr help pages
pipx install tldr && tldr --update

# Install CMake
sudo apt install -y ca-certificates gpg wget
test -f /usr/share/doc/kitware-archive-keyring/copyright || wget -O - https: //apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
sudo apt update
test -f /usr/share/doc/kitware-archive-keyring/copyright || sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg
sudo apt install kitware-archive-keyring -y
sudo apt install cmake -y

# Install Miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# Install Omakub but without the GUI
wget -qO- https://omakub.org/install | bash
