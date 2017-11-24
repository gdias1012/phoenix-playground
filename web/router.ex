

defmodule PhoenixTest.Router do
  use PhoenixTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixTest do
    pipe_through :api
    get "/users", UserController, :get
    get "/users/:id", UserController, :detail
    get "/vai", VaiController, :foi
    get "/ae", VaiController, :aeeee
end

end
