defmodule Tutorials.Structs.SevenWonders do
  defstruct(
    name: "",
    country: ""
  )

  alias Tutorials.Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  def all() do
    [
      %SevenWonders{name: "Great Wall of China", country: "China"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Roman Colosseum", country: "Italy"},
      %SevenWonders{name: "Taj Mahal", country: "India"}
    ]
  end

  @spec print_wonders([t()]) :: :ok
  def print_wonders(wonders) do
    Enum.each(wonders,fn %{name: name}-> IO.puts(name) end)
  end

  @spec filter_by_wonders([t()], String.t()) :: [t()]
  def filter_by_wonders(wonders, country) do
    wonders
    |> Enum.filter(fn %{country: country_name}-> country_name == country end)
  end
end
