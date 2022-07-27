defmodule Meadtracker.Batches.Note do
  alias Meadtracker.Batches.Batch
  use Ecto.Schema

  @type t :: %__MODULE__{
          note: String.t() | nil,
          date: DateTime.t() | nil
        }

  schema "notes" do
    field :note, :string
    field :date, :utc_datetime
    belongs_to :batch, Batch
  end
end
