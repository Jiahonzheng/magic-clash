# Magic Clash

> 在 EDR 对常见代理软件会进行拦截的环境下，如何逃逸？

## 如何使用

### 配合 SwitchyOmega 插件

- [安装 SwitchyOmega 插件](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)
- [配置 GFWList 规则](https://github.com/FelisCatus/SwitchyOmega/wiki/GFWList)

### 下载 Clash

在开始后续操作之前，需要下载 Clash 或 Clash Premium 二进制执行文件，存储至 `bin/` 目录，并重命名为 `magic` 。

- [Clash](https://github.com/Dreamacro/clash/releases)
- [Clash Premium](https://release.dreamacro.workers.dev)

上述操作完成后，授予 `bin/magic` 可执行权限。

```bash
chmod +x bin/magic
```

### 添加代理节点

更新 `config/proxy-provider.yaml` 文件，添加代理节点，具体格式参考[官方文档](https://github.com/Dreamacro/clash/wiki/Configuration#all-configuration-options)。

### 启动 Clash

执行以下命令，可启动 Clash 代理。执行完成后，可进入 https://yacd.haishan.me 对 Clash 进行配置，如**选择代理节点**等。

```bash
bash ./toolman.sh start
```

### 停止 Clash

执行以下命令，可停止 Clash 代理。

```bash
bash ./toolman.sh stop
```
