defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(conn, params) do
    Welcomer.welcome(params) |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn), do: return_response(conn, message, :ok)
  defp handle_response({:error, message}, conn), do: return_response(conn, message, :bad_request)

  def return_response(conn, message, status) do
    conn |> put_status(status) |> json(%{message: message})
  end
end
