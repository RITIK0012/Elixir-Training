defmodule Tutorials.Recursion.PrintDigits do
  @moduledoc """
  Prints numbers from n down to 1 using recursion.
  """

  def upto(0), do: 0


  def upto(n) when n > 0 do

    upto(n - 1)
    IO.puts(n)
  end
end
