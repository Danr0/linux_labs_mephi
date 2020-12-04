total 0
l-wx------ 1 root root 64 Dec  4 18:37 0 -> /tmp/ls.in
l-wx------ 1 root root 64 Dec  4 18:37 1 -> /tmp/ls.out
l-wx------ 1 root root 64 Dec  4 18:37 2 -> /tmp/ls.err
lr-x------ 1 root root 64 Dec  4 18:37 3 -> /proc/34628/fd

because of
l-wx------ 1 root root 64 Dec  4 18:58 3 -> /root/test.out
lr-x------ 1 root root 64 Dec  4 18:58 4 -> /root/test.out


cat < ~/fifo1
first get output, second not



 (pos: 14)
root@parrot-virtual:~# cat -A ~/test.out
Test3$
Test333$
	






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
