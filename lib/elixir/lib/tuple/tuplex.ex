defmodule TupleX do
  @moduledoc """
  Functions for working with tuples.
  """
  @doc """
  Reverse a tuple

  ## Examples

      iex> TupleX.reverse({:foo, :bar, :baz})
      {:baz, :bar, :foo}

  """
  @spec reverse(tuple) :: tuple
  def reverse(tuple) do
    Tuple.to_list(tuple) |> Enum.reverse |> List.to_tuple
  end

end
