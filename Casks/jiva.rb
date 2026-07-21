cask "jiva" do
  version "0.1.0"
  sha256 "e218f6bd8b27cb112eaac36362416ec4555082cd2256f6f11810652b5f213fbf"

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
