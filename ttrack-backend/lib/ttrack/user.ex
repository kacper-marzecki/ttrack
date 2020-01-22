defmodule Ttrack.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Doorman.Auth.Bcrypt, only: [hash_password: 1]

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :session_secret, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :session_secret])
    |> validate_required([:email, :hashed_password, :session_secret])
  end

  @spec create_changeset(any, any) :: none
  def create_changeset(struct, params \\ %{}) do
    struct
    # |> cast(params, ~w(email password))
    |> cast(params, [:email, :password])
    |> hash_password
  end
end
