# The Homebrew install story now that the source is private: a CASK
# that installs the released, notarized .dmg — the same self-contained
# app a direct download gets — and links the `viode` command onto
# PATH. This file is the source of truth; at release time it is copied
# into the tap repository (edimoldovan/homebrew-viode, Casks/viode.rb)
# with the url and sha256 pointing at the published release. The
# source-building formula in packaging/homebrew/ remains a CI gate
# only.
cask "viode" do
  version "0.1.0"
  sha256 "67510ab9eb92a1f548f82047a95c568f359a060abc18ba5ff9ff31e691820a2a"

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
