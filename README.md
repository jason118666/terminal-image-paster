# terminal-image-paster

一个面向 Windows Terminal 的轻量截图转换助手。

它可以把剪贴板中的截图保存为 JPG 文件，并将图片的绝对路径自动粘贴到终端中，避免 Windows Terminal 无法直接粘贴图片的问题。

## 功能

窗口里有两个功能，各自带一个“已启用 / 已禁用”开关，点击即可切换，默认都是禁用。

### 终端贴图

- 启用后注册全局 `Ctrl+V` 热键。
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
- 禁用或关闭窗口时，自动释放全局热键。

### 飞书三击 @ 助手

- 启用后安装全局鼠标钩子，统计鼠标左键连击。
- 同时满足以下条件时才会触发：
  - 当前焦点窗口属于 `Feishu.exe` 或 `Lark.exe`
  - 鼠标左键连续点击三下
  - 通过 UI Automation 检测到键盘焦点在消息输入框内（类名含 `editor-kit-container`）
- 触发后直接输入 `@嘉胜的智能助手`，默认等 `confirmDelay` 毫秒后自动回车选中候选人；把 `autoConfirm` 设为 `false` 则不按回车，由你自己选。
- 要 @ 的名字和回车延时在程序目录下的 `config.json` 里配置，缺失时会自动生成，改完保存即可，下一次三击就生效：

  ```json
  {
      "feishu": {
          "mentionName": "嘉胜的智能助手",
          "autoConfirm": true,
          "confirmDelay": 200
      }
  }
  ```
- 禁用或关闭窗口时，自动卸载鼠标钩子。

## 使用方法

1. 使用 aardio 打开 `default.aproj`。
2. 运行或发布项目。
3. 点击需要的功能开关，使其变为“已启用”。
4. 终端贴图：在 Windows Terminal 中按 `Ctrl+V` 粘贴剪贴板图片，图片会保存到程序目录下的 `img` 文件夹，终端中会出现对应的图片绝对路径。
5. 飞书助手：在飞书输入框内鼠标左键连点三下，自动 @ 助手。

再次点击开关即可禁用对应功能。

## 调试输出

在 aardio 开发环境中运行时，会自动打开调试终端并输出监听、焦点窗口、剪贴板判断、保存和粘贴过程。

发布后的程序不会打开调试终端。

## 环境要求

- Windows
- aardio 开发环境（仅从源码运行或重新发布时需要）
- .NET Framework 4.x（Windows 10 自带，飞书输入框检测依赖它）
- 无第三方依赖

## 项目结构

```text
main.aardio    主程序代码
default.aproj  aardio 工程文件
img/           图片输出目录
AGENTS.md      项目开发规则
```

