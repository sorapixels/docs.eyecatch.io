---
layout: default
permalink: /build-environment
---

Build environment
=====

Each projects will be executed in an isolated environment in Eyecatch. Every time a new build is invoked, Eyecatch build worker creates a fresh container from a pre-built image which contains web application build programs. The image is built on 64-bit Ubuntu latest LTS (16.04 Xenial).

Each build is executed the virtual machine is given a max of 2GB memory and 120-minutes execution time limit. When the time limit is exceeded or the build is completed, the build environment will be terminated and removed.

Build environment runs under the `root` user and you can run almost any commands to build the project. Thus, you can install custom packages that are not included in the default environment, start services manually, bind a port or edit system files. However, even with the root permission, there are still a few constraints to what you can do inside the environment. For example, you will not be able to mount or unmount file systems, install linux kernel modules or modify the routing table.

### Languages
Eyecatch includes following languages:

- Ruby

  Ruby version are managed with `rbenv`. Default version is 2.3.0.

  -  2.1.9
  -  2.2.5
  -  **2.3.1**


- Node.js

  Node.js versions are managed with `ndenv`. Default version is 4.4.3.

  - v4.3.2
  - **v4.4.7**
  - v5.12.0
  - v6.3.1

  If you want to use npm packages as a command line tool, something like bower or grunt CLI, then you need to install it globally with `-g` option and run `ndenv rehash` after install.


- Python

  Python versions are managed with `pyenv`. Default version is 3.5.1.

  - 2.7.12
  - 3.4.5
  - **3.5.2**


- PHP

  PHP versions are managed with `phpenv`. Default version is 5.6.17.

  - 5.5.38
  - **5.6.24**
  - 7.0.9
