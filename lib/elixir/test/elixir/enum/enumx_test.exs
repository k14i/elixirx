Code.require_file "../test_helper.exs", __DIR__

defmodule EnumXTest.List do
  use ExUnit.Case, async: true

  test :group_by_4 do
    assert EnumX.group_by([a: 0, b: 1, c: 2, d: 0, e: 1, f: 4], %{}, fn({_, v}) -> v end, fn(x) -> elem(x,0) end) ==
           %{0 => [:d, :a], 1 => [:e, :b], 2 => [:c], 4 => [:f]}
  end

  test :without_index do
    assert EnumX.without_index([{1, 0}, {2, 1}, {3, 2}]) == [1, 2, 3]
  end
end

