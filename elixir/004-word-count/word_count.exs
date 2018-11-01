defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words_all = String.downcase(sentence)
      |> (&(String.replace &1, ~r/[,:!&@#$%^*()]/, "")).()
      |> (&(String.split(&1, ~r/[ _]/, trim: true))).()
    Enum.reduce(words_all, %{}, fn w, acc -> Map.update(acc, w, 1, &(&1+1)) end)
  end

end
