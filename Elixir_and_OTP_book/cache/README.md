# Cache-Server

## Usage

Clone the repo, cd to the cloned directory and type:

```
mix compile
```

To run the tests type:

```
mix test
```

## Available Functions

First start interactive Elixir shell ```iex -S mix```.


## start_link/0

To initiate worker process type

```elixir
iex> Cache.start_link
{:ok, #PID<0.121.0>} # The PID may differ
```

## write/2 | read/1

You can add any valid Elixir Data Type to your Cache-Server.

```elixir
iex> Cache.write(:some_list, ["Test", :list_item])
:ok

iex> Cache.write(1, "one")
:ok

iex> Cache.read(:some_list)
["Test", :list_item]
```

## delete/1 | exists?/1

You can delete any item in Cache-Server state. (```exists?/1``` checks if the given key is in the state or not)

```elixir
iex> Cache.delete(:some_list)
:ok

iex> Cache.exists?(:some_list)
false
```

## get/0 | clear/0

To reset the state of the process you can use `clear/0`. (```get/0``` returns the state of the process)

```elixir
iex> Cache.get
%{1 => "one"}

iex> Cache.clear
:ok

iex> Cache.get
%{}
```
 
