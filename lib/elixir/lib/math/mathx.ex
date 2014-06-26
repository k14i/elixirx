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

  @doc """
  Return the remainder value of 2nd argument into 1st argument.

  ## Examples

      iex> MathX.remainder(79, 31)
      17

  """
  @spec remainder(number, number) :: number
  def remainder(dividend, divisor) when is_number(dividend) and is_number(divisor) do
    dividend - Float.floor(dividend / divisor) * divisor |> absolute
  end

end
