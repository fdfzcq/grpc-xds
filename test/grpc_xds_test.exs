defmodule GrpcXdsTest do
  use ExUnit.Case
  doctest GrpcXds

  test "greets the world" do
    assert GrpcXds.hello() == :world
  end
end
