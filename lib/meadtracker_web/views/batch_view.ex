defmodule MeadtrackerWeb.BatchView do
  use MeadtrackerWeb, :view

  alias MeadtrackerWeb.{BatchView, NoteView}

  def render("simple_index.json", %{batches: batches}) do
    render_many(batches, BatchView, "simple_batch.json")
  end

  def render("simple_batch.json", %{batch: batch}) do
    %{id: batch.id, name: batch.name, description: batch.description}
  end

  def render("show.json", %{batch: batch}) do
    render_one(batch, BatchView, "batch.json")
  end

  def render("batch.json", %{batch: batch}) do
    %{
      description: batch.description,
      final_gravity: batch.final_gravity,
      id: batch.id,
      name: batch.name,
      notes: render_many(batch.notes, NoteView, "note.json"),
      original_gravity: batch.original_gravity,
      pitch_date: batch.pitch_date,
      recipe: batch.recipe,
      target_abv: batch.target_abv
    }
  end
end
