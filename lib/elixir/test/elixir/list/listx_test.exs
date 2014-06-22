Code.require_file "../test_helper.exs", __DIR__

defmodule ListXTest do
  use ExUnit.Case, async: true

  test :sort_by_value do
    assert ListX.sort_by_value([a: 2, b: 1, c: 3]) == [b: 1, a: 2, c: 3]
  end

  test :values do
    assert ListX.values([a: 2, b: 1, c: 3]) == [1, 2, 3]
  end

  test :group_by_value do
    assert ListX.group_by_value([a: 0, b: 1, c: 2, d: 0, e: 1, f: 4]) == [{0, [:d, :a]}, {1, [:e, :b]}, {2, [:c]}, {4, [:f]}]
  end
end
