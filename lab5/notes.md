1) Мы устанавливаем для данного скрипта выполнение команды 'echo "Аварийное завершение..."; exit 1' при получения сигнала `SIGINT` (`Ctr+C`). При вызове прерывания выполняется данная команда.
2) `$$` - специальная переменная баша, она адресует на pid баша. То есть выполняется: `ls -l /proc/pid-of-bash`. Когда мы делаем вызов ` ls -l /proc/self`, этот вызов происходит при помощи нового процесса ls, аналогично: `ls -l /proc/pid-of-ls`. Данные pid отличаются, поэтому вывод разный.
3) 
```
total 0
lrwx------ 1 user user 64 Dec  4 20:09 0 -> /dev/pts/0  # stdin
lrwx------ 1 user user 64 Dec  4 20:09 1 -> /dev/pts/0  # stdout
lrwx------ 1 user user 64 Dec  4 20:09 2 -> /dev/pts/0	# stderr

```
4) Данные дискрипторы изменяются, и программа производит вывод по ним (в файлы)
```
total 0
l-wx------ 1 root root 64 Dec  4 18:37 0 -> /dev/pts/0
l-wx------ 1 root root 64 Dec  4 18:37 1 -> /tmp/ls.out
l-wx------ 1 root root 64 Dec  4 18:37 2 -> /tmp/ls.err
```

5) При изменении дискриптора в зависимости потока (ввод или вывод) также меняются права на файле:
Для входящих `lr-x`, для выводящих `l-wx`
```
~$ ls -l /proc/self/fd > /tmp/ls.out 2> /tmp/ls.err 0</tmp/ls.in
~$ cat /tmp/ls.out
total 0
lr-x------ 1 user user 64 Dec  4 20:22 0 -> /tmp/ls.in
l-wx------ 1 user user 64 Dec  4 20:22 1 -> /tmp/ls.out
l-wx------ 1 user user 64 Dec  4 20:22 2 -> /tmp/ls.err
lr-x------ 1 user user 64 Dec  4 20:22 3 -> /proc/730/fd

```
6) Команда exec не создает новый процес (дочерний для sh при изапуске в нем). Она заменяет процесс в котором запущена (поэтому мы не видим sh, его заменил exec). После этого оно возвращает выполнение.


7) pos означает номер позици дискриптора в файле (номер сивола на котором он сейчас установлен). Мы записали в файл 5+7=13 символов(байт). И значит дескриптор остановился на следующем сиволе, то есть на 14.
```
root@parrot-virtual:~# cat ~/test.out
Test3
Test333
```	


8) Да, возможно. Потому что, команда rm не удаляет файл, а убирает ссылку на него из директории. Данные при не удаляются. У нас есть вторая ссылка на него (которая сохранена в дискрипторе), через которую мы и получаем доступ к данным.

```
root@parrot-virtual:~# ls -l /proc/$$/fd
total 0
lrwx------ 1 root root 64 Dec  4 18:58 0 -> /dev/pts/0
lrwx------ 1 root root 64 Dec  4 18:58 1 -> /dev/pts/0
lrwx------ 1 root root 64 Dec  4 18:58 2 -> /dev/pts/0
lrwx------ 1 root root 64 Dec  4 18:58 255 -> /dev/pts/0
l-wx------ 1 root root 64 Dec  4 18:58 3 -> '/root/test.out (deleted)'
lr-x------ 1 root root 64 Dec  4 18:58 4 -> '/root/test.out (deleted)'
root@parrot-virtual:~# cat ~/test.out 
cat: /root/test.out: No such file or directory
root@parrot-virtual:~# cat <&4
Test3
Test333
```
