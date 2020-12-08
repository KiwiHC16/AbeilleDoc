#/bin/bash

#find . -name "._*" -exec rm {} \;
make html
if [ $? -ne 0 ]; then
    echo "= ERR: Generation failed"
    exit 1
fi
rm -rf docs/*
cp -r build/html/* docs



