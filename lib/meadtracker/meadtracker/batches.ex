defmodule Meadtracker.Batches do
  import Ecto.Query
  alias Meadtracker.Batches.{Batch, Note}
  alias Meadtracker.Repo

  def batches_with_description do
    batches =
      Batch
      |> select([b], %{
        id: b.id,
        name: b.name,
        description: b.description
      })
      |> Repo.all()

    {:ok, batches}
  end

  def batch_with_notes(id) do
    batch =
      Batch
      |> preload(:notes)
      |> Repo.get_by(id: id)

    {:ok, batch}
  end
end
