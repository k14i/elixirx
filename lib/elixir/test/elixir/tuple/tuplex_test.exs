Code.require_file "../test_helper.exs", __DIR__

defmodule TupleXTest do
  use ExUnit.Case, async: true

  test :reverse do
    assert TupleX.reverse({:a, :b, :c}) == {:c, :b, :a}
  end

end
