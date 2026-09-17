# The Homebrew install story now that the source is private: a CASK
# that installs the released, notarized .dmg — the same self-contained
# app a direct download gets — and links the `viode` command onto
# PATH. This file is the source of truth; at release time it is copied
# into the tap repository (edimoldovan/homebrew-viode, Casks/viode.rb)
# with the url and sha256 pointing at the published release. The
# source-building formula in packaging/homebrew/ remains a CI gate
# only.
cask "viode" do
  version "0.1.2"
  sha256 "5e63874ed7562184de81aaabb3d3d2bfa8ab5c4c89531b00e43a88af83bcb3ad"

  url "https://github.com/edimoldovan/viode-releases/releases/download/v#{version}/Viode-#{version}.dmg"
  name "Viode"
  desc "AI-native video editor: desktop app, terminal UI, CLI, one engine"
  homepage "https://eduardmoldovan.com/viode"

  app "Viode.app"
  binary "#{appdir}/Viode.app/Contents/MacOS/viode"

  zap trash: [
    "~/Library/Application Support/viode",
  ]
end
