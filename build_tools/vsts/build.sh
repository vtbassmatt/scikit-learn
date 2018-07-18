if [ -n "$MINICONDA_PATH" ]; then
    export PATH="$MINICONDA_PATH/bin:$PATH"
    source activate testenv
fi

python --version
python -c "import numpy; print('numpy %s' % numpy.__version__)"
python -c "import scipy; print('scipy %s' % scipy.__version__)"

python setup.py develop
