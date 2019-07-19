defmodule MyAppWeb.MonstruoController do
  use MyAppWeb, :controller

  alias MyApp.Datos
  alias MyApp.Datos.Monstruo

  action_fallback MyAppWeb.FallbackController

  def index(conn, _params) do
    monstruos = Datos.list_monstruos()
    render(conn, "index.json", monstruos: monstruos)
  end

  def create(conn, %{"monstruo" => monstruo_params}) do
    with {:ok, %Monstruo{} = monstruo} <- Datos.create_monstruo(monstruo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.monstruo_path(conn, :show, monstruo))
      |> render("show.json", monstruo: monstruo)
    end
  end

  def show(conn, %{"id" => id}) do
    monstruo = Datos.get_monstruo!(id)
    render(conn, "show.json", monstruo: monstruo)
  end

  def update(conn, %{"id" => id, "monstruo" => monstruo_params}) do
    monstruo = Datos.get_monstruo!(id)

    with {:ok, %Monstruo{} = monstruo} <- Datos.update_monstruo(monstruo, monstruo_params) do
      render(conn, "show.json", monstruo: monstruo)
    end
  end

  def delete(conn, %{"id" => id}) do
    monstruo = Datos.get_monstruo!(id)

    with {:ok, %Monstruo{}} <- Datos.delete_monstruo(monstruo) do
      send_resp(conn, :no_content, "")
    end
  end
end
