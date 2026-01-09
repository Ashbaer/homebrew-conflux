  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.2.1"

    on_intel do
    sha256 "3e8b450432d1d7e5b688c1974b5fd06536618372b90bdbbea9677c4bb8a846f8"
      url "https://github.com/Ashbaer/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/Ashbaer/conflux-app/"
    end

    on_arm do
    sha256 "465d7360c3a5d35ebd7d4508f10689453afa7c0bb7e8338769db1b44b5849bf5"
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
