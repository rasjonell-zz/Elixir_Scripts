defmodule CacheTest do
  use ExUnit.Case

  test "greets the world" do
    Cache.start_link()

    Cache.write(:names, ["Name1", "Name2"])
    Cache.write(:nums, [1, 2, 3])
    assert Cache.read(:names) == ["Name1", "Name2"]

    Cache.delete(:names)
    assert Cache.exists?(:names) == false

    Cache.clear()
    assert Cache.get() == %{}
  end
end
