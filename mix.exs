defmodule Textmatrix.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :textmatrix,
      version: @version,
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21.3"}
    ]
  end

  defp description() do
    """
    Textmatrix in Elixir. Make working with 2D text a breeze.
    """
  end

  defp package() do
    [
      maintainers: ["Tiemen Waterreus"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tmw/textmatrix"}
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "Textmatrix",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/textmatrix",
      source_url: "https://github.com/tmw/textmatrix",
      extras: [
        "README.md"
      ]
    ]
  end
end
