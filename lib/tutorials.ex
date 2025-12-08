defmodule Tutorials do
  alias Tutorials.CentralTendency.Mean

  defdelegate population_mean(numbers), to: Mean
  defdelegate sample_mean(numbers), to: Mean
end
