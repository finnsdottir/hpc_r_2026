# Crashcourse: R, HPC and the shell.

Before we dive into how to do analyses using R on  high-performance computing clusters, let's start with a crashcourse in HPC and the shell.

## What is high-performance computing? 

High-performance computing (also known as supercomputing) is a form of computing that uses multiple, linked, powerful CPUs/GPUs to handle fast, more intense, and larger processing. The principle tool for HPC is the computing cluster. 

**Key terms:**

- Core: One processing unit (CPU or GPU)
- Node: basically a computer (processors, memory, hard disc...) without all the accessories
- Cluster: collection of many connected nodes
- Rack: The box holding the cluster together

## Using the shell.

Basically, the shell is the program that lets you interact with the computer behind the click and point interface we all use. The application we use to access the shell differs across operating systems:

- On Mac and linux machines, use the 'Terminal' to access the shell
- On newer Windows computers (version 10 or above), you can access the shell through the 'Command Prompt' application
- On older Windows computers, you will need to download specialized software to access the shell, such as the free version of [MobaXterm](https://mobaxterm.mobatek.net/download.html). 

Once you open the terminal, you will seem the command prompt. The prompt itself can be customized, and will look different based on your operating system. It is called a prompt because it is waiting (or, prompting) you to enter a command. 

<figure markdown="span">
    ![image of console](./content/shell_start.png){width=600}
    <figcaption>My command prompt shows my username and computer name, followed by my working directory (blank) and the % symbol. </figcaption>
</figure>

To use the shell, we type in commands, which the program then interprets. For example, if we type in `whoami`, it returns our username:

```shell
(base) mariafinnsdottir@JRP93PG4V5 ~ % whoami
mariafinnsdottir
```
??? note "What is happening here?"

    1.	The terminal takes this string of characters “whoami” and looks in a special set of directories on your computer called the PATH for any files that match the string
    2.	If it finds a match, run the file as a program
    3.	whoami is recognized as a program
    4.	That program then returns a result based on how it was programmed

If, however, we type a command that the program does not recognize, it will return an error.   

```shell
(base) mariafinnsdottir@JRP93PG4V5 ~ % whereami
zsh: command not found: whereami
```

The correct way to find 'where we are,' so to speak, is to print the working directory. We do this using the `pwd` command. 

Mac and Linux users will see the `pwd` command return the current working directory:

```shell
(base) mariafinnsdottir@JRP93PG4V5 ~ % pwd
/Users/mariafinnsdottir
```

Windows users will get a 'command not found' error here as well, because the original operating system programmers named the command ‘cd’ (current directory) instead. If you’re working on a Windows computer, type in ‘cd’ now, and the shell should return your current working directory.

Even with the differences between operating systems, typically, you can do the same things. Once we log into the remote system, everyone will see the same thing and will use the same commands.

!!! Note
    You can navigate through your previous commands using the up and down arrow buttons. You can also view a list of previous commands by running the command `history`.

## Logging into the HPC cluster.

You must use SSH to log into the clusters

The first time you log in, you 