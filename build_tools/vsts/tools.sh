if [ -n "$MINICONDA_PATH" ]; then
    export PATH="$MINICONDA_PATH/bin:$PATH"
    source activate testenv
else
    pip install -r build_tools/vsts/requirements.txt
fi

if [[ "$COVERAGE" == "true" ]]; then
    pip install coverage codecov
fi

if [[ "$RUN_FLAKE8" == "true" ]]; then
    pip install flake8
fi

if [[ "$TEST_DOCSTRINGS" == "true" ]]; then
    pip install sphinx numpydoc
fi
