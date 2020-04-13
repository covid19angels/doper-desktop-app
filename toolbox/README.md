# toolbox
做插件调度器、下载器、模块管理器、消息通知导航, 其他功能全部用dll的去做这样可以动态更新，主程序可以（永不更新）很少更新

## 更新
1. 准备更新版本如v1.0.0的信息,包括:版本号、日期、作者、增量文件清单、发布信息releasenotes等
1. v1.0.0的增量文件、全量文件上传到阿里云OSS
1. 准备一个最近一批的版本索引文件,如index.version保存最近5个版本的索引信息
1. 客户端调用BFF提供api,如updateinfo/{本地版本号如v1.0.0}, 将返回大于v1.0.0的版本信息,如
    ```
    [
        {
            "version":"v1.0.1",
            "type":"增量包",
            "os":"windows"
            "updated_date":"20200202T14:34:34.343",
            "notes":"本更新如下功能:1.2.3...",
            "author":"Love Cat Coder",
            "files":[
                {
                    "file1":"xxxxx.jpg",
                    "size":1024
                },
                {
                    "filen":"xxxxx.jpg",
                    "size":1024
                },
            ]
        },
        {
            "version":"v1.0.1",
            "type":"全量包"
            "os":"windows"
            "updated_date":"20200202T14:34:34.343",
            "notes":"本更新如下功能:1.2.3...",
            "author":"Love Cat Coder",
            "files":[
                {
                    "file1":"xxxxx.jpg",
                    "size":1024
                },
                {
                    "filen":"xxxxx.jpg",
                    "size":1024
                },
            ]
        },
        {
            "version":"v1.0.1",
            "type":"全量包"
            "os":"macos"
            "updated_date":"20200202T14:34:34.343",
            "notes":"本更新如下功能:1.2.3...",
            "author":"Love Cat Coder",
            "files":[
                {
                    "file1":"xxxxx.jpg",
                    "size":1024
                },
                {
                    "filen":"xxxxx.jpg",
                    "size":1024
                },
            ]
        },
        {
            "version":"v1.0.2",
            ...
        }
    ]
    ```
1. 客户端根据本地版本信息和服务器的index.version索引版本信息决定增量更新还是全量更新, 如果客户端的版本信息太老在服务端index.version里不存在,就用全量更新,否则采用增量更新,因为如index.version保存最近5个版本的索引信息
1. 客户端负责从OSS静默下载更新文件,下载完毕静默更新或者提示重启更新
1. 更新完毕调用BFF提供api,如updatereport上报本地最新版本信息,BFF端记录客户端版本信息,以便以后统计分析
1. 提供一个发布更新的脚本,把更新的版本信息、文件发布上传到OSS

## 主要用户操作界面
