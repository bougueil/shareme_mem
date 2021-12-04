defmodule Jop.Mixfile do
  use Mix.Project

  def project do
    [
      app: :shareme_mem,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod
    ]
  end

  def application do
    []
  end
end
