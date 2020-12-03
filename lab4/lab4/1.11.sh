#!/bin/bash

printf "Каталоги:\n"
ls -l . | grep ^d

printf "Обычные файлы:\n"
ls -l . | grep ^-

printf "Символьные ссылки:\n"
ls -l . | grep ^l

printf "Символьные устройства:\n" #character file
ls -l . | grep ^c

printf "Блочные устройства:\n"
ls -l . | grep ^b