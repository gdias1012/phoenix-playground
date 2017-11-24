defmodule PhoenixTest.VaiController do
    use PhoenixTest.Web, :controller

    @empty %{}

    def foi(conn, _) do
        PhoenixTest.Repo.start_link
        user = user_transform(1)
        # IO.inspect(user)
        # PhoenixTest.Repo.insert(user)
        1..100000
            |> Enum.map(&(user_transform(&1)))
            |> Enum.map(&(Task.async(fn () -> PhoenixTest.Repo.insert(&1) end)))
            # |> Enum.map(&Task.await/1)
            # |> Enum.map(&(IO.inspect(&1)))
        json conn, user
    end

    def aeeee(conn, _) do
        json conn, @empty
    end

    defp user_transform(value) do
      %PhoenixTest.User {
        name: "Nome " <> Integer.to_string(value),
        email: "email@email.com",
        password: "senha" <> Integer.to_string(value)
      }
    end

end
