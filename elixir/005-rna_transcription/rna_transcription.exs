defmodule RNATranscription do

  #Transcribes a single character representing a DNA nucleotide to a RNA nucleotide
  @spec dna_nucleo_to_rna_nucleo(char) :: char
  defp dna_nucleo_to_rna_nucleo(char) do
    case char do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &dna_nucleo_to_rna_nucleo/1)
  end

end
