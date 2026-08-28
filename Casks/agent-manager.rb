cask "agent-manager" do
  version "2.5.1"
  sha256 "f738f5035c37511357b1ff74c33ec7e0e03abf6a1907f4e7b92426af2307aa85"

  url "https://github.com/umechanhika/agent-manager-site/releases/download/v#{version}/AgentManager-#{version}.dmg"
  name "AgentManager"
  desc "Menu bar companion that shows which Claude Code sessions are waiting for you"
  homepage "https://umechanhika.github.io/agent-manager-site/"

  livecheck do
    url "https://umechanhika.github.io/agent-manager-site/appcast.xml"
    strategy :sparkle
  end

  # Updates are delivered in-app by Sparkle; `brew upgrade` won't reinstall the same version.
  auto_updates true
  depends_on macos: ">= :ventura"

  app "AgentManager.app"

  zap trash: [
    "~/.claude/agent-manager",
    "~/Library/Preferences/com.umechanhika.agentmanager.plist",
  ]
end
