use Bitwise

defmodule SecretHandshake do

  @wink 0b1
  @double_blink 0b10
  @close_eyes 0b100
  @jump 0b1000
  @reverse 0b10000

  defp checkAction(action, code) do
    (action &&& code) != 0
  end

  @doc """
  Determines if the action is part of the handshake, and adds it
  to an accumulator array `acc` if required.
  """
  defp addAction(action, actionName, code, acc) do
    case checkAction(action, code) do
      true -> acc ++ [actionName]
      false -> acc
    end
  end

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do

    v1 = addAction(@wink, "wink", code, [])
    v2 = addAction(@double_blink, "double blink", code, v1)
    v3 = addAction(@close_eyes, "close your eyes", code, v2)
    v4 = addAction(@jump, "jump", code, v3)

    case checkAction(@reverse, code) do
      true -> Enum.reverse v4
      false -> v4
    end
  end
end
