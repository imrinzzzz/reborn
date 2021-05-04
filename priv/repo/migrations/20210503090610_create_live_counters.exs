defmodule Reborn.Repo.Migrations.CreateLiveCounters do
  use Ecto.Migration

  def change do
    create table(:live_counters) do
      add :counters, :integer

      timestamps()
    end
  end
end
