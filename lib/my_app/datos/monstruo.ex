defmodule MyApp.Datos.Monstruo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "monstruos" do
    field :descripcion, :string
    field :devilidad, :string
    field :elemento, :string
    field :fortaleza, :string
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(monstruo, attrs) do
    monstruo
    |> cast(attrs, [:nombre, :devilidad, :fortaleza, :elemento, :descripcion])
    |> validate_required([:nombre, :devilidad, :fortaleza, :elemento, :descripcion])
    |> unique_constraint(:nombre)
  end
end
