  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.2.0"

    on_intel do
    sha256 "55e955bc561dda82bbe2cb5deb6a2184f1799633fa8b58639afd68e96b717143"
      url "https://github.com/Ashbaer/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/Ashbaer/conflux-app/"
    end

    on_arm do
    sha256 "78b17c3be1fbcae68ebce44455a20806ecd907a0b97c0c8174f8ba4b5668aaa3"
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
