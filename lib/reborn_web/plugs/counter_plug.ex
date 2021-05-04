defmodule RebornWeb.Plugs.Counter do
  @moduledoc """
  A plug that increment counters and print to console
  """
  alias Reborn.{Repo, LiveCounter}
  require Logger
  use Plug.Debugger

  @spec init(default()) :: any()
  @type default() :: any()
  def init(default), do: default

  @spec call(conn(), any()) :: conn()
  @type conn() :: Plug.Conn
  def call(conn, _) do
    LiveCounter
    |> create_if_not_exist()
    |> increment_counter()
    |> print_to_console()
    |> Logger.info()

    conn
  end

  @spec create_if_not_exist(repo()) :: LiveCounter
  @type repo() :: LiveCounter
  defp create_if_not_exist(repo) do
    query = Repo.get!(repo, 1)
    case query do
      %LiveCounter{counters: _counter} ->
       query

      nil ->
        Repo.insert!(%LiveCounter{counters: 1})

      _ ->
        "There was an error!"
    end
  end

  @spec increment_counter(query()) :: integer()
  @type query() :: LiveCounter
  defp increment_counter(query) do
    LiveCounter.changeset(query, %{counters: query.counters+1})
    |> Repo.update!()
    |> Map.fetch!(:counters)
  end

  @spec print_to_console(counter()) :: String.t()
  @type counter() :: integer()
  defp print_to_console(counter) do
    fences = String.duplicate("=", 30)
    str = """
      \n
      #{fences}
      The current counter is #{counter - 1}
      #{fences}
      """
    str
  end

end
