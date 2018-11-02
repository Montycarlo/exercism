defmodule Words do

  @re_word_separator ~r/[ _,:!&@#$%^*()]/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words_all = String.downcase(sentence)
      |> String.split(@re_word_separator, trim: true)
    Enum.reduce(words_all, %{}, fn w, acc -> Map.update(acc, w, 1, &(&1+1)) end)
  end

end
