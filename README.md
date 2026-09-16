# homebrew-tap

StringKe 的 Homebrew tap。

## tomato-cli

番茄小说终端阅读器，仓库：https://github.com/StringKe/tomato-cli

```sh
brew install StringKe/tap/tomato-cli
brew upgrade tomato-cli
```

安装后命令是 `tomato`。Homebrew 装的版本用 `brew upgrade tomato-cli` 更新；`tomato update` 会识别出 Homebrew 安装并转去执行同一条命令，不会自行替换二进制。

Formula 由 `scripts/sync.sh` 从 tomato-cli 的 GitHub Release 生成（`templates/tomato-cli.rb` 是模板），`sync.yml` 每小时检查一次最新 release，也可以手动触发并指定版本号。
