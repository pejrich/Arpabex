defmodule Arpabex.Native do
  @moduledoc false
  version = Mix.Project.config()[:version]
  github_url = Mix.Project.config()[:package][:source_url]

  use RustlerPrecompiled,
    otp_app: :arpabex,
    crate: "arpabex_native",
    base_url: "#{github_url}/releases/download/v#{version}",
    force_build: System.get_env("ARPABEX_BUILD") in ["1", "true"],
    version: version

  def phoneme_strs(_string), do: :erlang.nif_error(:nif_not_loaded)
end
