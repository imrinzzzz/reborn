defmodule Reborn.LiveCounter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "live_counters" do
    field :counters, :integer

    timestamps()
  end

  @doc false
  def changeset(live_counter, attrs) do
    live_counter
    |> cast(attrs, [:counters])
    |> validate_required([:counters])
  end
end
