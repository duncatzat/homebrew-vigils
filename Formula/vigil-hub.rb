class VigilHub < Formula
  desc "Local-first control plane for AI agents - CLI gateway (firewall/redaction/audit)"
  homepage "https://vigils.ai"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/duncatzat/vigils/releases/download/v#{version}/vigils-cli-macos-arm64.tar.gz"
      sha256 "989adf73064ab7edf765642d74013097943208bef352da2abbab582a89810832"
    else
      url "https://github.com/duncatzat/vigils/releases/download/v#{version}/vigils-cli-macos-x64.tar.gz"
      sha256 "e2b8a8e329fcfce941ff01b7e6f9b4cb317322fd075347029e7a124c972160c8"
    end
  end

  on_linux do
    url "https://github.com/duncatzat/vigils/releases/download/v#{version}/vigils-cli-linux-x64.tar.gz"
    sha256 "c2750d3950ca8ba26986f00ae210844b284937e31f8df5f9be172cecb1a9c987"
  end

  def install
    bin.install "vigil-hub"
    bin.install "vigil-native-host"
  end

  def caveats
    <<~EOS
      Protect every detected AI agent (reversible, configs are backed up):
        vigil-hub setup --all
      See the 30-second falsifiable demo (no account, no network, no LLM):
        vigil-hub demo --tamper
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vigil-hub --version")
  end
end
