defmodule Tutorials.Validate do
  alias Tutorials.Errors

def validate(nums) when is_list(nums) do
    {Enum.all?(nums, fn el -> is_number(el) end), nums}
  end
def validate(_), do: Errors.invalid_data_type()
end
