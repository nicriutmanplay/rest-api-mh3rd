defmodule MyApp.DatosTest do
  use MyApp.DataCase

  alias MyApp.Datos

  describe "monstruos" do
    alias MyApp.Datos.Monstruo

    @valid_attrs %{descripcion: "some descripcion", devilidad: "some devilidad", elemento: "some elemento", fortaleza: "some fortaleza", nombre: "some nombre"}
    @update_attrs %{descripcion: "some updated descripcion", devilidad: "some updated devilidad", elemento: "some updated elemento", fortaleza: "some updated fortaleza", nombre: "some updated nombre"}
    @invalid_attrs %{descripcion: nil, devilidad: nil, elemento: nil, fortaleza: nil, nombre: nil}

    def monstruo_fixture(attrs \\ %{}) do
      {:ok, monstruo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Datos.create_monstruo()

      monstruo
    end

    test "list_monstruos/0 returns all monstruos" do
      monstruo = monstruo_fixture()
      assert Datos.list_monstruos() == [monstruo]
    end

    test "get_monstruo!/1 returns the monstruo with given id" do
      monstruo = monstruo_fixture()
      assert Datos.get_monstruo!(monstruo.id) == monstruo
    end

    test "create_monstruo/1 with valid data creates a monstruo" do
      assert {:ok, %Monstruo{} = monstruo} = Datos.create_monstruo(@valid_attrs)
      assert monstruo.descripcion == "some descripcion"
      assert monstruo.devilidad == "some devilidad"
      assert monstruo.elemento == "some elemento"
      assert monstruo.fortaleza == "some fortaleza"
      assert monstruo.nombre == "some nombre"
    end

    test "create_monstruo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Datos.create_monstruo(@invalid_attrs)
    end

    test "update_monstruo/2 with valid data updates the monstruo" do
      monstruo = monstruo_fixture()
      assert {:ok, %Monstruo{} = monstruo} = Datos.update_monstruo(monstruo, @update_attrs)
      assert monstruo.descripcion == "some updated descripcion"
      assert monstruo.devilidad == "some updated devilidad"
      assert monstruo.elemento == "some updated elemento"
      assert monstruo.fortaleza == "some updated fortaleza"
      assert monstruo.nombre == "some updated nombre"
    end

    test "update_monstruo/2 with invalid data returns error changeset" do
      monstruo = monstruo_fixture()
      assert {:error, %Ecto.Changeset{}} = Datos.update_monstruo(monstruo, @invalid_attrs)
      assert monstruo == Datos.get_monstruo!(monstruo.id)
    end

    test "delete_monstruo/1 deletes the monstruo" do
      monstruo = monstruo_fixture()
      assert {:ok, %Monstruo{}} = Datos.delete_monstruo(monstruo)
      assert_raise Ecto.NoResultsError, fn -> Datos.get_monstruo!(monstruo.id) end
    end

    test "change_monstruo/1 returns a monstruo changeset" do
      monstruo = monstruo_fixture()
      assert %Ecto.Changeset{} = Datos.change_monstruo(monstruo)
    end
  end
end
