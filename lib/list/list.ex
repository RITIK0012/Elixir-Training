defmodule Tutorials.List do
  @moduledoc """
  A collection of basic list-related recursive functions.

  ## Function Summary:
    1. `sum/1`       - Calculates the sum of a list
    2. `rev/1`       - Reverses a list
    3. `map/2`       - Maps each element to a new value using a function
    4. `concat/2`    - Concatenates two lists using recursion
    5. `flat_map/2`  - Maps & flattens results using recursion
  """

  # ---------------------------------------------------------
  # Sum
  # ---------------------------------------------------------

  @doc """
  Returns the sum of all numbers in a list using tail recursion.

  ## Examples

      iex> Tutorials.List.sum([1,2,3])
      6
  """
  @spec sum(list(number()), number()) :: number()
  def sum(nums, acc \\ 0)
  def sum([], acc), do: acc
  def sum([h | t], acc), do: sum(t, h + acc)

  # ---------------------------------------------------------
  # Reverse
  # ---------------------------------------------------------

  @doc """
  Reverses a list using head-prepending recursion.

  ## Examples

      iex> Tutorials.List.rev([1,2,3])
      [3,2,1]
  """
  @spec rev(list(any()), list(any())) :: list(any())
  def rev(nums, new_list \\ [])
  def rev([], new_list), do: new_list
  def rev([h | t], new_list), do: rev(t, [h | new_list])

  # ---------------------------------------------------------
  # Map
  # ---------------------------------------------------------

  @doc """
  Applies a function to every element of a list and returns a new list.

  ## Examples

      iex> Tutorials.List.map([1,2,3], fn x -> x * 2 end)
      [2,4,6]
  """
  @spec map(list(any()), (any() -> any()), list(any())) :: list(any())
  def map(elements, func, acc \\ [])
  def map([], _, acc), do: rev(acc)
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

  # ---------------------------------------------------------
  # Concat
  # ---------------------------------------------------------

  @doc """
  Concatenates two lists using your reverse-then-prepend logic.

  ## Examples

      iex> Tutorials.List.concat([1,2], [3,4])
      [1,2,3,4]
  """
  @spec concat(list(any()), list(any())) :: list(any())
  def concat(list1, list2), do: concat_func(rev(list1), list2)

  defp concat_func([], list2), do: list2
  defp concat_func([h | t], list2), do: concat_func(t, [h | list2])

  # ---------------------------------------------------------
  # Flat Map
  # ---------------------------------------------------------

  @doc """
  Maps each element using `func` and concatenates the results.

  This is your custom implementation of `Enum.flat_map`.

  ## Examples

      iex> Tutorials.List.flat_map([1,2], fn x -> [x, x*10] end)
      [1,10, 2,20]
  """
  @spec flat_map(list(any()), (any() -> list(any())), list(any())) :: list(any())
  def flat_map(elements, func, acc \\ [])
  def flat_map([], _, acc), do: acc
  def flat_map([h | t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))
end
