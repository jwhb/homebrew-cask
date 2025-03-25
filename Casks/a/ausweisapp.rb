cask "ausweisapp" do
  version "2.3.1"
  sha256 "8fdd68655c845547cf0464aa66d1af2d11c2f93a9b6c9ae866ea2055a5b4952b"

  url "https://github.com/Governikus/AusweisApp/releases/download/#{version}/AusweisApp-#{version}.dmg",
      verified: "github.com/Governikus/AusweisApp/"
  name "AusweisApp"
  desc "Enables secure online identification with German eID cards and NFC devices"
  homepage "https://www.ausweisapp.bund.de/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "AusweisApp.app"

  zap trash: [
    "~/Library/Application Scripts/com.governikus.ausweisapp2",
    "~/Library/Application Scripts/com.governikus.AusweisApp2.AutostartHelper",
    "~/Library/Containers/com.governikus.ausweisapp2",
    "~/Library/Containers/com.governikus.AusweisApp2.AutostartHelper",
    "~/Library/Preferences/com.governikus-gmbh-co-kg.AusweisApp2.plist",
  ]

  caveats do
    requires_rosetta
  end
end
