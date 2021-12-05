defmodule ShareMe.Mem do
  @moduledoc """
  A super easy shared access to memory for all processes.

  iex> data = [1,2,3]
  iex> ShareMe.Mem.put "thekey", data
  iex> data == ShareMe.Mem.get "thekey"
  """

  @empty_value %{}

  @doc """
  Returns the memory content from a key

  Returns a term

  ## Examples

  iex> ShareMe.Mem.get("thekey")
  iex> %{}
  """
  def get(id) do
    maybe_create()
    case :ets.lookup(__MODULE__, id) do
      [] ->
        val = @empty_value
        :ets.insert(__MODULE__, {id, val})
        val

      [{^id, val}] ->
        val
    end
  end

  @doc """
  Write a term with the given key in memory

  Returns true

  ## Examples

  iex> ShareMe.Mem.put("thekey", [])
  iex> true
  """
  def put(id, val) do
    maybe_create()
    :ets.insert(__MODULE__, {id, val})
  end

  @doc """
  List all contents stored in memory

  Returns a list of key values

  ## Examples

  iex> ShareMe.Mem.put "thekey", []

  iex> ShareMe.Mem.list
  iex> [{"thekey", []}]
  """
  def list() do
    maybe_create()
    :ets.tab2list(__MODULE__)
  end

  @doc false
  defp maybe_create() do
    case :ets.info(__MODULE__, :size) do
      :undefined ->
        :ets.new(__MODULE__, [:set, :public, :named_table,
			      {:heir, Process.whereis(:init), []}])
      _ ->
        __MODULE__
    end
  end
end
