defmodule User do
  defstruct name: nil, age: nil

  def create(params) do
    age = params[:age]
    name = params[:name]

    cond do
      is_nil(age) or not is_integer(age) ->
        {:error, "age must be an integer"}

      is_nil(name) ->
        {:error, "name is required"}

      true ->
        {:ok, %User{age: age, name: name}}
    end
  end
end

defmodule With do
  use Koans

  @intro """
  How to use with
  """

  koan "Age and name valid" do
    assert {:ok, %User{age: 12, name: "Sally"}} == User.create(%{age: 12, name: "Sally"})
  end

  koan "Age invalid" do
    assert {:error, "age must be an integer"} == User.create(%{age: "aaa", name: "Sally"})
  end

  koan "Name invalid" do
    assert {:error, "name is required"} == User.create(%{age: 12, name: nil})
  end
end
