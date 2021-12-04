# ShareMe.Mem

A super easy access to memory, shared by all processes.

## Example      
      iex>   ShareMe.Mem.create(self())
      iex>   data = %{a: 112}
      iex>   ShareMe.Mem.put "thekey", data
      iex>   data == ShareMe.Mem.get "thekey"

## Installation
```elixir

def deps do
  [
     {:shareme_mem, git: "git://github.com/bougueil/shareme_mem"}
  ]
end
```