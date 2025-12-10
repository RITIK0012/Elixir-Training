defmodule Tutorials do
  alias Tutorials.CentralTendency.Mean
  alias Tutorials.CentralTendency.Median
  defdelegate population_mean(numbers), to: Mean
  defdelegate sample_mean(numbers), to: Mean
  defdelegate population_median(numbers), to: Median
end
