#!/bin/bash

printf "Процессов пользователя:\n"
whoami
ps aux -u "$(whoami)" | wc -l
printf "Процессов пользователя root:\n"
ps aux -u root | wc -l