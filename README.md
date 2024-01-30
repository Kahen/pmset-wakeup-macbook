# pmset-wakeup-macbook


要在 macOS 上设置定时执行的脚本来运行 Java JAR 文件，你可以使用 macOS 的内置定时任务管理器 `launchd`，或者使用第三方工具如 `cron`。下面我将向你展示如何在 macOS 上使用这两种方法来执行 Java JAR 文件。

### 使用 `launchd` 设置定时任务

1. **创建脚本文件：**

   创建一个文本文件，比如 `runtask.sh`，并添加以下内容：

   ```bash
   #!/bin/bash
   sh /your/path/to/pmset-wakeup.sh
   ```

   请将 `/your/path/to/pmset-wakeup.sh` 替换为你的文件的实际路径。

2. **授予执行权限：**

   使用以下命令为脚本文件授予执行权限：

   ```bash
   chmod +x /your/path/to/pmset-wakeup.sh
   ```

3. **创建 `launchd` 配置文件：**

   创建一个新的 `.plist` 文件，比如 `com.example.task.plist`，并将以下内容添加到该文件中：

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>Label</key>
       <string>com.example.task</string>
       <key>Program</key>
       <string>/your/path/to/pmset-wakeup.sh</string>
       <key>StartCalendarInterval</key>
       <dict>
           <key>Hour</key>
           <integer>10</integer>
           <key>Minute</key>
           <integer>0</integer>
       </dict>
   </dict>
   </plist>
   ```

   请将 `/path/to/runtask.sh` 替换为你脚本文件的实际路径。这个配置文件将在每天中午 10 点运行你的脚本。

4. **加载 `launchd` 配置文件：**

   使用以下命令将配置文件加载到 `launchd` 中：

   ```bash
   launchctl load /path/to/com.example.task.plist
   ```

   请将 `/path/to/com.example.task.plist` 替换为你的 `.plist` 文件的实际路径。

现在，你已经设置了一个定时任务，每天中午 10 点将执行你的 sh 文件。
