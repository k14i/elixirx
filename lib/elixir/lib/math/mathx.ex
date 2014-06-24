defmodule MathX do
  @moduledoc """
  Functions for working with numbers.
  """

  @doc """
  Return the absolute value of an argument.

  ## Examples

      iex> MathX.absolute(-1.5)
      1.5
      iex> MathX.absolute(1.5)
      1.5

  """
  @spec absolute(number) :: number
  def absolute(num) when is_number(num) do
    if num < 0 do
      num = num * -1
    end
    num
  end

end
