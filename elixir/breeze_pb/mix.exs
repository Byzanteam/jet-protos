defmodule BreezePb.MixProject do
  use Mix.Project

  def project do
    [
      app: :breeze_pb,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:proto | Mix.compilers()],
      proto_compiler: proto_compiler()
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
      {:grpc, "~> 0.7"},
      {:protobuf, "~> 0.10"},
      {:proto_compiler, github: "Byzanteam/proto_compiler", branch: "main", runtime: false}
    ]
  end

  defp proto_compiler do
    [
      proto_path: "./protos/",
      input: Path.wildcard("./protos/*.proto"),
      optional: true,
      output: {"./lib/breeze_pb/", package_prefix: "breeze_p_b"},
      grpc: true
    ]
  end
end
