defmodule MeadtrackerWeb.BatchController do
  use MeadtrackerWeb, :controller

  def index(conn, _params) do
    with {:ok, batches} <- Batches.batches_with_description() do
      json(conn, batches)
    end
  end

  def show(conn, %{id: id}) do
    with {:ok, batch} <- Batches.batch_with_notes(id) do
      json(conn, batch)
    end
  end
end
