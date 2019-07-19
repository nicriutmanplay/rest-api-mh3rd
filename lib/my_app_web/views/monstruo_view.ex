defmodule MyAppWeb.MonstruoView do
  use MyAppWeb, :view
  alias MyAppWeb.MonstruoView

  def render("index.json", %{monstruos: monstruos}) do
    %{data: render_many(monstruos, MonstruoView, "monstruo.json")}
  end

  def render("show.json", %{monstruo: monstruo}) do
    %{data: render_one(monstruo, MonstruoView, "monstruo.json")}
  end

  def render("monstruo.json", %{monstruo: monstruo}) do
    %{id: monstruo.id,
      nombre: monstruo.nombre,
      devilidad: monstruo.devilidad,
      fortaleza: monstruo.fortaleza,
      elemento: monstruo.elemento,
      descripcion: monstruo.descripcion}
  end
end
