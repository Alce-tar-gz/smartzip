#!/usr/bin/env bash
outputfile=$1
echo "filename: $outputfile"
if [[ "$outputfile" == *.zip ]]; then
  filetype="zip"
  echo "filetype: zip"
  mkdir -p /tmp/smartzip/"$outputfile"
  unzip "$outputfile" -d /tmp/smartzip/"$outputfile"
  env -C /tmp/smartzip/"$outputfile" bash
  zip -r ./"$outputfile"_new.zip /tmp/smartzip/"$outputfile"/*
fi
