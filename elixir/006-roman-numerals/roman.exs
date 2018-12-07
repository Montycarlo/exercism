defmodule Roman do

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    Integer.to_string(number)
    |> String.reverse 
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(fn {k,v} -> String.reverse convert_integers_roman(k,v) end)
    |> Enum.join
    |> String.reverse
  end

  @spec convert_integers_roman(b10_digit, position)
  defp convert_integers_roman(k,v) do
    # Converts a base10 digit `k` into a roman numeral given k*10^v
    digit = String.to_integer(k)
    cond do
      v == 0 -> convert_b10_digit_to_roman(digit, "I", "V", "X")
      v == 1 -> convert_b10_digit_to_roman(digit, "X", "L", "C")
      v == 2 -> convert_b10_digit_to_roman(digit, "C", "D", "M")
      v == 3 -> convert_b10_digit_to_roman(digit, "M", "", "")
    end
  end

  @spec convert_b10_digit_to_roman(base10_digit, char, char, char) :: String
  defp convert_b10_digit_to_roman(digit, r_unit_1, r_unit_5, r_unit_10) do
    # Converts a given base10 digit to roman numerals given the roman numeral units
    case digit do
      d when d < 4 -> String.duplicate(r_unit_1, d)
      d when d < 6 -> String.duplicate(r_unit_1, (5 - d)) <> r_unit_5
      d when d < 9 -> r_unit_5 <> String.duplicate(r_unit_1, (d - 5))
      _ -> String.duplicate(r_unit_1, (10 - digit)) <> r_unit_10
    end
  end

end
