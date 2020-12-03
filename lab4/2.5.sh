#!/bin/bash

find ~/ -name "*.txt"
cat ~/*.txt | wc -l
ls -ls ~/*.txt | awk '{sum = sum + $6} END {print sum}'