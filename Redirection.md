# Unix Redirection and ```2>&1```
- Starting with ``` > /dev/null 2>&1```
- To redirect the ```stdout``` and ```stderr```
- If there is not file descriptor specified in the left hand side of ```>```, it will use the stdout from the left hand side program 
- ```2>&1``` should mean stderr redirect to ```&1```, which mean the stdout
## But why ```&1``` ???
- It may because the left hand side of ```>``` must be a **file descriptor**, but he right hand side of ```>``` should be a filename, such as ```file.txt```, so if we use ```2>1```, the result will become to **redirect the stderr to a file called 1**, so we need ```&``` to specify ```1``` is a file descriptor

## Strange things
- In ```man bash```, the order of redirect operator is from left to right, so ```>/dev/null 2>&1``` will process ```>/dev/null```  then ```2>&1```
- Note that the order of redirections is significant. For example, the command

```ls > dirlist 2>&1```

directs both standard output and standard error to the file dirlist,
while the command

```ls 2>&1 > dirlist```

directs only the standard output to file dirlist, because the standard
error was duplicated as standard output before the standard output was
redirected to dirlist.

- Let's talk about ```dup()``` , ```open()``` and ```close()```: 
    - The ```dup()``` system call creates a copy of the file descriptor oldfd, using the **lowest-numbered unused file descriptor** for the new descriptor.
    - The open() system call opens the file specified by pathname.  If the
       specified file does not exist, it may optionally (if O_CREAT is
       specified in flags) be created by open(). The return value of open() is a file descriptor, a small, nonnegative integer that is used in subsequent system calls (read(2), write(2), lseek(2), fcntl(2), etc.) to refer to the open file.  The file descriptor returned by a successful call will be the **lowest-numbered
       file descriptor** not currently open for the process.
    - The ```close()``` closes a file descriptor, so that it no longer refers to any file and may be reused. If fd is the last file descriptor referring to the underlying open file description (see ```open(2)```), the resources associated with the open file description are freed; if the descriptor was the last reference to a file which has been removed using ```unlink(2)``` the file is deleted.

For example:
file descriptor : fd

file descriptor|fd flags | file ptr
|:------------:|:-------:|--------------
fd0||point to stdin                        
fd1||point to stdout
fd2||point to stderr
fd3||abc.txt

To redirect stderr, OS will perform something like that:
```c
close(1);
fd=open("results.txt", O_WRONLY, 0);
```

For ```close(1);```: 
file descriptor|fd flags | file ptr
|:------------:|:-------:|--------------
fd0||point to stdin                        
fd1||
fd2||point to stderr
fd3||abc.txt

For ```fd=open("results.txt", O_WRONLY, 0);```:
file descriptor|fd flags | file ptr
|:------------:|:-------:|--------------
fd0||point to stdin                        
fd1||results.txt
fd2||point to stderr
fd3||abc.txt

Then for the stderr part, OS will perform something like that:
```c
close(2);
fd = dup(1);
```

For ```close(2);```:
file descriptor|fd flags | file ptr
|:------------:|:-------:|--------------
fd0||point to stdin                        
fd1||results.txt
fd2||
fd3||abc.txt

For ```fd = dup(1);```

file descriptor|fd flags | file ptr
|:------------:|:-------:|--------------
fd0||point to stdin                        
fd1||results.txt
fd2||results.txt
fd3||abc.txt

So all data write to fd2 will write to results.txt

## TLDR
- To preform redirection, you need to open the file you want to input first.(If it is a file descriptor then dup() it. )
- **Before a command is executed, its input and output may be redirected using a special notation interpreted by the shell.**