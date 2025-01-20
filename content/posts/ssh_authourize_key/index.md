+++
title = "Copying SSH Public Keys without `ssh-copy-id`"
description = ""
date = 2024-10-25
updated = 2024-10-25
draft = false

[taxonomies]
tags = [ "SSH", "Encryption", "setup" ]

[extra]
toc = true
+++
# Intro
Recently, I tried to set up a home server. To SSH without a password, I set up the SSH Authentication. But `ssh-copy-id` is not working because of ssh-agent. Instead of debugging on ssh-agent, I tried to figure out what `ssh-copy-id` did and did it manually.

# What did `ssh-copy-id` do?
```bash
ssh-copy-id -i {public key} user@remotehost
```
When we run this command, it ssh to the remote machine. Then create `authorized_keys` with public key information (provided by `-i`).

> To look at the code, use this bash command `cat $(which ssh-copy-id)`.
>
> In short,
> 1. It gets the public keys (from `ssh-add -L` by default, or from `-i`)
> 2. SSH or SFTP to the machine.
> 3. Create a file called `authorized_keys` and write the public key to it.


# What format does `authorized_key` store?
[RFC 4253](https://datatracker.ietf.org/doc/html/rfc4253#section-6.6)

Here is a [link](https://coolaj86.com/articles/the-ssh-public-key-format/) to a blog explaining that.


# Copy the public key manually
1. On your remote machine, create the file.
```bash
mkdir ~/.ssh/
chmod 700 ~/.ssh  # this is important.
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys  #this is important.
```
2. Write public key to `authorized_keys`
```bash
# On your local machine
cat {public key file} # if you are doing a single key
ssh-add -L # if you have ssh-agent

# On your remote machine
echo "{content from local}" >> ~/.ssh/authorized_keys
```

The upper command can rewritten as follows:
```bash
# On your local machine
cat {public key file} | ssh user@remotehost -T "cat >> ~/.ssh/authorized_keys"
```
Now you should be able to connect from your machine to the remote system.