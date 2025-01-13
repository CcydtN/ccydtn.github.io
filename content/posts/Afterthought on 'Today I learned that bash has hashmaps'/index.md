+++
title = "Afterthought on 'Today I learned that bash has hashmaps'"
description = ""
date = 2025-01-12
updated = 2025-01-12
draft = false
tags = []
[extra]
toc = true
+++

# Intro
I read a post on Hackernew yesterday. Here is the [links](https://news.ycombinator.com/item?id=42631815) to that.

After reading the post and comments, I feel like I should write down all the key points in case I need to use them someday or tell someone not to use a certain feature.

# What I learn
1. Bash has something like a hashmap, it is called "Associative arrays" and uses "string" as a key.
1. Any variable declared `local` is also in the scope of a function lower down in the call stack.
1. Bash has variable shadowing.

Example:
```bash
#!/bin/bash

declare -A map1=([x]=2)
echo "1. Global scope map1[x]: ${map1[x]}"
func1() {
    echo " * Enter func1"
    local -A map1
    map1[x]=3
    echo "   Local scope map1[x]: ${map1[x]}"
    func2
}
func2() {
    echo "  * Enter func2"
    echo "      Local scope map1[x]: ${map1[x]}"
}
func1
func2
echo "2. Global scope map1[x]: ${map1[x]}"
```


# More to read
https://mywiki.wooledge.org/BashPitfalls#set_-euo_pipefail