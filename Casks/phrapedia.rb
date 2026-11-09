cask "phrapedia" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "39c70dcec22f3b0d0ffe89c84356365d253641aa1eff5fefab25242eb7469f2c",
         intel: "47ad7a3bd09b38174fa925cbd85e95d2e60c14a8b3e147342a8b0fd0b372e1b2"

  url "https://github.com/luangpho/phrapedia/releases/download/v#{version}/Phrapedia_#{version}_#{arch}.dmg"
  name "Phrapedia"
  desc "Local-first knowledge base for Thai monks, temples and amulets"
  homepage "https://github.com/luangpho/phrapedia"


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
