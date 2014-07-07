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

  @doc """
  Determines if an integer is even.

  Returns `true` if `n` is an even number, otherwise `false`.
  """
  @spec even?(integer) :: boolean
  def even?(num) when is_integer(num) do
    if remainder(num, 2) == 0 do
      true
    else
      false
    end
  end

  @doc """
  Determines if an integer is even.

  Returns `true` if `n` is an even number, otherwise `false`.
  """
  def odd?(num) when is_integer(num) do
    if even?(num) do
      false
    else
      true
    end
  end

  @doc """
  Return the median of a number list.

  ## Examples

      iex> MathX.median([1, 2, 3])
      2
      iex> MathX.median([1, 2, 3, 4])
      2.5

  """
  @spec median(list) :: number
  def median(list) when hd(list) |> is_number and tl(list) |> is_list do
    slist = Enum.sort(list)
    ptr = (Enum.count(slist) + 1) / 2 - 1
    ptr_int   = ptr |> to_string |> Integer.parse |> elem(0)
    ptr_float = ptr |> to_string |> Integer.parse |> elem(1)
    if ptr_float == ".0" do
      Enum.at(slist, ptr_int)
    else
      (Enum.at(slist, Float.floor(ptr)) + Enum.at(slist, Float.ceil(ptr))) / 2
    end
  end

  @doc """
  Returns the average of all values.

  Raises `ArithmeticError` if collection contains a non-numeric value.

  ## Examples

    iex> MathX.average([1, 2, 3, 5, 8, 13, 21, 34])
    10.875

  """
  @spec average(list) :: number
  def average(list) when hd(list) |> is_number and tl(list) |> is_list do
    Enum.sum(list) / Enum.count(list)
  end

  @doc """
  Compute the sqrt of (x^2 + y^2).

  ## Examples

    iex> MathX.hypot(2,3)
    3.605551275463989

  """
  @spec hypot(number, number) :: number
  def hypot(x, y) do
    :math.sqrt(:math.pow(x,2) + :math.pow(y,2))
  end

  @doc """
  Compute sin(pi * x)/(pi * x) if x != 0, and 1 if x == 0.

  ## Examples

    iex> MathX.sinc(0)
    1
    iex> MathX.sinc(10)
    -3.898171832519376e-17

  """
  @spec sinc(number) :: number
  def sinc(x) when is_number(x) do
    do_sinc(x)
  end
  defp do_sinc(x) when x == 0 do
    1
  end
  defp do_sinc(x) when x != 0 do
    :math.sin(:math.pi * x)/(:math.pi * x)
  end

end
