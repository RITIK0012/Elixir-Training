defmodule Tutorials.Recursion.FactorialDigits do
  def upto(fact, acc \\ 1)
  def upto(0, acc), do: acc
  def upto(fact, acc) do
    upto(fact - 1 , acc * fact)
  end
end
