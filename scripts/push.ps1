param(
  [string]$Message = "Update PatternGenerator"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw "找不到 git。請先安裝 Git for Windows，或確認 git.exe 已加入 PATH。"
}

if (-not (Test-Path ".git")) {
  git init
  git branch -M main
}

$remote = git remote get-url origin 2>$null
if (-not $remote) {
  throw "尚未設定 GitHub remote。請先執行：git remote add origin https://github.com/<你的帳號>/<你的repo>.git"
}

git add .

$staged = git diff --cached --name-only
if (-not $staged) {
  Write-Host "沒有需要提交的變更。"
  exit 0
}

git commit -m $Message

$branch = git branch --show-current
$upstream = git rev-parse --abbrev-ref --symbolic-full-name "@{u}" 2>$null
if ($upstream) {
  git push
} else {
  git push -u origin $branch
}
