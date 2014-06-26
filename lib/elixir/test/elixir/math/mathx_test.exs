Code.require_file "../test_helper.exs", __DIR__

defmodule MathXTest do
  use ExUnit.Case, async: true

  test :absolute do
    assert MathX.absolute(-1.5) == 1.5
    assert MathX.absolute(1.5) == 1.5
  end

  test :remainder do
    assert MathX.remainder(79, 31) == 17
    assert MathX.remainder(64, 16) == 0
    assert MathX.remainder(-5, 2) == 1
    assert MathX.remainder(5, -2) == 1
    assert MathX.remainder(-5, -2) == 1
    assert MathX.remainder(1.2, 0.6) == 0
    assert MathX.remainder(0, 1) == 0
  end

  test :even? do
    assert MathX.even?(-4) == true
    assert MathX.even?(-3) == false
    assert MathX.even?(-2) == true
    assert MathX.even?(-1) == false
    assert MathX.even?(0) == true
    assert MathX.even?(1) == false
    assert MathX.even?(2) == true
    assert MathX.even?(3) == false
    assert MathX.even?(4) == true
  end

end
