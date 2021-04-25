defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  alias InmanaWeb.ErrorView

  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end

  def call(conn, {:ok, result}) do
    conn
    |> put_status(:ok)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
