defmodule ListX do
  @moduledoc """
  Implements functions that only make sense for lists
  and cannot be part of the Enum protocol. In general,
  favor using the Enum API instead of List.

  Some functions in this module expect an index. Index
  access for list is linear. Negative indexes are also
  supported but they imply the list will be iterated twice,
  one to calculate the proper index and another to the
  operation.

  A decision was taken to delegate most functions to
  Erlang's standard library but follow Elixir's convention
  of receiving the target (in this case, a list) as the
  first argument.
  """

  @compile :inline_list_funcs

  @doc """
  Sorts a keyword list by its values.

  ## Examples

      iex> ListX.sort_by_value([a: 2, b: 1, c: 3])
      [b: 1, a: 2, c: 3]

  """
  @spec sort_by_value(list) :: list
  def sort_by_value(list) when hd(list) |> is_tuple and tl(list) |> is_list do
    Enum.sort(list, &(elem(&1, 1) < elem(&2, 1)))
  end

  @doc """
  Gets values from a keyword list.

  ## Examples

      iex> ListX.values([a: 2, b: 1, c: 3])
      [1, 2, 3]

  """
  @spec values(list) :: list
  def values(list) when hd(list) |> is_tuple and tl(list) |> is_list do
    values = Enum.map(sort_by_value(list), fn(x) -> elem(x, 1) end) |> Enum.uniq
  end

  @doc """
  Splits a collection into groups.

  The result is a tupled list where each key is
  a group and each value is a list of elements from `collection`.
  Ordering is not necessarily preserved.

  ## Examples

      iex> ListX.group_by_value([a: 0, b: 1, c: 2, d: 0, e: 1, f: 4])
      [{0, [:d, :a]}, {1, [:e, :b]}, {2, [:c]}, {4, [:f]}]

  """
  @spec group_by_value(list) :: list
  def group_by_value(list) when hd(list) |> is_tuple and tl(list) |> is_list do
    slist = Enum.sort(list, &(elem(&1, 1) < elem(&2, 1)))
    values = Enum.sort(slist, &(elem(&1, 1) < elem(&2, 1)))
      |> Enum.map(fn(x) -> elem(x, 1) end)
      |> Enum.uniq
    keys = Enum.map(values, fn(x) -> Enum.filter_map(slist, &(elem(&1, 1) == x), &(elem(&1, 0))) end)
    Enum.with_index(values)
      |> Enum.map(fn({v,i}) -> {v, Enum.at(keys, i)} end)
  end

  @doc """
  Splits a tupled list into two collections of keys and values.

  The result is a tuple.

  ## Examples

      iex> ListX.separate_key_value([a: 0, b: 1, c: 2, d: 0, e: 1, f: 4])
      {[:a, :b, :c, :d, :e, :f], [0, 1, 2, 0, 1, 4]}

  """
  @spec separate_key_value(list) :: tuple
  def separate_key_value(list) when hd(list) |> is_tuple and tl(list) |> is_list do
    keys = Enum.map(list, fn(x) -> elem(x, 0) end) |> Enum.uniq
    values = Enum.map(list, fn(x) -> elem(x, 1) end)
    {keys, values}
  end

  @doc """
  Returns a list with replaced values.

  ## Examples

      iex> ListX.replace_all([nil, 0, :a, "b", 'c', [0, 1, 2], {0, 1}, %{:a => 0}], 0)
      [0, 0, 0, 0, 0, 0, 0, 0]

  """
  @spec replace_all(list, any) :: list
  def replace_all(list, value) do
    do_replace_all(list, value)
  end
  defp do_replace_all([], _value) do
    []
  end
  defp do_replace_all([h|t], value) do
    [ value | do_replace_all(t, value) ]
  end

  @doc """
  Generate and fullfill a collection with the specified numbers of value.

  ## Examples

      iex> ListX.fill(8, nil)
      [nil, nil, nil, nil, nil, nil, nil, nil]

  """
  @spec fill(integer, any) :: list
  def fill(num, value) do
    do_fill([], num, value)
  end
  defp do_fill(list, num, value) do
    cond do
      Enum.count(list) < num ->
        list = do_fill(list ++ [value], num, value)
      true ->
        list
    end
  end

end
