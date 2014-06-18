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

end
