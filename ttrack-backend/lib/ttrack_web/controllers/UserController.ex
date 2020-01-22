defmodule TtrackWeb.UserController do
  use TtrackWeb, :controller
  alias Doorman.Auth.Secret
  alias Ttrack.User

  def new(conn, _params) do
    changeset = User.create_changeset(%User{})
    conn |> json( changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset =
      %User{}
      |> User.create_changeset(user_params)
      |> Secret.put_session_secret()

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn |> json("OK")
      {:error, changeset} ->
        conn |> json(changeset: changeset)
    end
  end

  def register(conn, %{"user" => user_params}) do
    _changeset =
      %User{}
      |> User.create_changeset(user_params)
      |> Secret.put_session_secret()

    case Repo.insert(_changeset) do
      {:ok, user} ->
        conn |> send_resp(200, "")
      {:error, _changeset} ->
        conn |> send_resp(200, "")
        # json(%{conn | }, changeset: changeset)
    end
  end

  def kek(conn) do
    resp(conn, 200, "body")
  end
end
