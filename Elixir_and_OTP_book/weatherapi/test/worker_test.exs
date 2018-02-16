defmodule WeatherApi.WorkerTest do
  use ExUnit.Case
  require Logger

  test "checks the whether twice and checks the state, resets the state, stops the server" do
    WeatherApi.Worker.start_link()
    assert WeatherApi.Worker.get_stats() == %{}

    WeatherApi.Worker.get_temperature("Yerevan")
    assert WeatherApi.Worker.get_stats() == %{"Yerevan" => 1}

    WeatherApi.Worker.get_temperature("Yerevan")
    assert WeatherApi.Worker.get_stats() == %{"Yerevan" => 2}

    WeatherApi.Worker.reset_stats()
    assert WeatherApi.Worker.get_stats() == %{}
  end

  test "stops the server" do
    {:ok, pid} = WeatherApi.Worker.start_link()
    WeatherApi.Worker.stop()
    # :timer.sleep(3)
    assert Process.alive?(pid) == false
  end
end
