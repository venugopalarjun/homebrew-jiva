cask "jiva" do
  version "0.1.2"
  sha256 "58d6a452e0191cc77ce0a8be3c4b4c0438b090e77640357c91eee99fac0f40da"

  url "https://github.com/venugopalarjun/jiva/releases/latest/download/Jiva.dmg",
      verified: "github.com/venugopalarjun/jiva/"
  name "Jiva"
  desc "Fully-local meeting recorder, transcription, and dictation for Mac"
  homepage "https://jiva.works/"

  depends_on arch: :arm64

  # Per-user install (no admin password); matches the website installer.
  app "Jiva.app", target: "#{Dir.home}/Applications/Jiva.app"

  caveats <<~EOS
    Jiva is self-signed and not yet notarized by Apple. If macOS blocks the
    first launch ("unidentified developer" / "damaged"), reinstall without the
    download quarantine:

      brew install --cask jiva --no-quarantine

    On first open, the Welcome window grants permissions and downloads the
    on-device models (Parakeet for dictation and live transcription first).
  EOS
end
