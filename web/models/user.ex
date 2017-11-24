defmodule PhoenixTest.User do
  use PhoenixTest.Web, :model
    # defstruct [:id, :name, :email, :password, :stooge]
  
    schema "usuario" do
      field :name, :string
      field :email, :string
      field :password, :string
  end
  
end