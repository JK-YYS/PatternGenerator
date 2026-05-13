param(
  [string]$Message = "Update PatternGenerator"
)

$ErrorActionPreference = "Stop"

$gitCommand = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCommand) {
  $fallbackGit = "C:\Program Files\Git\cmd\git.exe"
  if (Test-Path $fallbackGit) {
    $gitCommand = $fallbackGit
  }
}

if (-not $gitCommand) {
  throw "找不到 git。請先安裝 Git for Windows，或確認 git.exe 已加入 PATH。"
}

if (-not (Test-Path ".git")) {
  & $gitCommand init
  & $gitCommand branch -M main
}

$remote = & $gitCommand remote get-url origin 2>$null
if (-not $remote) {
  throw "尚未設定 GitHub remote。請先執行：git remote add origin https://github.com/<你的帳號>/<你的repo>.git"
}

& $gitCommand add .

$staged = & $gitCommand diff --cached --name-only
if (-not $staged) {
  Write-Host "沒有需要提交的變更。"
  exit 0
}

& $gitCommand commit -m $Message

$branch = & $gitCommand branch --show-current
$upstream = & $gitCommand rev-parse --abbrev-ref --symbolic-full-name "@{u}" 2>$null
if ($upstream) {
  & $gitCommand push
} else {
  & $gitCommand push -u origin $branch
}
