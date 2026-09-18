cask "agent-manager" do
  version "2.8.2"
  sha256 "47c49387ae200906cd0ae36d19308b68d8cac6810f1c44663b307533fbb43af0"

  url "https://github.com/umechanhika/agent-manager-site/releases/download/v#{version}/AgentManager-#{version}-homebrew.dmg"
  name "AgentManager"
  desc "Menu bar companion that shows which Claude Code sessions are waiting for you"
  homepage "https://umechanhika.github.io/agent-manager-site/"

  livecheck do
    url "https://umechanhika.github.io/agent-manager-site/appcast.xml"
    strategy :sparkle
  end

  # Updates are delivered in-app by Sparkle; `brew upgrade` won't reinstall the same version.
  auto_updates true
  depends_on macos: :ventura

  app "AgentManager.app"

  zap trash: [
    "~/.claude/agent-manager",
    "~/Library/Preferences/com.umechanhika.agentmanager.plist",
  ]
end
