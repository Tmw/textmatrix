# Textmatrix

Textmatrix is a _thin_ wrapper around Charlists
to make working with two dimensional text a breeze.

Once you're done, turn it into a multiline string.

## Example

```elixir
Textmatrix.new()
|> Textmatrix.write(2, 2, "Hello, world!")
|> Textmatrix.to_string()
\n\n  Hello, world!
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
