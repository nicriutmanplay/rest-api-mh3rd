defmodule MyAppWeb.MonstruoControllerTest do
  use MyAppWeb.ConnCase

  alias MyApp.Datos
  alias MyApp.Datos.Monstruo

  @create_attrs %{
    descripcion: "some descripcion",
    devilidad: "some devilidad",
    elemento: "some elemento",
    fortaleza: "some fortaleza",
    nombre: "some nombre"
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    devilidad: "some updated devilidad",
    elemento: "some updated elemento",
    fortaleza: "some updated fortaleza",
    nombre: "some updated nombre"
  }
  @invalid_attrs %{descripcion: nil, devilidad: nil, elemento: nil, fortaleza: nil, nombre: nil}

  def fixture(:monstruo) do
    {:ok, monstruo} = Datos.create_monstruo(@create_attrs)
    monstruo
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all monstruos", %{conn: conn} do
      conn = get(conn, Routes.monstruo_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create monstruo" do
    test "renders monstruo when data is valid", %{conn: conn} do
      conn = post(conn, Routes.monstruo_path(conn, :create), monstruo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.monstruo_path(conn, :show, id))

      assert %{
               "id" => id,
               "descripcion" => "some descripcion",
               "devilidad" => "some devilidad",
               "elemento" => "some elemento",
               "fortaleza" => "some fortaleza",
               "nombre" => "some nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.monstruo_path(conn, :create), monstruo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update monstruo" do
    setup [:create_monstruo]

    test "renders monstruo when data is valid", %{conn: conn, monstruo: %Monstruo{id: id} = monstruo} do
      conn = put(conn, Routes.monstruo_path(conn, :update, monstruo), monstruo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.monstruo_path(conn, :show, id))

      assert %{
               "id" => id,
               "descripcion" => "some updated descripcion",
               "devilidad" => "some updated devilidad",
               "elemento" => "some updated elemento",
               "fortaleza" => "some updated fortaleza",
               "nombre" => "some updated nombre"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, monstruo: monstruo} do
      conn = put(conn, Routes.monstruo_path(conn, :update, monstruo), monstruo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete monstruo" do
    setup [:create_monstruo]

    test "deletes chosen monstruo", %{conn: conn, monstruo: monstruo} do
      conn = delete(conn, Routes.monstruo_path(conn, :delete, monstruo))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.monstruo_path(conn, :show, monstruo))
      end
    end
  end

  defp create_monstruo(_) do
    monstruo = fixture(:monstruo)
    {:ok, monstruo: monstruo}
  end
end
