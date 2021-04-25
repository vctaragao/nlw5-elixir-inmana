defmodule InmanaWeb.RestaurantsControllerCreate do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias Inmana.Restaurants.Create
  alias InmanaWeb.FallbackController
  alias InmanaWeb.RestaurantsView

  action_fallback FallbackController

  def invoke(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> put_view(RestaurantsView)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
