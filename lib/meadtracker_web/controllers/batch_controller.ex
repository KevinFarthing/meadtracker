defmodule MeadtrackerWeb.BatchController do
  use MeadtrackerWeb, :controller

  alias Meadtracker.Batches

  def index(conn, _params) do
    with {:ok, batches} <- Batches.batches_with_description() do
      # json(conn, batches)
      conn
      |> render("simple_index.json", %{batches: batches})
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, batch} <- Batches.batch_with_notes(id) do
      # json(conn, batch)
      conn
      |> render("show.json", %{batch: batch})
    end
  end
end
