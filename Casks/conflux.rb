  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.2.1"

    on_intel do
    sha256 "2db41d17983ee115143abe58e5833c10dec433d79b268e5749c1f17ef119d39a"
      url "https://github.com/Ashbaer/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/Ashbaer/conflux-app/"
    end

    on_arm do
    sha256 "ef8e227e67ff2c79bf03586fe1e9f081ff6c787c3872dd2aae52f31dcb87bf7d"
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
