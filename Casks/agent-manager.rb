cask "agent-manager" do
  version "2.11.1"
  sha256 "210841d79d9b6559b64eb91cad74cb3462f0fe20a370b8b900bf55ca65953a99"

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
