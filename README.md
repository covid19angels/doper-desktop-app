# doper-desktop-app
doper桌面框架应用,支持Windows、Linux、Macos多端,采用BFF架构设计

分成两大块:
## toolbox
做插件调度器、下载器、模块管理器、消息通知导航, 其他功能全部用dll的去做这样可以动态更新，toolbox工具管理程序可以（永不更新）很少更新
## mainapp
主要用户操作界面
