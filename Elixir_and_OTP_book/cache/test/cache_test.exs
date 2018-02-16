defmodule CacheTest do
  use ExUnit.Case

  test "starts server, writes/reads caches" do
    Cache.start_link()

    Cache.write(:names, ["Name1", "Name2"])
    Cache.write(:nums, [1, 2, 3])
    assert Cache.read(:names) == ["Name1", "Name2"]
  end

  test "deletes cache, clears the state" do
    Cache.start_link
    
    Cache.delete(:names)
    assert Cache.exists?(:names) == false

    Cache.clear()
    assert Cache.get() == %{}
  end
end
