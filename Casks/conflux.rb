  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.2.4"

    on_intel do
    sha256 "a3a7497520967aa7ce7755e549fc02d851b037d866f40c66d5d1331ba17db86e"
      url "https://github.com/Ashbaer/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/Ashbaer/conflux-app/"
    end

    on_arm do
    sha256 "1b366eaf29ee5235e6b9c331c8ea2c40359e2c203c4710ab9a2c71e29ac18f6f"
      url "https://github.com/Ashbaer/conflux-app/releases/download/v#{version}/Conflux_#{version}_aarch64.dmg",
          verified: "github.com/Ashbaer/conflux-app/"
    end

    name "Conflux"
    desc "Modern proxy management app based on MiHomo"
    homepage "https://github.com/Ashbaer/conflux-app"

    livecheck do
      url :url
      strategy :github_latest
    end

    app "Conflux.app"

    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-rd", "com.apple.quarantine", "#{appdir}/Conflux.app"],
                     sudo: false
    end

    zap trash: [
      "~/Library/Application Support/com.conflux.desktop",
      "~/Library/Caches/com.conflux.desktop",
      "~/Library/Preferences/com.conflux.desktop.plist",
      "~/Library/Saved Application State/com.conflux.desktop.savedState",
    ]
  end
