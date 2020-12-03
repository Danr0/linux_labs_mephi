#!/bin/bash

printf "Каталоги:\n"
ls -l "$1" | grep ^d

printf "Обычные файлы:\n"
ls -l "$1" | grep ^-

printf "Символьные ссылки:\n"
ls -l "$1" | grep ^l

printf "Символьные устройства:\n" #character file
ls -l "$1" | grep ^c

printf "Блочные устройства:\n"
ls -l "$1" | grep ^b