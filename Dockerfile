ARG CUDA_VERSION="12.6.0"
ARG CUDNN="" # "" or "-cudnn"
ARG FLAVOR="-devel" # "-devel" or "-runtime" or "-base"
ARG VARIANT="-ubuntu24.04"
FROM nvidia/cuda:${CUDA_VERSION}${CUDNN}${FLAVOR}${VARIANT}