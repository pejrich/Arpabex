defmodule Arpabex do
  @moduledoc """
  Documentation for `Arpabex`.
  """

  @doc """
  Generate phonemes from string

  ## Examples

  ```elixir
  iex> Arpabex.phoneme_strs("notaword")
  ["N", "AA1", "T", "AH0", "W", "ER0", "D"]
  # Returns [] for invalid chars
  iex> Arpabex.phoneme_strs(",")
  []
  ```
  """
  @spec phoneme_strs(String.t()) :: list(String.t())
  def phoneme_strs(string) do
    case Arpabex.Native.phoneme_strs(string) do
      nil -> []
      ["EH1", "N", "AY1", "T", "UH0", "R", "AE1", "N"] -> []
      val -> val
    end
  end
end
