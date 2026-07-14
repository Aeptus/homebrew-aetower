cask "aetower" do
  version "0.8.1,801"
  sha256 "46d623a1a64955043bdbf38afd04c73702ec589be18e71a11d55a5c13fb3b940"

  url "https://aetower.dev/releases/Aetower-#{version.csv.first}-#{version.csv.second}.zip"
  name "Aetower"
  desc "Local-first observability for operators, developers, and AI agents"
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

  zap trash: [
    "~/Library/Application Support/Aetower",
    "~/Library/Caches/com.aeptus.aetower",
    "~/Library/Logs/Aetower",
    "~/Library/Preferences/com.aeptus.aetower.plist",
  ]

  caveats <<~EOS
    Homebrew links the bundled `aetower` command to:
      $(brew --prefix)/bin/aetower
    Keep Aetower.app running, then try:
      aetower top
      aetower storage
      aetower repos
  EOS
end
