cask "agent-manager" do
  version "2.9.0"
  sha256 "93b268270a60eddbd6572ded3e507b97c1d887df46b78fd6d78fcf9840ea0d30"

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
