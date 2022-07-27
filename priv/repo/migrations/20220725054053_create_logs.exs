defmodule Meadtracker.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:batches) do
      add :recipe, :text
      add :name, :text
      add :description, :text
      add :target_abv, :float
      add :original_gravity, :float
      add :final_gravity, :float
      add :pitch_date, :utc_datetime
    end

    create table(:notes) do
      add :batch_id, references(:batches)
      add :note, :text
      add :date, :utc_datetime
    end
  end
end
