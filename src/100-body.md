
# 第一部分

(@) 列出你知道的 Linux 发行版及其 *包管理工具*。

:::{.en}
发行版 | 包管理工具
:----|:-----
CentOS | yum
Debian | apt
Ubuntu | apt
Alpine | apk
Arch Linux | pacman
:::

(@) 查看服务器的 RAID 级别。

:::{.en}
```bash
MegaCli -ldinfo -lall -aall
```
:::

(@) 查看服务器的物理硬盘数量和大小。

:::{.en}
```bash
MegaCli -pdlist -aall
```
:::

(@) Linux 系统新增了一块硬盘（/dev/sdb），请将其格式化为 xfs 系统并挂载到 /data。

:::{.en}
```bash
# mkdir /data
# echo -e "n\np\n\n\n\nw" |fdisk /dev/sdb
# mkfs.xfs /dev/sdb1
# mount -t xfs /dev/sdb1 /data
```
:::

(@) 假设 /dev/sdb1 挂载到 /data1 上，当 /dev/sdb1 故障时，/data1 目录会成为根目录（/）下的一个普通文件夹，数据可能会继续写入导致根目录被占满，如何避免这种情况。

:::{.en}
先执行 chattr +i /data1，再挂载
:::

(@) 查找 9099 端口被什么进程占用

::: {.en}
```bash
# lsof -i :9099
# ss -antp |grep 9099
```
:::

# 第二部分

# 第三部分
