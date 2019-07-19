defmodule MyApp.Datos do
  @moduledoc """
  The Datos context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Datos.Monstruo

  @doc """
  Returns the list of monstruos.

  ## Examples

      iex> list_monstruos()
      [%Monstruo{}, ...]

  """
  def list_monstruos do
    Repo.all(Monstruo)
  end

  @doc """
  Gets a single monstruo.

  Raises `Ecto.NoResultsError` if the Monstruo does not exist.

  ## Examples

      iex> get_monstruo!(123)
      %Monstruo{}

      iex> get_monstruo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_monstruo!(id), do: Repo.get!(Monstruo, id)

  @doc """
  Creates a monstruo.

  ## Examples

      iex> create_monstruo(%{field: value})
      {:ok, %Monstruo{}}

      iex> create_monstruo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_monstruo(attrs \\ %{}) do
    %Monstruo{}
    |> Monstruo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a monstruo.

  ## Examples

      iex> update_monstruo(monstruo, %{field: new_value})
      {:ok, %Monstruo{}}

      iex> update_monstruo(monstruo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_monstruo(%Monstruo{} = monstruo, attrs) do
    monstruo
    |> Monstruo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Monstruo.

  ## Examples

      iex> delete_monstruo(monstruo)
      {:ok, %Monstruo{}}

      iex> delete_monstruo(monstruo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_monstruo(%Monstruo{} = monstruo) do
    Repo.delete(monstruo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking monstruo changes.

  ## Examples

      iex> change_monstruo(monstruo)
      %Ecto.Changeset{source: %Monstruo{}}

  """
  def change_monstruo(%Monstruo{} = monstruo) do
    Monstruo.changeset(monstruo, %{})
  end
end
