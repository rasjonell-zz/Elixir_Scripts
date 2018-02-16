defmodule Cache do
  use GenServer

  @name Cache

  ## Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, [name: Cache] ++ opts)
  end

  def write(key, val) do
    GenServer.call(@name, {:write, {key, val}})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def get() do
    GenServer.call(@name, :get)
  end

  def exists?(key) do
    GenServer.call(@name, {:exists, key})
  end

  def delete(key) do
    GenServer.cast(@name, {:delete, key})
  end

  def clear() do
    GenServer.cast(@name, :clear)
  end

  ## Server Callbacks

  def init(_args) do
    {:ok, %{}}
  end

  def handle_call({:write, {key, val}}, _from, state) do
    case Map.has_key?(state, key) do
      true ->
        {:reply, :ok, %{state | key => val}}

      false ->
        new_state = Map.put_new(state, key, val)
        {:reply, :ok, new_state}
    end
  end

  def handle_call({:read, key}, _from, state) do
    reply = Map.fetch!(state, key)
    {:reply, reply, state}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:exists, key}, _from, state) do
    {:reply, Map.has_key?(state, key), state}
  end

  def handle_cast(:clear, _state) do
    {:noreply, %{}}
  end

  def handle_cast({:delete, key}, state) do
    new_state = Map.delete(state, key)
    {:noreply, new_state}
  end
end
