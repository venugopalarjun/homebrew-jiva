cask "jiva" do
  version "0.1.20"
  sha256 "3371ae4b3a163b27532a811a9149b93e99b23da3a1d1f2741148cb0ac53dba46"

  url "https://github.com/venugopalarjun/jiva/releases/latest/download/Jiva.dmg",
      verified: "github.com/venugopalarjun/jiva/"
  name "Jiva"
  desc "Fully-local meeting recorder, transcription, and dictation for Mac"
  homepage "https://jiva.works/"

  depends_on arch: :arm64

  # Per-user install (no admin password); matches the website installer.
  app "Jiva.app", target: "#{Dir.home}/Applications/Jiva.app"

  caveats <<~EOS
    Jiva is self-signed and not yet notarized by Apple, so macOS may block the
    first launch ("unidentified developer" / "cannot be opened"). To open it
    the first time (only needed once):

      1. In Finder, open ~/Applications and Control-click (right-click) Jiva.
      2. Choose Open, then Open again in the dialog.

    If macOS still blocks it, go to System Settings > Privacy & Security and
    click "Open Anyway", then launch Jiva again.

    On first open, the Welcome window grants permissions and downloads the
    on-device models (Parakeet for dictation and live transcription first).
  EOS
end
