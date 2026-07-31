# terminal-image-paster

一个面向 Windows Terminal 的轻量截图转换助手。

它可以把剪贴板中的截图保存为 JPG 文件，并将图片的绝对路径自动粘贴到终端中，避免 Windows Terminal 无法直接粘贴图片的问题。

## 功能

- 点击“开始监听”注册全局 `Ctrl+V` 热键。
- 仅处理焦点属于 Windows Terminal 的情况，支持：
  - `WindowsTerminal.exe`
  - `wt.exe`
- 剪贴板不是图片，或焦点不在 Windows Terminal 时，保持原来的 `Ctrl+V` 行为。
- 图片以 JPG 格式保存，质量为 90。
- 保存路径格式：

  ```text
  /img/yyyyMMdd/yyyyMMddHHmmss.jpg
  ```

- 同一秒生成多个文件时自动追加 `_1`、`_2` 等后缀，避免覆盖。
- 保存成功后，将图片绝对路径写入剪贴板，并自动粘贴到终端。
- 停止监听或关闭窗口时，自动释放全局热键。

## 使用方法

1. 使用 aardio 打开 `default.aproj`。
2. 运行或发布项目。
3. 点击“开始监听”。
4. 在 Windows Terminal 中按 `Ctrl+V` 粘贴剪贴板图片。
5. 图片会保存到程序目录下的 `img` 文件夹，终端中会出现对应的图片绝对路径。

再次点击按钮即可停止监听。

## 调试输出

在 aardio 开发环境中运行时，会自动打开调试终端并输出监听、焦点窗口、剪贴板判断、保存和粘贴过程。

发布后的程序不会打开调试终端。

## 环境要求

- Windows
- aardio 开发环境（仅从源码运行或重新发布时需要）
- 无第三方依赖

## 项目结构

```text
main.aardio    主程序代码
default.aproj  aardio 工程文件
img/           图片输出目录
AGENTS.md      项目开发规则
```

