defmodule User do
  defstruct name: nil, age: nil

  def create(params) do
    with {:ok, age} <- parse_age(params[:age]),
         {:ok, name} <- parse_name(params[:name]) do
      %User{age: age, name: name}
    else
      _ -> {:error, "Cannot create user"}
    end
  end

  defp parse_age(nil), do: {:error, "age is required"}
  defp parse_age(age) when is_integer(age), do: {:ok, age}
  defp parse_age(_), do: {:error, "age must be an integer"}

  defp parse_name(nil), do: {:error, "name is required"}
  defp parse_name(""), do: parse_name(nil)
  defp parse_name(name), do: {:ok, name}
end

defmodule With do
  use Koans

  @intro """
  How to use with
  """

  koan "Age and name valid" do
    assert %User{age: 12, name: "Sally"} == User.create(%{age: 12, name: "Sally"})
  end

  koan "Age invalid" do
    assert {:error, "age must be an integer"} == User.create(%{age: "aaa", name: "Sally"})
  end

  koan "Name invalid" do
    assert {:error, "name is required"} == User.create(%{age: 12, name: nil})
  end

  koan "Any other error" do
    assert {:error, "Cannot create user"} == User.create(%{})
  end
end
