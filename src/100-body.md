
# 2 分题（50 分）

(@) 列出你知道的 Linux 发行版及其 *包管理工具*。

:::{.solu}
yum:  CentOS, Redhat, Fedora；apt:  Debian, Ubuntu, Deepin；apk:  Alpine；pacman:  Arch Linux
:::

(@) 列出你知道的容器编排软件。

::: {.solu}
Kubernetes, Docker Swarm, Mesos + Marathon
:::

(@) 列出你知道的开源存储系统。

::: {.solu}
Ceph, GlusterFS, HDFS, Minio
:::

(@) 列出你知道的监控工具。

::: {.solu}
Zabbix, Prometheus, Open-falcon, TICK
:::

(@) 列出你知道的持续集成工具。

::: {.solu}
Jekins, Drone, Gitlab CI
:::

(@) 你知道或者用过那些虚拟机管理软件？

::: {.solu}
VMware, VirtualBox
:::

(@) 查看服务器逻辑 cpu 个数，内存大小。

::: {.solu}
```bash
cat /proc/cpuinfo |grep "processor" |wc -l
free
```
:::

(@) 查看服务器的 品牌型号，唯一标识符。

::: {.solu}
```bash
dmidecode -t system
```
:::

(@) 找出当前目录下大于 1G 的文件

::: {.solu}
```bash
find ./ -size +1G
```
:::

(@) 查看服务器的 RAID 级别。

:::{.solu}
```bash
MegaCli -ldinfo -lall -aall
hpssacli ctrl all show config
```
:::

(@) 查看服务器的物理硬盘数量和大小。

:::{.solu}
```bash
MegaCli -pdlist -aall
hpssacli ctrl all show config
```
:::

(@) Linux 系统新增了一块硬盘（/dev/sdb），请将其格式化为 xfs 系统并挂载到 /data。

:::{.solu}
```bash
mkdir /data
echo -e "n\np\n\n\n\nw" |fdisk /dev/sdb
mkfs.xfs /dev/sdb1
mount -t xfs /dev/sdb1 /data
```
:::

(@) 假设 /dev/sdb1 挂载到 /data1 上，当 /dev/sdb1 故障时，/data1 目录可能会成为根目录（/）下的一个普通文件夹，此时数据继续写入会导致根目录被占满，如何避免这种情况。

:::{.solu}
先执行 chattr +i /data1，再挂载
:::

(@) 查找 9099 端口被什么进程占用

::: {.solu}
```bash
lsof -i :9099
ss -antp |grep 9099
```
:::

(@) 在登录服务器时显示一段提示信息（机器业务，联系人，状态等）

::: {.solu}
可以通过 /etc/motd 或者 /etc/profile.d/ 下的脚本实现
:::

(@) 常用的远程登录 Linux 服务器的工具有哪些？

::: {.solu}
XShell, Putty, OpenSSH
:::

(@) 如何设置 nameserver？某个业务的域名即将迁移到新的 IP，如何事先测试域名用新 IP 是否正常工作？

::: {.solu}
1. /etc/resolv.conf
2. /etc/hosts,  curl -H "Host: domain" http://IP/location
:::

(@) 请列出常见的应用层协议及其默认端口。

::: {.solu}
http 80, https 443, smtp 25, ftp 21, ssh 22, dns 53
:::

(@) 常见 HTTP 状态码及其含义。

::: {.solu}
200 OK， 301 永久重定向， 302 临时重定向，404 Not Found，405 方法不被允许，413 请求实体过大，429 请求过多，499 客户端主动断开连接，500 服务器内部错误，502 网关错误，503 服务不可用，504 网关超时
:::

(@) 域名解析有哪些类型？有什么工具可以检测域名解析是否生效？什么是泛解析？举例说明使用 CNAME 解析有什么好处？

::: {.solu}
1. A, AAAA, CNAME, TXT
2. dig, nslookup, 网页工具
3. 利用通配符（*）来实现所有的子域名都指向同一个记录值
4. 对于某些场景，比如负载均衡器，通常有大量域名解析到负载均衡器，在故障摘除某个 IP 时，只需要改变 CNAME 域名的解析地址即可，如果用的时 A 记录，那就需要更改大量域名的 A 记录
:::

(@) IP 10.1.2.130，掩码 255.255.255.128 ，用 CIDR 形式表示该网段，并给出该网段的可用 IP

::: {.solu}
10.1.2.128/25  ; 10.1.2.129 - 10.1.2.254
:::

(@) Kubernetes 是一个流行的容器编排工具，其网络模型的基本原则是每个 Pod（容器组，Kubernetes 管理容器的最小单位）有一个独立的 IP 地址，集群中所有 Pod 能够通过 Pod IP 直接互相访问。现需要规划一个 Kubernetes 集群，每个节点分配一个掩码为 `/24` 的 IP 段，要求至少满足 25400 个 Pod 的需求，并且不能使用宿主机的 10.0.0.0/8 网段，请给出最小网段规划。

::: {.solu}
172.[16-31].0.0/17
:::

(@) 请使用命令行统计各 TCP 状态的数量

::: {.solu}
```bash
ss -ant |awk '{print $1}' |sort |uniq -c |sort -n
```
:::

(@) git 如何拉取代码，创建分支，提交代码，push 代码？

::: {.solu}
git pull, git checkout -b, git commit, git push
:::

(@) docker 镜像仓库允许提交重复的 tag，为了防止提交了重复的 tag，计划使用代码库（git）的 tag 作为 docker 镜像的 tag，如果代码库没有 tag，则用 revision id 做为镜像 tag，比如，一个镜像的 tag 可能是 `v1.3-738-g1211a2e`。请写一个 Makefile 实现此需求。

::: {.solu}
```makefile
TAG = $(git describe --always --dirty)
IMAGE = registry/xxx/image
build:
	docker build -t $(IMAGE):$(TAG) .
	docker tag $(IMAGE):$(TAG) $(IMAGE):latest
push:
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest
```
:::

# 8 分题（40 分）

(@) 假设服务器 root 密码管理存在以下问题：a) 所有服务器使用少数几个 root 密码； b) root 密码基本不变更； c) root 密码未加密存储，并且会被有些同事直接记录到 wiki 上；d) 有同事直接使用 root 密码登录，难以审计。请设计一个 root 密码管理方案，实现 root 密码的随机生成，加密存储及限制查询和使用。（提示：可以考虑使用 gpg 加密 root 密码）

::: {.solu}
开放作答
:::

(@) 请简单描述搭建一个有独立域名，支持 https 的网站的流程。

::: {.solu}
开放作答
:::

(@) 德国数学家莱布尼兹（1646-1716）发现了这样一个事实，数学常量 $\pi$ 可以使用下面的数学公式计算：
$$\frac{\pi}{4}\approx 1-\frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \frac{1}{9} - \frac{1}{11} + \cdots $$
等式右边是一个无限序列，每一个分数表示序列中的一项。如果从 1 开始，则减三分之一，加五分之一，等等。对每一个奇数整数进行下去，就会逐渐逼近 $\pi$/4 的值。请用任意语言编写一个程序，以莱布尼兹序列的前 10,000 项计算 $\pi$ 的近似值。

::: {.solu}
```bash
echo |awk '{sum=0;t=1;for(i=1;i<10001;i++) {sum=sum-(-1)^(i%2)/t;t=t+2}}END{print 4*sum}'
```
:::

(@) 请用任意编程语言实现正整数翻转，比如 数字 1234 翻转为 4321。

::: {.solu}
```bash
echo 1234 |awk '{t=0;for(n=$1;n>0;n=int(n/10)){t=n%10 + t*10}}END{print t}'
```
:::

(@) 有一个程序，功能是发起 http 请求探测 url 是否存活，运行一段时间后会报 `cannot assign requested address` 错误，查看监控发现运行该程序的服务器有大量 `close-wait` 状态，可能是什么原因？如何解决？

::: {.solu}
未关闭 HTTP 请求。HTTP 服务端主动关闭请求，但是程序没有关闭连接，一直停留在 `close-wait` 状态，导致端口被占满。
:::

# 10 分题（10 分）

(@) 请谈谈你对运维工程师这个职位的认识？为这个职位做过什么准备？你认为你擅长的哪些知识、技能或能力能够帮助你胜任此职位？

::: {.solu}
开放作答
:::