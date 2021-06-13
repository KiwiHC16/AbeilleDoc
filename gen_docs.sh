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

make html
if [ $? -ne 0 ]; then
    echo "= ERR: Generation failed"
    exit 3
fi

# Updating "docs" directory
# WARNING: This directory must NOT be removed. It contains "products" sub-dir which is NOT auto-generated.
# Tcharp38 TODO: Better copying new/updated files only & check those to be deleted
rm -rf docs/_images
rm -rf docs/_static
rm -f docs/*.html
cp -r build/html/* docs

exit 0
