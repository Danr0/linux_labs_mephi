#!/bin/bash

o1=$(whoami)
o2=$(echo ~)
echo "$o1 $o2 $((${#o1}+${#o2}))"