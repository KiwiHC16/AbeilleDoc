#! /bin/bash

echo "Generating HTML doc with Sphinx"

# Testing Sphinx installation
command -v sphinx-build >/dev/null
if [ $? -ne 0 ]; then
    echo "= ERR: 'sphinx-build' is either missing or not executable !"
    echo "=      'sphinx-build' is required for doc generation."
    exit 1
fi
command -v make >/dev/null
if [ $? -ne 0 ]; then
    echo "= ERR: 'make' is either missing or not executable !"
    echo "=      'make' is required for doc generation."
    exit 2
fi

#find . -name "._*" -exec rm {} \;
make html
if [ $? -ne 0 ]; then
    echo "= ERR: Generation failed"
    exit 3
fi
rm -rf docs/*
cp -r build/html/* docs

exit 0
