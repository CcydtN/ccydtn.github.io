+++
title = "DIY touchpad"
description = ""
date = 2024-10-05
updated = 2024-10-05
draft = false

[taxonomies]
tags = ["Touchpad", "DIY", "Trackpad"]

[extra]
toc = false
+++
> Disclaimer
> 
> It is a W.I.P. project, and I don't have any schedule.
>
> Everytime I make some progress, I will come back and update this post.

# Why I started the project (back in 2022)
I like using the touchpad/trackpad on my laptop, but its position is fixed. I can't move it around or place it in a more comfortable position.

The easiest solution is to buy an existing product. So, I did some searching, but the choices are limited. Here are some of them and the reasons why I didn't buy them:
- **Apple Magic Trackpad**: EXPENSIVE!!!!!!!!!!!!!
- **Jelly Comb T055**: Out of Stock on official page
- **Logitech T650**: Outdated product (2012) and Logitech stop making new touchpads.
- **Other**:
  - Bad appearance
  - Too small for desktop usage
  - Unknown brand (Can't even find the product info on it's official site)
  - etc.

My next idea is to find a tutorial that teaches me how to make one. The internet has many YouTube videos, blog posts, and GitHub repos, teaching people to make a keyboard or a mouse. There must be a tutorial for touchpad, right?

![](https://media.giphy.com/media/VKtsOAHDx1Luo/giphy.gif?cid=790b76119hnwt2wjnnzoo3b09hwrsz6kvmdui5cqrn7qb5nr&ep=v1_gifs_search&rid=giphy.gif&ct=g)

Well, there are tutorials teaching how to make a touchpad using laptop components. But I think they come with some downsides:
- Limited by the component
  - Might not support multi-touch.
  - Small in size (due to using laptop components)
  - Requires looking up a datasheet to figure out the protocol, pins, etc.
- Require knowledge about Arduino and probily HID protocol.


However, two articles([link 1](https://hackaday.com/2021/11/16/making-your-own-touchpad-with-pwm-and-rust/), [link 2](https://hackaday.com/2019/11/17/arduino-does-multitouch/)) show up in the search results. Both led me to a project called ["Multi-Touch Kit"](https://dl.acm.org/doi/10.1145/3332165.3347895), allowing me to design a touchpad with:
- Custom size
- Support multi-touch

With all the information, it sounds easy to make a touchpad. All I need to do is to put the puzzle pieces together...

![](https://media.giphy.com/media/dmZ8ytSDY7mCZg1g9i/giphy.gif?cid=790b7611fcc7sxda8zxliugu8mqc0ovlpftec492tjunp0mx&ep=v1_gifs_search&rid=giphy.gif&ct=g)

# Plan & Progress
- [X] Recreate the result of "Multi-Touch Kit"
  - [Result](https://github.com/CcydtN/Multi-Touch-Kit-ProMicro)
- [X] Learn about USB-HID protocol
  - [Result](https://github.com/CcydtN/Touchpad-Emulator)
- [ ] Algorithm to convert raw data to fingers information
  - [ ] Blob Detection (Get info like centre, area)
  - [ ] Blob Tracking (To assign a id to each finger)

- [ ] Combining all the things together

- [ ] Others
  - [ ] Find the best frequency / Ways to generate AC signal
  - [ ] Best pattern (size, shape)
  - [ ] Improve PCB design (2 or 4 layer?)
  - [ ] The best development board for the purpose
  - [ ] Bluetooth HID
