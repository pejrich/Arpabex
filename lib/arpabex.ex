defmodule Arpabex do
  @moduledoc """
  Documentation for `Arpabex`.
  """

  @doc """
  Generate phonemes from string

  ## Examples

      iex> Arpabex.phonemes_strs("notaword")
      ["N", "AA1", "T", "AH0", "W", "ER0", "D"]

  """
  def phoneme_strs(string), do: Arpabex.Native.phoneme_strs(string)
end
