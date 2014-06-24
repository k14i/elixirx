Code.require_file "../test_helper.exs", __DIR__

defmodule MathXTest do
  use ExUnit.Case, async: true

  test :absolute do
    assert MathX.absolute(-1.5) == 1.5
    assert MathX.absolute(1.5) == 1.5
  end

end
