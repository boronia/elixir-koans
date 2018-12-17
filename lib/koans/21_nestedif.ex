defmodule NestedIf do
  use Koans

  @intro """
  How do I turn crappy Elixir code into Beautiful Elixir code?
  """

  def initials(name, delimiter \\ "") do
    if name == nil or name == "" do
      raise ArgumentError, message: "Name cannot be nil or empty"
    else
      if String.contains?(name, " ") do
        split_name = name |> String.split(" ")

        first_letter = split_name |> List.first() |> String.slice(0, 1)
        last_letter = split_name |> List.last() |> String.slice(0, 1)

        "#{first_letter}#{delimiter}#{last_letter}"
      else
        name |> String.slice(0, 1)
      end
    end
  end

  koan "Simple 2 characters initials should be no problemo" do
    assert initials("Veronica Luke") == "VL"
  end

  koan "Just 1 word should yield the first char" do
    assert initials("Von") == "V"
  end

  koan "Nil should raise an error" do
    assert_raise ArgumentError, "Name cannot be nil or empty", fn -> initials(nil) end
  end

  koan "Empty string should raise an error" do
    assert_raise ArgumentError, "Name cannot be nil or empty", fn -> initials("") end
  end

  koan "But how about more than 2 characters initials?" do
    assert initials("Veronica Wai Ming Luke") == ___
  end

  koan "And what if I want a dot?" do
    assert initials("Veronica Luke", ".") == ___
    assert initials("Veronica Wai Ming Luke", ".") == ___
  end
end
