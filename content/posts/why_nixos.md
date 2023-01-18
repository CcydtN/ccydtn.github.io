+++
title = "Why NixOS and why not"
description = "Why I start and stop using NiOS"
date = 2023-12-20
updated = 2023-12-20
draft = false
tags = ["NixOS"]
[extra]
toc = true
+++
# Summary
To summarize my experience, I would say `nix` is a really good package management tool for DevOps, but for daily use in operating system (NixOS)? it depances.
"Home manager"? it solves some problem, but also create other problem.

If you want to use unstable branch and expecting an experience like a rolling-release distro (like Arch), it's definatly not the choice.

If you want a robust system and only use tools that are alreadly stable, it can be fine.

# Why I start using NixOS?
1. Data on my laptop seem croupted, and Windows is broken.
    - I need to repair it or flash a new system on it.
2. I plans to move to another Country.
    - I want my laptop to be as stable as possible, I won't have another computer to fix it.
3. I tried Ubuntu and Arch before, and I would try something different.
    - A different operating system or distro.
    - I didn't like Ubuntu. Arch is nice, but I know AUR can be 
4. I am interested in the idea of reproducible, declarative and reliable systems.
    - Sound really nice, espically when you often do distro hop or need to sync configuration on different machine.

Base on those reason, I pickup a usb, burn iso to that and start the journary.

# What wrong with NixOS?
I start using it as daily drive. Surfing the internet, coding and start joining CTF, but soon I saw some problems with NixOS and home-manager.

## Running binary
Running binary directly is problemic on nixos because of its design. Sometime I just want to download and run a binary, but it always fails.
There are a few solution, but they are not perfect:
- Go to [the package site](https://search.nixos.org/packages) and see if it is available or not. But eventhough you can download with nix, it doesn't mean it run flawlessly.
For example, `cutter`([url](https://cutter.re/)) run without a decompiler or `pcloud`([url](https://www.pcloud.com/)) crash eventhough it is in stable-branch ([issue](https://github.com/NixOS/nixpkgs/issues/226339) known from the unstable-branch).
- Create a FHS environment with `nix-shell` or `steam-run`

> This also apply to `Mason.nvim`, a neovim plugin for downloading language server, linter, etc.

This extra step just cause too much inconvinent, when I do CTF challenge.

## Home Manager
Every package seem to be maintained by different people and appears in different style.
Some can set packages to null, so it only create a config file, Some cannot.
Some allows user do their config in nix language, but some wants a source file.
Sometime I need to dig in to the source code to find out the data type for a option.
And that's just annoying

This extra layer also make the setup hard to debug.
One time I upgrade the whole system, and it shows a error message that doesn't give me any clues.
I need to disable options and perform a binary search manually in order to figure out the problem.

The whole setup quickly become a mess, so I start droping it. Creating a source for every config and link it with nix.

# What now?
I am looking for another distro, probaly manjaro. Planning to reinstall a system.

Anyway, it's quite a frash experience, using a functional language to configure a system.
