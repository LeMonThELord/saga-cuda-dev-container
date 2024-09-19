ARG CUDA_VERSION="12.6.0"
ARG CUDNN="" # "" or "-cudnn"
ARG FLAVOR="-devel" # "-devel" or "-runtime" or "-base"
ARG VARIANT="-ubuntu24.04"
FROM nvidia/cuda:${CUDA_VERSION}${CUDNN}${FLAVOR}${VARIANT}

ARG USERNAME=${USERNAME:-vscode}
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# # Create the user
# RUN groupadd --gid $USER_GID $USERNAME
# RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
# # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
# RUN apt-get update && apt-get install -y sudo
# RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
# RUN chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME