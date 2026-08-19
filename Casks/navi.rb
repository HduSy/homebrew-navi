cask "navi" do
  version "0.3.6"
  sha256 "f0d9323f924e30b0d1f634ddcf53c196720ea89fd75128fe67afae0485e4d34d"

  url "https://github.com/HduSy/navi/releases/download/v0.3.6/Navi_0.3.6_aarch64.dmg"
  name "Navi"
  desc "AI work companion that observes, remembers, and grows with you"
  homepage "https://github.com/HduSy/navi"

  depends_on macos: :catalina
  depends_on arch: :arm64

  app "Navi.app"

  # Unsigned/unnotarized build: strip the quarantine flag Homebrew
  # adds so the app opens without the "Apple cannot verify" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Navi.app"],
                   sudo: false
  end
end
