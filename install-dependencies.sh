# System dependencies installation script

# Add saga user to sudoers
echo "saga ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/saga
sudo usermod -aG sudo saga

# Modify the access rights of the workspaces
sudo chmod -R u+rw /workspaces

# Update CUDA gpg key
sudo rm /etc/apt/sources.list.d/cuda.list
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb && sudo dpkg -i cuda-keyring_1.1-1_all.deb && sudo rm cuda-keyring_1.1-1_all.deb
# Update CUDA Use of Linux Perf
sudo sh -c 'echo kernel.perf_event_paranoid=2 > /etc/sysctl.d/local.conf'
# Install CUDA Nsight Tools
sudo apt install -y cuda-nsight-12-6


# Update and upgrade system
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

# Install basic dependencies
sudo apt install -y build-essential git curl wget unzip

# Install Python
ln -s /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime
DEBIAN_FRONTEND="noninteractive" TZ="Asia/Hong_Kong" sudo -E apt install -y python3-full pipx tldr && pipx ensurepath

# Install uv
pipx install uv

# Update tldr help pages
tldr --update

# Install CMake
sudo apt install -y wget cmake

# Install Omakub but without the GUI
rm -rf ~/.local/share/omakub
mkdir -p ~/.local/share/omakub
git clone https://github.com/SagaciousFish/omakub-headless-fix.git ~/.local/share/omakub
source ~/.local/share/omakub/install.sh

# wget -qO- https://omakub.org/install | bash
