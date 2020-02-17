defmodule Textmatrix.Buffer do
  @moduledoc """
  Textmatrix.Buffer encapsules the characters present in the matrix split up in
  lines an characters.
  """

  # the default filling character is a space
  @default_empty_char 32

  alias Textmatrix.{
    Buffer,
    Line
  }

  @type t :: %Buffer{
          lines: list(Line.t())
        }
  defstruct lines: []

  @doc """
  new/0 returns a new empty buffer
  """
  @spec new() :: Buffer.t()
  def new do
    %Buffer{}
  end

  @doc """
  ensure_capacity/2 resizes the buffer to the minimum requirted capacity. If the
  buffer is already of or above the required size, it will return the buffer as is.
  """
  @spec ensure_capacity(Buffer.t(), integer()) :: Buffer.t()
  def ensure_capacity(buffer, max_index) when is_number(max_index) do
    if length(buffer.lines) <= max_index do
      missing_lines = max_index - length(buffer.lines)
      missing_range = Enum.map(0..missing_lines, fn _ -> Line.new() end)

      %Buffer{lines: buffer.lines ++ missing_range}
    else
      buffer
    end
  end

  @doc """
  write/4 takes the buffer, x and y location and a string to write at that location.
  It returns an updated buffer.
  """
  @spec write(Buffer.t(), non_neg_integer(), non_neg_integer(), binary()) :: Buffer.t()
  def write(%Buffer{} = buffer, x, y, string)
      when is_integer(x) and is_integer(y) and is_binary(string) and x >= 0 and y >= 0 do
    buffer = Buffer.ensure_capacity(buffer, y)

    lines =
      List.update_at(buffer.lines, y, fn line ->
        Line.write_string(line, x, string)
      end)

    %Buffer{buffer | lines: lines}
  end

  @doc """
  to_string/1 takes the buffer and converts it into a multiline string.
  """
  @spec to_string(Buffer.t()) :: binary()
  def to_string(buffer, default_char \\ @default_empty_char) do
    buffer.lines
    |> Enum.map(&Line.to_string(&1, default_char))
    |> Enum.join("\n")
  end

  defimpl String.Chars, for: __MODULE__ do
    def to_string(buffer),
      do: Textmatrix.Buffer.to_string(buffer)
  end
end
