wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
MINICONDA_PATH=$BUILD_BINARIESDIRECTORY/miniconda
chmod +x miniconda.sh && ./miniconda.sh -b -p $MINICONDA_PATH
echo "##vso[task.setvariable variable=MINICONDA_PATH]$MINICONDA_PATH"
export PATH=$MINICONDA_PATH/bin:$PATH
conda update --yes conda

TO_INSTALL="python=$PYTHON_VERSION pip pytest pytest-cov \
            numpy=$NUMPY_VERSION scipy=$SCIPY_VERSION \
            cython=$CYTHON_VERSION"

if [[ "$INSTALL_MKL" == "true" ]]; then
    TO_INSTALL="$TO_INSTALL mkl"
else
    TO_INSTALL="$TO_INSTALL nomkl"
fi

if [[ -n "$PANDAS_VERSION" ]]; then
    TO_INSTALL="$TO_INSTALL pandas=$PANDAS_VERSION"
fi

if [[ -n "$PYAMG_VERSION" ]]; then
    TO_INSTALL="$TO_INSTALL pyamg=$PYAMG_VERSION"
fi

if [[ -n "$PILLOW_VERSION" ]]; then
    TO_INSTALL="$TO_INSTALL pillow=$PILLOW_VERSION"
fi

conda create -n testenv --yes $TO_INSTALL
