defmodule MeadTracker.Batches.Batch do
  alias MeadTracker.Batches.Note
  use Ecto.Schema

  @type t :: %__MODULE__{
          recipe: String.t() | nil,
          name: String.t() | nil,
          description: String.t() | nil,
          target_abv: Float.t() | nil,
          original_gravity: Float.t() | nil,
          final_gravity: Float.t() | nil,
          pitch_date: DateTime.t() | nil,
          notes: [Note.t()] | Ecto.Association.NotLoaded.t()
        }

  schema "batches" do
    field :recipe, :string
    field :name, :string
    field :description, :string
    field :target_abv, :float
    field :original_gravity, :float
    field :final_gravity, :float
    field :pitch_date, :utc_datetime
    has_many :notes, Note
  end
end
