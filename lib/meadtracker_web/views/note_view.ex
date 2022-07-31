defmodule MeadtrackerWeb.NoteView do
  use MeadtrackerWeb, :view

  def render("note.json", %{note: note}) do
    %{
      date: note.date,
      id: note.id,
      note: note.note
    }
  end
end
