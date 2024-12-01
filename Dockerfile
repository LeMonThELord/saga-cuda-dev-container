ARG CUDA_VERSION="12.6.2"
# "" or "-cudnn"
ARG CUDNN=""
# "-devel" or "-runtime" or "-base"
ARG FLAVOR="-devel"
# "" or "-ubuntu18.04" or "-ubuntu20.04" or "-ubuntu22.04" or "-ubuntu24.04"
ARG VARIANT="-ubuntu24.04"
FROM nvidia/cuda:${CUDA_VERSION}${CUDNN}${FLAVOR}${VARIANT}

ARG USERNAME=${USERNAME:-saga}
USER $USERNAME
