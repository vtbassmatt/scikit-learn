set -e

if [ -n "$MINICONDA_PATH" ]; then
    export PATH=$MINICONDA_PATH/bin:$PATH
    source activate testenv
fi

if [[ "$COVERAGE" == "true" ]]; then
    # Need to run codecov from a git checkout, so we copy .coverage
    # from TEST_DIR where pytest has been run
    cp $TEST_DIR/.coverage $BUILD_SOURCESDIRECTORY
    cd $BUILD_SOURCESDIRECTORY
    coverage xml -o coverage.xml
    # Ignore codecov failures as the codecov server is not
    # very reliable but we don't want travis to report a failure
    # in the github UI just because the coverage report failed to
    # be published.
    #codecov || echo "codecov upload failed"
fi
