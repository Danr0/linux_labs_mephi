#!/bin/bash

printf "Домашний каталог пользователя"
whoami
printf "\nсодержит обычных файлов:\n"
find ~ -maxdepth 1  -type f -not -name ".*" -print  | wc -l
printf "скрытых файлов:\n"
find ~ -maxdepth 1  -type f -name ".*" -print  | wc -l