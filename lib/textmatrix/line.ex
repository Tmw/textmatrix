defmodule Textmatrix.Line do
  @moduledoc """
  %Textmatrix.Line{} describes a single line in the Matrix.
  A line buffer consist of character slots which can either hold a single
  character or nil.
  """

  # the default filling character is a space
  @default_empty_char 32
  alias Textmatrix.Line

  @type t() :: %Line{
          chars: list(char)
        }
  defstruct chars: []

  @doc """
  new/0 initializes a new empty line struct
  """
  @spec new() :: Line.t()
  def new do
    %Textmatrix.Line{}
  end

  @doc """
  write_string/3 takes the line, a start position and a string and writes
  the characters of the given string to the given line buffer.
  """
  @spec write_string(Line.t(), integer(), binary()) :: Line.t()
  def write_string(%Line{} = line, x, string) when is_binary(string) do
    line = ensure_capacity(line, x + String.length(string))

    chars_and_indexes =
      string
      |> String.to_charlist()
      |> Enum.with_index(x)

    Enum.reduce(chars_and_indexes, line, fn {char, index}, line ->
      write_char(line, index, char)
    end)
  end

  @spec write_char(Line.t(), integer(), char()) :: Line.t()
  defp write_char(%Line{} = line, x, char) when is_integer(char) do
    chars = List.update_at(line.chars, x, fn _v -> char end)
    %Line{line | chars: chars}
  end

  @doc """
  ensure_capacity/2 resizes the given line buffer to the desired size. When the 
  provider buffer is of sufficient size, it returns the given buffer as is.
  """
  @spec ensure_capacity(Line.t(), integer) :: Line.t()
  def ensure_capacity(%Line{} = line, min_length) do
    if length(line.chars) < min_length do
      missing_slots = min_length - length(line.chars) - 1
      missing_slots = Enum.map(0..missing_slots, fn _ -> nil end)
      %Line{line | chars: line.chars ++ missing_slots}
    else
      line
    end
  end

  @doc """
  to_string/1 convert the given %Line{} struct to a single line string.
  """
  @spec to_string(Line.t()) :: binary()
  def to_string(%Line{} = line, emptychar \\ @default_empty_char) do
    line.chars
    |> Enum.map(&translate_char(&1, emptychar))
    |> IO.chardata_to_string()
  end

  defp translate_char(nil, emptychar), do: emptychar
  defp translate_char(char, _), do: char

  defimpl String.Chars, for: __MODULE__ do
    def to_string(buffer),
      do: Textmatrix.Line.to_string(buffer)
  end
end
