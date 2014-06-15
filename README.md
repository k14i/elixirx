elixir-enhancements
===================

This repository aims to make Elixir itself simpler, easier, more convenient and more sophisticated.

Usage
-----

`````
$ git clone git@github.com:keithseahus/elixir-enhancements.git
$ git clone git@github.com:elixir-lang/elixir.git
$ cd elixir
$ git apply --stat ../elixir-enhancements/patches/foo.patch
$ git apply --check ../elixir-enhancements/patches/foo.patch
$ git am --signoff < ../elixir-enhancements/patches/foo.patch
$ make clean test
`````

