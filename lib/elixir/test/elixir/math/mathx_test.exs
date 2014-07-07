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

  test :odd? do
    assert MathX.odd?(-4) == false
    assert MathX.odd?(-3) == true
    assert MathX.odd?(-2) == false
    assert MathX.odd?(-1) == true
    assert MathX.odd?(0) == false
    assert MathX.odd?(1) == true
    assert MathX.odd?(2) == false
    assert MathX.odd?(3) == true
    assert MathX.odd?(4) == false
  end

  test :median do
    assert MathX.median([1]) == 1
    assert MathX.median([1, 2]) == 1.5
    assert MathX.median([1, 2, 3]) == 2
    assert MathX.median([1, 2, 3, 4]) == 2.5
    assert MathX.median([4, 3, 2, 1]) == 2.5
    assert MathX.median([1.2, 3.4]) == 2.3
    assert MathX.median([1, -2]) == -0.5
  end

  test :average do
    assert MathX.average([1, 2, 3, 5, 8, 13, 21, 34]) == 10.875
  end

  test :factorial do
    assert MathX.factorial(0) == 1
    assert MathX.factorial(1) == 1
    assert MathX.factorial(4) == 24
  end

  test :hypot do
    assert MathX.hypot(2,3) == 3.605551275463989
  end

  test :sinc do
    assert MathX.sinc(0) == 1
    assert MathX.sinc(10) == -3.898171832519376e-17
  end

end
