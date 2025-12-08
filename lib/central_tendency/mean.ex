defmodule Tutorials.CentralTendency.Mean do
  alias Tutorials.Errors
  alias Tutorials.Validate
  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean(numbers) when is_list(numbers) do
    numbers
    |> Validate.validate()
    |> calc_population_mean()
  end

def population_mean(_), do: Errors.invalid_data_type()
  def calc_population_mean({false, _}), do: Errors.invalid_data_type()

  def calc_population_mean({true, nums}) do
    nums
    |> Enum.sum()
    |> mean(Enum.count(nums))
  end

  def mean(sum, count), do: sum / count
end
