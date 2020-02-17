defmodule TextmatrixTest do
  use ExUnit.Case
  doctest Textmatrix

  describe "Textmatrix" do
    test "errors when given negative integers for position" do
      assert_raise FunctionClauseError, fn ->
        Textmatrix.new()
        |> Textmatrix.write(0, -2, "String")
        |> Textmatrix.to_string()
      end
    end

    test "renders multiline string" do
      buffer =
        Textmatrix.new()
        |> Textmatrix.write(2, 2, "line one")
        |> Textmatrix.write(2, 4, "line two")

      assert "\n\n  line one\n\n  line two" === Textmatrix.to_string(buffer)
    end

    test "overrides characters when overlap" do
      buffer =
        Textmatrix.new()
        |> Textmatrix.write(0, 0, "Hello, world!")
        |> Textmatrix.write(7, 0, "milkshake!")

      assert "Hello, milkshake!" === Textmatrix.to_string(buffer)
    end
  end
end
