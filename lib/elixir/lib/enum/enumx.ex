defmodule EnumX do
  import Kernel, except: [max: 2, min: 2]

  @moduledoc """
  Provides a set of algorithms that enumerate over collections according to the
  `Enumerable` protocol:

      iex> EnumX.map([1, 2, 3], fn(x) -> x * 2 end)
      [2,4,6]

  Some particular types, like dictionaries, yield a specific format on
  enumeration. For dicts, the argument is always a `{key, value}` tuple:

      iex> dict = %{a: 1, b: 2}
      iex> EnumX.map(dict, fn {k, v} -> {k, v * 2} end)
      [a: 2, b: 4]

  Note that the functions in the `EnumX` module are eager: they always start
  the enumeration of the given collection. The `Stream` module allows
  lazy enumeration of collections and provides infinite streams.

  Since the majority of the functions in `EnumX` enumerate the whole
  collection and return a list as result, infinite streams need to
  be carefully used with such functions, as they can potentially run
  forever. For example:

      EnumX.each Stream.cycle([1,2,3]), &IO.puts(&1)

  """

  @compile :inline_list_funcs

  @type t :: Enumerable.t
  @type element :: any
  @type index :: non_neg_integer
  @type default :: any

  # Require Stream.Reducers and its callbacks
  require Stream.Reducers, as: R

  defmacrop cont(_, entry, acc) do
    quote do: {:cont, [unquote(entry)|unquote(acc)]}
  end

  defmacrop acc(h, n, _) do
    quote do: {unquote(h), unquote(n)}
  end

  defmacrop cont_with_acc(f, entry, h, n, _) do
    quote do
      {:cont, {[unquote(entry)|unquote(h)], unquote(n)}}
    end
  end

  @doc """
  Splits `collection` into groups based on `fun` invoking `fun_entry` for each entry.

  The result is a dict (by default a map) where each key is
  a group and each value is a list of elements from `collection`
  for which `fun` returned that group. Ordering is not necessarily
  preserved.

  ## Examples

      iex> EnumX.group_by(~w{ant buffalo cat dingo}, %{}, &String.length/1, &String.capitalize/1)
      %{3 => ["Cat", "Ant"], 5 => ["Dingo"], 7 => ["Buffalo"]}
      iex> EnumX.group_by([a: 1, b: 0, c: 4, d: 0, e: 1, f: 1], %{}, fn({_, v}) -> v end, fn({k, _}) -> to_string(k) end)
      %{0 => ["d", "b"], 1 => ["f", "e", "a"], 4 => ["c"]}

  """
  @spec group_by(t, dict, (element -> any), (element -> any)) :: dict when dict: Dict.t
  def group_by(collection, dict \\ %{}, fun, fun_entry) do
    Enum.reduce(collection, dict, fn(entry, categories) ->
      Dict.update(categories, fun.(entry), [fun_entry.(entry)], &[fun_entry.(entry)|&1])
    end)
  end
end
