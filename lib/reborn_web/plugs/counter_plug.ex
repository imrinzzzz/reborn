defmodule RebornWeb.Plugs.Counter do
  alias Reborn.{Repo, LiveCounter}

  def init(default), do: default

  def call(conn, _) do
    LiveCounter
    |> create_if_not_exist()
    |> increment_counter()
    |> print_to_console()

    conn
  end

  defp create_if_not_exist(repo) do
    query = Repo.get(repo, 1)
    case query do
      %LiveCounter{counters: _counter} ->
        query

      nil ->
        Repo.insert!(%LiveCounter{counters: 1})

      _ ->
        "There was an error!"
    end
  end

  defp increment_counter(query) do
    LiveCounter.changeset(query, %{counters: query.counters+1})
    |> Repo.update!()
    |> Map.fetch!(:counters)
  end

  defp print_to_console(counter) do
    IO.inspect("The current counter is #{counter - 1}")
  end

end
