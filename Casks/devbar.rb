cask "devbar" do
  version "v0.1.0"
  sha256 "a86df11b0dfafa257cda78ab9d7fd306a638592415487413ef26c963c648d7d4"

  url "https://github.com/kv5t/devbar/releases/download/vv0.1.0/DevBar-v0.1.0.dmg"
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
