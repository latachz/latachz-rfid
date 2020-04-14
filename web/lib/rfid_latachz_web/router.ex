defmodule RfidLatachzWeb.Router do
  use RfidLatachzWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", RfidLatachzWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/attendances", AttendanceController)
  end

  scope "/api", RfidLatachzWeb do
    pipe_through(:api)

    resources("/users", UserController, except: [:new, :edit])
  end

  # Other scopes may use custom stacks.
  # scope "/api", RfidLatachzWeb do
  #   pipe_through :api
  # end
end
