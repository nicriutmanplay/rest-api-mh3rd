defmodule MyApp.Repo.Migrations.CreateMonstruos do
  use Ecto.Migration

  def change do
    create table(:monstruos) do
      add :nombre, :string
      add :devilidad, :string
      add :fortaleza, :string
      add :elemento, :string
      add :descripcion, :string

      timestamps()
    end

    create unique_index(:monstruos, [:nombre])
  end
end
