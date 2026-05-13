# PatternGenerator

PatternGenerator 是一個 BMP 灰階分區與 H pattern 產生工具，可直接用瀏覽器開啟，也可包裝成 Windows 執行檔。

## 功能

- 設定輸出 BMP 的高度與寬度。
- 最多 10 組灰階分區，每組可設定灰階值 `0-255` 與 `step`。
- Step 總和不可超過高度。
- 即時預覽輸出結果。
- 另存為 24-bit `.bmp`。
- 儲存、匯出、匯入設定。
- 快捷產生 `1H` 到 `10H` pattern。
- GitHub Pages 自動部署網頁版。
- GitHub Actions 自動建置 Windows 執行檔 artifact。

## 網頁版使用

直接開啟：

```text
index.html
```

或部署到 GitHub Pages 後，使用 GitHub Pages 提供的網址。

## H Pattern 快捷鍵

- `1` 到 `9`：產生 `1H` 到 `9H`。
- `0`：產生 `10H`。
- 例如 `2H` 代表 2 行黑、2 行白，重複到整張圖結束。

## 桌面版

安裝依賴：

```powershell
npm install
```

啟動桌面程式：

```powershell
npm start
```

產生 Windows portable exe：

```powershell
npm run dist
```

輸出會在：

```text
dist/
```

## 推送到 GitHub

第一次建立 GitHub repository 後，在本機執行：

```powershell
git init
git branch -M main
git remote add origin https://github.com/<你的帳號>/<你的repo>.git
git add .
git commit -m "Initial PatternGenerator project"
git push -u origin main
```

之後每次修改完成：

```powershell
git add .
git commit -m "Update PatternGenerator"
git push
```

或使用專案內附腳本：

```powershell
npm run push -- "Update PatternGenerator"
```

推送到 `main` 或 `master` 後，GitHub Actions 會自動：

- 部署 `index.html` 到 GitHub Pages。
- 建置 Windows 執行檔，並放在 Actions artifact。

## GitHub Pages 設定

到 GitHub repository：

```text
Settings -> Pages -> Build and deployment -> Source
```

選擇：

```text
GitHub Actions
```

第一次 push 後，到：

```text
Actions -> Deploy Web App
```

可以查看部署狀態。完成後頁面網址會顯示在 workflow summary 與 repository Pages 設定頁。
