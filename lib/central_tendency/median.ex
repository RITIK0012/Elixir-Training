defmodule Tutorials.CentralTendency.Median do
require Integer
alias Tutorials.Validate
alias Tutorials.Errors
  def population_median(numbers) when is_list(numbers) do
    numbers
    |> Validate.validate()
    |> calc_median()
  end

  def population_median(_), do: Errors.invalid_data_type()

  defp calc_median({:error,_msg}), do: Errors.invalid_data_type()
  defp calc_median({false,_}), do: Errors.invalid_data_type()
  defp calc_median({true,nums}) do
    count = nums |> Enum.count()
    nums
    |> Enum.sort(fn x,y -> x<y end)
    |> get_median(Integer.is_even(count),count)
  end
  def get_median(nums, false,count), do: Enum.at(nums,div(count,2))
  def get_median(nums,true,count) do
    a = Enum.at(nums,div(count,2))
    b = Enum.at(nums,div(count - 1,2))
    (a + b) / 2
  end
end
