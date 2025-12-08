defmodule Tutorials.CentralTendency.Mean do
  alias Tutorials.Errors
  alias Tutorials.Validate

  @spec population_mean([number()]) :: number() | {:error, String.t()}
  def population_mean([]), do: Errors.invalid_data_type()

  def population_mean(numbers) when is_list(numbers) do
    numbers
    |> Validate.validate()
    |> calc_population_mean()
  end

def population_mean(_), do: Errors.invalid_data_type()
@spec sample_mean([number()]) :: number() | {:error, String.t()}

def sample_mean(numbers), do: population_mean(numbers)


  defp calc_population_mean({false, _}), do: Errors.invalid_data_type()

  defp calc_population_mean({true, nums}) do
    nums
    |> Enum.sum()
    |> mean(Enum.count(nums))
  end
  @spec mean(number(),number()) :: float()
  defp mean(sum, count), do: sum / count
end
