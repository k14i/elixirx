elixir-enhancements
===================

This repository aims to make [Elixir][1] itself simpler, easier, more convenient and more sophisticated.

## Usage

    $ git clone git@github.com:keithseahus/elixir-enhancements.git
    $ git clone git@github.com:elixir-lang/elixir.git
    $ cd elixir
    $ git apply --stat ../elixir-enhancements/patch/foo.patch
    $ git apply --check ../elixir-enhancements/patch/foo.patch
    $ git am --signoff < ../elixir-enhancements/patch/foo.patch
    $ make clean test

## Functions

* `Enum.group_by/4`

  [1]: https://github.com/elixir-lang/elixir

