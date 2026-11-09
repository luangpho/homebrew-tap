cask "phrapedia" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "e13cbec80b0731e211a76e5e725c30dc586ceee79f7a799165fdf3124fb3aac8",
         intel: "f6da3eab1fe87bb1bd546fdb4c35829516727917be8d9a0d9df6e48d7b2a8790"

  url "https://github.com/luangpho/phrapedia/releases/download/v#{version}/Phrapedia_#{version}_#{arch}.dmg"
  name "Phrapedia"
  desc "Local-first knowledge base for Thai monks, temples and amulets"
  homepage "https://github.com/luangpho/phrapedia"

  auto_updates true

  depends_on formula: "node"

  app "Phrapedia.app"

  preflight_steps do
    # ad-hoc 署名アプリのため quarantine 属性のみ除去する（再署名は hardened runtime のフラグを壊すため行わない）
    run "xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/Phrapedia.app"]
  end

  zap trash: [
    "~/Library/Application Support/jp.grrow.phrapedia",
    "~/Library/Caches/jp.grrow.phrapedia",
    "~/Library/Saved Application State/jp.grrow.phrapedia.savedState",
    "~/Library/WebKit/jp.grrow.phrapedia",
  ]
end
