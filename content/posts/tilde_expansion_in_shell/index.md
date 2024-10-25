+++
title = "Tilde expansion in shell"
description = ""
date = 2024-10-25
updated = 2024-10-25
draft = false
tags = [ 'shell', 'sh', 'bash', 'zsh', 'fish' ]
[extra]
toc = true
+++

# Intro
Since I learned Linux/Unix-like system, my understanding of `~` refers to `$HOME` (a.k.a. `/home/username`). I didn't know why or how it works, but it doesn't affect my daily workflow.

Recently, I've been trying to make `ssh-copy-id`, and `ssh-add` work with 1password ssh-agent, but something unexpected happened.

```sh
# Run in fish
env SSH_AUTH_SOCK=~/.1password/agent.sock ssh-add -L
# Output:
# Error connecting to agent: No such file or directory

set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
ssh-add -L
# Output:
# {List of ssh public keys}
```

From my understanding, both commands should have the same result. But obviously, it is not the case.

# The issue
To understand this issue, I tried different methods to set environment variables with different shells. Here are some of them:

```sh
export SSH_AUTH_SOCK=~/.1password/agent.sock
echo $SSH_AUTH_SOCK
# bash output:
# /home/user/.1password/agent.sock
# zsh output:
# /home/user/.1password/agent.sock
# fish output:
# ~/.1password/agent.sock
```
```sh
env SSH_AUTH_SOCK=~/.1password/agent.sock | rg SSH_AUTH_SOCK
# bash output:
# SSH_AUTH_SOCK=/home/user/.1password/agent.sock
# zsh output:
# SSH_AUTH_SOCK=~/.1password/agent.sock
# fish output:
# SSH_AUTH_SOCK=~/.1password/agent.sock
```

Different methods, and shells, come up with different results. It causes some issues when I run other commands.

# Reason
After some research, I came up with [this answer](https://unix.stackexchange.com/questions/373519/expansion-of-tilde-in-zsh), which explains that.

I then look at the details in the `bash` and `zsh` documents.

> Quote from [bash variable assignment](https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html):
> 
> Bash also performs tilde expansion on words satisfying the conditions of variable assignments (see Shell Parameters) when they appear as arguments to simple commands. Bash does not do this, except for the declaration commands listed above, when in POSIX mode.

> Quote from [zsh options](https://zsh.sourceforge.io/Doc/Release/Options.html):
> 
> All unquoted arguments of the form ‘anything=expression’ appearing after the command name have filename expansion (that is, where expression has a leading ‘\~’ or ‘=’) performed on expression as if it were a parameter assignment. The argument is not otherwise treated specially; it is passed to the command as a single argument, and not used as an actual parameter assignment. For example, in echo foo=\~/bar:\~/rod, both occurrences of \~ would be replaced. Note that this happens anyway with typeset and similar statements.

According to the answer, `zsh` seems to follow the POSIX standard in this part. And we can verify the result by running the same command with `sh`.
```sh 
export SSH_AUTH_SOCK=~/.1password/agent.sock
echo $SSH_AUTH_SOCK
# /home/user/.1password/agent.sock
env SSH_AUTH_SOCK=~/.1password/agent.sock | rg SSH_AUTH_SOCK
# SSH_AUTH_SOCK=~/.1password/agent.sock
```

Moreover, we can replicate the `bash` behavior using `zsh` with the `magicequalsubst` option.
```sh
set -o magicequalsubst
env SSH_AUTH_SOCK=~/.1password/agent.sock | rg SSH_AUTH_SOCK
# SSH_AUTH_SOCK=/home/user/.1password/agent.sock
```

# Other reference
> [POSIX tilde expansion](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_01)
> 
> [POSIX variable assignment](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_23)
