defmodule ShareMe.Mem.Test do
  use ExUnit.Case

  def clean_jop_files(bank) do
    for file <- Path.wildcard("jop_#{bank}*.gz"), do: File.rm!(file)
  end

  test "1 process" do
    data = %{a: 112}
    ShareMe.Mem.put("thekey", data)
    assert data == ShareMe.Mem.get("thekey")
  end

  test "2 processes" do
    data = %{a: 112}
    task = Task.async(fn -> ShareMe.Mem.put("thekey", data) end)
    Task.await(task)
    assert data == ShareMe.Mem.get("thekey")
  end
end
