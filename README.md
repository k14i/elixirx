elixir-plus
===========

This repository aims to make [Elixir][1] itself simpler, easier, more convenient and more sophisticated.

## Usage

    $ git clone git@github.com:keithseahus/elixir-plus.git
    $ git clone git@github.com:elixir-lang/elixir.git
    $ cd elixir
    $ git apply --stat ../elixir-plus/patch/foo.patch
    $ git apply --check ../elixir-plus/patch/foo.patch
    $ git am --signoff < ../elixir-plus/patch/foo.patch
    $ make clean test

## Functions

* `Enum.group_by/4`

  [1]: https://github.com/elixir-lang/elixir

