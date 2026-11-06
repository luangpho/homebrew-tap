# luangpho/homebrew-tap

luangpho 製ソフトの Homebrew tap。現在は phrapedia の cask を提供する。

## インストール

```sh
brew tap luangpho/tap
brew install --cask phrapedia
```

## 前提

- Homebrew の `node` formula に依存する（cask の `depends_on formula "node"`）。

## 更新

- cask は luangpho/phrapedia の release workflow（tag `v*`）が自動更新する。
- 手動で更新する場合は luangpho/phrapedia の `packaging/homebrew/update-cask.mjs` を使う。

## アンインストール

```sh
brew uninstall --cask phrapedia
```

設定等まで消す場合は `--zap` を付ける。

```sh
brew uninstall --cask --zap phrapedia
```
