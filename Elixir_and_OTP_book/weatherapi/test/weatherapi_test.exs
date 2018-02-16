defmodule WeatherapiTest do
  use ExUnit.Case
  doctest Weatherapi

  test "greets the world" do
    assert Weatherapi.hello() == :world
  end
end
