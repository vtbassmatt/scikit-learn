if [ -n "$MINICONDA_PATH" ]; then
    export PATH=$MINICONDA_PATH/bin:$PATH
    source activate testenv
fi

if [[ "$COVERAGE" == "true" ]]; then
    pip install coverage codecov
fi

if [[ "$RUN_FLAKE8" == "true" ]]; then
    conda install flake8 -y
fi

if [[ "$TEST_DOCSTRINGS" == "true" ]]; then
    pip install sphinx numpydoc
fi
