cask "vigils" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm: "29df47a5d0df765195000fcc083b036f0008cfb92878c29e9626203c0fa3c84c", intel: "d35f57fb5f28193faf44c71e9942d33638ee5f5ad187df168f32c511dad94255"

  url "https://github.com/duncatzat/vigils/releases/download/v#{version}/Vigils_#{version}_#{arch}.dmg"
  name "Vigils"
  desc "Local-first control plane for AI agents - Aegis desktop"
  homepage "https://vigils.ai"

  auto_updates true # built-in Tauri OTA updater (Ed25519-signed)

  app "Vigils.app"

  caveats <<~EOS
    Vigils is not yet notarized. On first launch macOS may block it - allow once via:
      System Settings -> Privacy & Security -> "Open Anyway"
    (or: xattr -dr com.apple.quarantine /Applications/Vigils.app)
  EOS

  zap trash: [
    "~/Library/Application Support/Vigils",
    "~/Library/Caches/ai.vigils.desktop",
  ]
end
