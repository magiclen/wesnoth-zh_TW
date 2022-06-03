#!/bin/bash

if [[ -d mo ]]; then
    rm -rf mo/*
else
    mkdir mo
fi

if [[ -d po_upload ]]; then
    rm -rf po_upload/*
else
    mkdir po_upload
fi

for po in ./po/*.po; do
    filename=$(basename -- "$po")
    filename_noext=${filename%.*}
    
    # convert
    msgfmt "$po" -o "./mo/${filename_noext}.mo"
    
    # rearrange
    f="po_upload/${filename_noext}"
    mkdir "${f}"
    cp "${po}" "${f}/zh_TW.po"
done
