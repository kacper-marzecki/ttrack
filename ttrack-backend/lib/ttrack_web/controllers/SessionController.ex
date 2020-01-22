defmodule TtrackWeb.SessionController do
  use TtrackWeb, :controller

  import Doorman.Login.Session, only: [login: 2]

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn,  %{"email" => email, "password" => password}) do
    if user = Doorman.authenticate(email, password) do
      conn
      |> login(user) # Sets :user_id and :session_secret on conn's session
      |> redirect(to: "/")
    else
      conn
      |> send_json(400, %{})
    end
  end

  @spec send_json(Plug.Conn.t(), integer, map) :: Plug.Conn.t()
  defp send_json(conn, status, data) do
    response = Phoenix.json_library().encode_to_iodata!(data)
    resp(conn, conn.status || status, response)
  end
end
