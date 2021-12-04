# PPRam

A super easy access to memory, shared for all processes.

## Example      
      iex>   data = %{a: 112}
      iex>   ShareMe.Mem.put "thekey", data
      iex>   data == ShareMe.Mem.get "thekey"

## Installation
```elixir

def deps do
  [
    {:shareme_mem, "~> 0.1.0"}
  ]
end
```