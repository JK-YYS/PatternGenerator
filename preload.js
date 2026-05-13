const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("bmpApp", {
  saveBmpFile: (defaultName, arrayBuffer) => ipcRenderer.invoke("save-bmp-file", defaultName, arrayBuffer)
});
