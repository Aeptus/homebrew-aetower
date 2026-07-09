cask "aetower" do
  version "0.8,800"
  sha256 "c123c2ba29152ff268c4aff866bc8248c0c23f59e59c20cf2f8d2af7646df8ea"

  url "https://aetower.dev/releases/Aetower-#{version.before_comma}-#{version.after_comma}.zip"
  name "Aetower"
  desc "Local-first macOS observability for operators, developers, and AI agents"
  homepage "https://aetower.dev/"

  livecheck do
    url "https://aetower.dev/releases/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Aetower.app"
  binary "#{appdir}/Aetower.app/Contents/Helpers/aetower",
         target: "aetower"

  caveats <<~EOS
    Homebrew links the bundled `aetower` command to:
      $(brew --prefix)/bin/aetower
    Keep Aetower.app running, then try:
      aetower top
      aetower storage
      aetower repos
  EOS

  zap trash: [
    "~/Library/Application Support/Aetower",
    "~/Library/Caches/com.aeptus.aetower",
    "~/Library/Logs/Aetower",
    "~/Library/Preferences/com.aeptus.aetower.plist",
  ]
end
