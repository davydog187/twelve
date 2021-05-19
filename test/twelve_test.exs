defmodule TwelveTest do
  use ExUnit.Case
  doctest Twelve

  test "greets the world" do
    assert Twelve.hello() == :world
  end
end
