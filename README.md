ElixirX -- Elixir eXtention library
===================================

This repository aims to make [Elixir][1] itself simpler, easier, more convenient and more sophisticated.

## Installation

    $ git clone git@github.com:keithseahus/elixirx.git
    $ git clone git@github.com:elixir-lang/elixir.git
    $ cp -rfp elixirx/lib/elixir/* elixir/lib/elixir/
    $ cp -rfp elixirx/lib/elixir/test/elixir/* elixir/lib/elixir/test/elixir/
    $ cd elixir
    $ make clean test

## Functions

### EnumX

* `group_by/4`
* `average/1`

### TupleX

* `reverse/1`

### ListX

* `sort_by_value/1`
* `values/1`
* `group_by_value/1`
* `separate_key_value/1`

### MathX

* `absolute/1`
* `remainder/2`
* `even?/1`
* `odd?/1`
* `median/1`

  [1]: https://github.com/elixir-lang/elixir

