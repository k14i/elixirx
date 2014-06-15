Code.require_file "../test_helper.exs", __DIR__

defmodule EnumPlusTest.List do
  use ExUnit.Case, async: true

  test :group_by_4 do
    assert Enum.Plus.group_by([a: 0, b: 1, c: 2, d: 0, e: 1, f: 4], %{}, fn({_, v}) -> v end, fn(x) -> elem(x,0) end) ==
           %{0 => [:d, :a], 1 => [:e, :b], 2 => [:c], 4 => [:f]}
  end

end

