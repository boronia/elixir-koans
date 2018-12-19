defmodule User do
  defstruct name: nil, age: nil
end

defmodule Context do
  @records %{
    1 => %User{name: "Luke", age: 18},
    2 => %User{age: 12, name: "Sally"}
  }
  def find(id) when is_integer(id) do
    Map.get(@records, id)
  end

  def find(_), do: nil
end

defmodule With do
  use Koans

  def get_user(id) do
    with user <- Context.find(id) do
      if is_nil(user) do
        {:error, "Failed to find user by id #{id}"}
      else
        {:ok, user}
      end
    end
  end

  @intro """
  How do I refactor my conditional that does error handling using 'with'?
  """

  koan "Find user 1" do
    assert {:ok, %User{age: 18, name: "Luke"}} == get_user(1)
  end

  koan "Find user 2" do
    assert {:ok, %User{age: 12, name: "Sally"}} == get_user(2)
  end

  koan "Non exist user" do
    assert {:error, "Failed to find user by id 3"} == get_user(3)
  end
end
