cask "phrapedia" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "639dfdc92c17da58ff6d0971f79ad69a0a9dad74115c755c445c55f0da345a32",
         intel: "58820b6d605b26e83d5434b309d450472b4ee06e0315f644a76e029165e33667"

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
