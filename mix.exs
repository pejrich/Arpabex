defmodule Arpabex.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/pejrich/Arpabex"

  def project do
    [
      app: :arpabex,
      description: "Elixir NIF wrapper of Rust Arpabet phoneme prediction library",
      package: [
        name: "Arpabex",
        licenses: ["MIT"],
        links: %{"GitHub" => @source_url, "HexDocs" => "https://hexdocs.pm/arpabex/Arpabex.html"},
        source_url: @source_url,
        files:
          ~w(lib .formatter.exs mix.exs README* LICENSE*
                   CHANGELOG* checksum-*.exs native/arpabex_native/src native/arpabex_native/.cargo native/arpabex_native/Cargo.toml)
      ],
      docs: docs(),
      version: @version,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp docs do
    [
      main: "Arpabex",
      name: "Arpabex",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/arpabex",
      source_url: @source_url,
      extras: ["README.md", "CHANGELOG.md", "LICENSE"]
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
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:rustler, ">= 0.0.0", optional: true},
      {:rustler_precompiled, "~> 0.7.0"},
      {:benchee, "~> 1.1", only: [:dev, :test]}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
