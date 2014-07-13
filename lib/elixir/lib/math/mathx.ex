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
  Returns quotient rounded towards `-Inf` of the floored division.

  ## Examples

      iex> MathX.fld(79, 31)
      2

  """
  @spec fld(number, number) :: number
  def fld(dividend, divisor) when is_number(dividend) and is_number(divisor) do
    Float.floor(dividend / divisor)
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
  Returns the product of all positive integers less than or equal to `n`.
  The value of 0! is 1.

  ## Examples

    iex> MathX.factorial(0)
    1
    iex> MathX.factorial(4)
    24

  """
  @spec factorial(integer) :: integer
  def factorial(x) when is_integer(x) and x >= 0 do
    cond do
      x == 0 ->
        1
      x == 1 ->
        x
      true ->
        x * factorial(x - 1)
    end
  end

  @doc """
  Returns a value rounding `n` towards zero.

  ## Examples

    iex> MathX.trunc(1.1)
    1
    iex> MathX.trunc(0)
    0
    iex> MathX.trunc(-0.9)
    0
    iex> MathX.trunc(-1.1)
    -1

  """
  @spec trunc(number) :: number
  def trunc(x) when is_number(x) do
    do_trunc(x)
  end
  defp do_trunc(x) when x >= 0 do
    Float.floor(x)
  end
  defp do_trunc(x) when x < 0 do
    Float.floor(x) + 1
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

  @doc """
  Compute cos(pi * x)/x - sin(pi * x)/(pi * x^2) if x != 0, and 0 if x == 0.

  ## Examples

    iex> MathX.cosc(0)
    0
    iex> MathX.cosc(-10)
    -0.1

  """
  @spec cosc(number) :: number
  def cosc(x) when is_number(x) do
    do_cosc(x)
  end
  defp do_cosc(x) when x == 0 do
    0
  end
  defp do_cosc(x) when x != 0 do
    :math.cos(:math.pi * x)/x - :math.sin(:math.pi * x)/(:math.pi * :math.pow(x,2))
  end

  @doc """
  Return x ^ 1/3.

  ## Examples

    iex> MathX.cbrt(8)
    2.0
    iex> MathX.cbrt(27)
    3.0
    iex> MathX.cbrt(1000)
    10.0

  """
  @spec cbrt(number) :: number
  def cbrt(x) when is_number(x) do
    result = :math.pow(x, 1/3)
    cond do
      is_float(result) == false ->
        result
      true ->
        result_ceil = Float.ceil(result)
        result_14 = Float.round(result, 14)
        result_15 = Float.round(result, 15)
        if result_14 != result_15 and result_14 == result_ceil do
          result_14
        else
          result
        end
    end
  end

end
