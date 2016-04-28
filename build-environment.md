Build environment
=====

Each projects will be executed in an isolated environment in Eyecatch. Every time a new build is invoked, Eyecatch build worker creates a fresh container from pre-build image which contains web application build program. The image is built on 64-bit Ubuntu 14.04 LTS.

While each build is being executed the virtual machine is given a max of 2GB memory and 30-minute execution time limit. When the time limit is exceeded, or the build is completed, the build environment will be terminated and removed. There is no persistence except dependency directory cache which is stored up to a month. You can disable this feature with the configuration file `eyecatch.rb`. Once you disabled the dependency caching, the stored data will be erased and it cannot be undone.

Build environment runs under `root` user and you can run almost any commands to build the project. Thus you can install custom packages that is not included default environment, start services manually, bind a port or edit system files. However, even with the root permission, there are still a few constraints to what you can do inside the environment. For example, you will not be able to handle file systems, install linux kernel module or modify routing table.

## Languages
Eyecatch includes following languages:

- Ruby

 Ruby version are managed with `rvm`. Version 2.3.0p0 is pre-installed.

- Node.js

  Node.js versions are managed with `nvm`. Version 4.4.3 is pre-installed.

- Go

  Currently only one Golang version is installed. The version is 1.2.1.

- PHP

  Currently only one PHP version is installed.  The version is 5.5.9.

- Python

  Currently only one Python version is installed. The version is 2.7.6.
