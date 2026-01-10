  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.2.3"

    on_intel do
    sha256 "67a83f31455c6877f0f24e064d970b453e1ad464af2d4e34253ea1a6117afe14"
      url "https://github.com/Ashbaer/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/Ashbaer/conflux-app/"
    end

    on_arm do
    sha256 "169d94d8aaaf9722868705c2d2bfac024b5caaf826aa5c53254dba30565787a4"
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
