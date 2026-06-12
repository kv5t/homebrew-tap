cask "devbar" do
  version "0.1.0"
  sha256 "480e265f2f768e6d90801344200127b2c2b4355573e2721eb810e99863beb51e"

  url "https://github.com/kv5t/devbar/releases/download/v0.1.0/DevBar-0.1.0.dmg"
  name "DevBar"
  desc "Developer menu bar app for tunnels, ports and containers"
  homepage "https://github.com/kv5t/devbar"

  depends_on macos: ">= :sonoma"

  app "DevBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/DevBar.app"],
                   print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/DevBar",
    "~/Library/Preferences/com.devbar.app.plist",
    "~/Library/Caches/com.devbar.app",
  ]
end
