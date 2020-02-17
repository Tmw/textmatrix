defmodule Textmatrix do
  @moduledoc """
  Textmatrix is a _thin_ wrapper around Charlists
  to make working with two dimensional text a breeze.

  Once you're done, turn it into a multiline string.

  ## Example
  iex> Textmatrix.new() 
  ...> |> Textmatrix.write(2, 2, "Hello, world!") 
  ...> |> Textmatrix.to_string()
  \n\n  Hello, world!
  """

  alias Textmatrix.Buffer

  defdelegate new(), to: Buffer
  defdelegate write(buffer, x, y, string), to: Buffer
  defdelegate to_string(buffer), to: Buffer
end
