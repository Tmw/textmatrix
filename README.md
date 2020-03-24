![](https://github.com/tmw/textmatrix/workflows/Elixir%20CI/badge.svg)

# Textmatrix

Textmatrix is a _thin_ wrapper around charlist to make working with two dimensional text a breeze. Once you're done, turn it into a multiline string.

## Example

```elixir
buffer = 
  Textmatrix.new()
  |> Textmatrix.write(2, 2, "+---------------+")
  |> Textmatrix.write(2, 3, "| Hello, world! |")
  |> Textmatrix.write(2, 4, "+---------------+")

IO.puts(buffer)
```

which will result in the example below being printed to stdout.

```txt

  +---------------+
  | Hello, world! |
  +---------------+
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `textmatrix` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:textmatrix, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/textmatrix](https://hexdocs.pm/textmatrix).

## License

[MIT](LICENSE)
