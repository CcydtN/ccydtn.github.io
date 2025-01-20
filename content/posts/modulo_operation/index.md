+++
title = "Modulo operation in different language"
description = ""
date = 2025-01-02
updated = 2025-01-02
draft = false

[taxonomies]
tags = [ 'C++', 'Python', 'Rust' ]

[extra]
toc = true
+++

# Beginning
Recently, a question popped up from nowhere: "What is the result of a modulo of negative numbers divided by a positive number?" 

The answer should be easy, but something just doesn't feel right. My first thought on the question is that the result of modulo is first defined as the reminder, so it should be a negative number. However, my experience in using Python to solve challenges in CTF, tells me that the result is a positive number. So which one is it?

To resolve it, I tried it using both C++ and Python.

```cpp
void main() {
    cout << -3 % 2 << endl;
    // -1
}
```

```python
-3 % 2
# 1
```

To my surprise, they resulted in different answers. I know they are equal in modulo arithmetic, but I don't know what is causing this difference.

# Research
Luckily, [wiki](https://en.wikipedia.org/wiki/Modulo) has a really complete explanation. So, I will skip most explanations and jot down the key points.

In short, different programming languages use different approaches in modulo operation. When the **dividend** or **divisor** is **negative**, those approaches produce different results.
They can be classified as:
- Truncated division
   - **Same** sign of the **dividend**. 
   - C/C++, Rust with `%` operator
- Floored division
  - **Same** sign of the **divisor**.
  - Python with `%` operator
- Euclidean division
  - Always positive.
  - Rust with `rem_euclid()` function
- Round division
  - Could be negative or positive depending on which one is closer to 0 
- Ceil division
  - **Opposite** sign of the **divisor**

# Furthermore
Because of this sign issue, the wiki suggests that we should avoid the condition `n % 2 == 1` for the odd test. Instead, we should use `n % 2 != 0` or `n & 1 == 1`.

# Ending
When I first came up with this question, I didn't think much about it. I thought there must be some standard, but it turned out to be a rabbit hole. Different programming languages use various approaches and result in different answers to the same input.

It seems like an easy and common issue, but I'm not sure why I never faced it before. Anyway, now I know it, and I know what to do when I meet this issue in the future.