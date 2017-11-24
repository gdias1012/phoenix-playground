defmodule PhoenixTest.UserController do
    use PhoenixTest.Web, :controller

    def get(conn, _params) do
        Repo.start_link
        users = Repo.all(PhoenixTest.User)
        json con_status(conn, users), users
    end

    def detail(conn, %{"id" => id}) do
        Repo.start_link
        user = Repo.get(PhoenixTest.User, String.to_integer(id))
        json con_status(conn, user), user
    end

    defp con_status(conn :: Plug.Conn, nil) do
        conn
            |> put_status(:not_found)
    end

    defp con_status(conn, _) do
        conn
            |> put_status(:ok)
    end

end