
# 2 分题（50 分）

(@) 列出常见的 Linux 发行版及其包管理工具。

:::{.solu}
yum:  CentOS, Redhat, Fedora；apt:  Debian, Ubuntu, Deepin；apk:  Alpine；pacman:  Arch Linux
:::

(@) 列出常见的容器编排软件。

::: {.solu}
Kubernetes, Docker Swarm, Mesos + Marathon
:::

(@) 列出常见的开源存储系统。

::: {.solu}
Ceph, GlusterFS, HDFS, Minio
:::

(@) 列出常见的监控工具。

::: {.solu}
Zabbix, Prometheus, Open-falcon, TICK
:::

(@) 列出常见的持续集成工具。

::: {.solu}
Jekins, Drone, Gitlab CI
:::

(@) 常用的远程登录 Linux 服务器的工具有哪些？

::: {.solu}
XShell, Putty, OpenSSH
:::

(@) 你用过或者知道那些虚拟机管理软件？

::: {.solu}
VMware, VirtualBox
:::

(@) 查看服务器的基本信息：a）逻辑 cpu 个数；b）内存大小；c）品牌型号；d）内核版本；e）发行版名称版本号；

::: {.solu}
```bash
cat /proc/cpuinfo |grep "processor" |wc -l
free
dmidecode -t system
uname -r
cat /etc/*-release
```
:::

(@) Every command fails with `command not found`{.bash}. How to trace the source of the error and resolve it?

::: {.solu}
```bash
bash --login -x
echo $PATH
fix $PATH in ~/.bash_profile /etc/profile
```
:::

(@) 找出当前目录下大于 1G 的日志文件并删除。

::: {.solu}
```bash
find ./ -size +1G -exec rm -f {} \;
```
:::

(@) 如何查看服务器的 RAID 级别？如何查看服务器的**物理硬盘**数量和容量？

:::{.solu}
```bash
MegaCli -ldinfo -lall -aall
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

(@) 服务器重启之后 ping 不通了，有可能是什么原因？如何解决？

::: {.solu}
1. 可能未配置默认网关。通过管理卡登录，修复默认网关。
2. 可能磁盘坏了，挂载不上或者 /etc/fstab 有错误。进入修复模式修正错误。
:::

(@) 使用 Vim 完成以下任务： a）新建，更新，保存文件；b）查找替换关键词；c）复制行，删除行，跳转行。

::: {.solu}
```bash
vim filename
i,ESC-:wq
ESC-/,ESC-:1,$s/patern/replace/g
nyy,nd,nG
```
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

(@) 如何检测远程主机的 80 端口是否开放？

:::{.solu}
```bash
telnet host 80
nmap -p 80 host
```
:::

(@) 找出 9099 端口被什么进程占用。

::: {.solu}
```bash
lsof -i :9099
ss -antp |grep 9099
```
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

(@) Kubernetes 是一个流行的容器编排工具，其网络模型的基本原则是为每个 Pod（容器组，Kubernetes 管理容器的最小单位）分配一个唯一的 IP 地址，集群中所有 Pod 能够通过 Pod IP 直接互相访问。现需要规划一个 Kubernetes 集群，每个节点分配一个掩码为 `/24` 的 IP 段，要求至少满足 25400 个 Pod 的需求，并且不能使用宿主机的 10.0.0.0/8 网段，请给出最小网段规划。

::: {.solu}
172.[16-31].0.0/17
:::

(@) 请使用命令行统计各 TCP 状态的数量。

::: {.solu}
```bash
ss -ant |awk '{print $1}' |sort |uniq -c |sort -n
```
:::

(@) How to check default route and routing table?

::: {.solu}
Using the commands `netstat -nr`, `route -n` or `ip route show` we can see the default route and routing tables.
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

(@) 假设服务器 root 密码管理存在以下问题：a) 所有服务器使用少数几个 root 密码； b) root 密码基本不变更； c) root 密码未加密存储，并且会被有些同事直接记录到 wiki 上；d) 有同事直接使用 root 账号登录，难以审计。请设计一个 root 密码管理方案，实现 root 密码的随机生成，加密存储及限制查询和使用。（提示：可以考虑使用 gpg 加密 root 密码）

::: {.solu}
开放作答
:::

(@) 请简单描述搭建一个有独立域名，支持 HTTPS 的网站的流程。

::: {.solu}
开放作答
:::

(@) 已知可以通过扇形的近似面积计算 $\pi$ 的近似值。考虑下图左侧的四分之一圆。该圆半径 $r$ 为 2 厘米。由圆的面积公式可以轻易地知道该四分之一圆的面积为 $\pi$ 平方厘米。也可以使用一系列长方形（这些长方形的宽度相同，高度由圆穿过每个长方形顶部的中点来决定）的面积之和计算它的近似面积。例如，从左至右，将该四分之一圆分为 10 个长方形，如下图右侧所示。

```{#fig:pi .plot:tikz caption="通过扇形面积计算 $\pi$ 的近似值" width=40%}
\begin{tikzpicture}
	\draw (0,0)--(0,4);
	\draw (0,0)--(4,0);
	\draw (4,0) arc[start angle=0,end angle=90,radius=4cm];
\end{tikzpicture}
\qquad
\begin{tikzpicture}
	\draw (0,0)--(0,4);
	\draw (0,0)--(4,0);
	\draw (4,0) arc[start angle=0,end angle=90,radius=4cm];
	\draw (0,3.995) rectangle(0.4,0);
	\draw (0.4, 3.95474) rectangle(0.8,0);
	\draw (0.8, 3.87298) rectangle(1.2,0);
	\draw (1.2, 3.747) rectangle (1.6,0);
	\draw (1.6, 3.57211) rectangle (2.0,0);
	\draw (2, 3.34066) rectangle (2.4,0);
	\draw (2.4, 3.03974) rectangle (2.8,0);
	\draw (2.8, 2.64575) rectangle (3.2,0);
	\draw (3.2, 2.10713) rectangle (3.6,0);
	\draw (3.6, 1.249) rectangle (4,0);
\end{tikzpicture}
```	

这些长方形的面积之和近似等于四分之一圆的面积。分的长方形越多，近似值与 $\pi$ 越逼近。对于每个长方形来说，宽度 $w$ 等于半径除以长方形的个数，高度 $h$ 与长方形的位置有关。假设某个长方形在水平方向上的中点为 $x$，那么它的高度 $h$ 可以通过下面的距离公式得到：$$h=\sqrt{r^2-x^2}$$

因此，每个长方形的面积为 $h \times w$。

请用任意语言编写一个程序，通过把四分之一圆分为 10000 个长方形来计算 $\pi$ 的近似值。

::: {.solu}
```bash
echo 10000 |awk '{r=2;n=$1;w=r/n;pi=0;for(i=0;i<n;i++) {x=w*i+w/2;h=sqrt(r*r-x*x);pi=pi+h*w}}END{print pi}'
```
:::

:::: {.en}
德国数学家莱布尼兹（1646-1716）发现了这样一个事实，数学常量 $\pi$ 可以使用下面的数学公式计算：
$$\frac{\pi}{4}\approx 1-\frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \frac{1}{9} - \frac{1}{11} + \cdots $$
等式右边是一个无限序列，每一个分数表示序列中的一项。如果从 1 开始，则减三分之一，加五分之一，等等。对每一个奇数整数进行下去，就会逐渐逼近 $\pi$/4 的值。请用任意语言编写一个程序，以莱布尼兹序列的前 10,000 项计算 $\pi$ 的近似值。

::: {.solu}
```bash
echo |awk '{sum=0;t=1;for(i=1;i<10001;i++) {sum=sum-(-1)^(i%2)/t;t=t+2}}END{print 4*sum}'
```
:::
::::

(@) 有一个程序，功能是发起 http 请求探测 url 是否存活，运行一段时间后会报 `cannot assign requested address` 错误，查看监控发现运行该程序的服务器有大量 `close-wait` 状态，可能是什么原因？如何解决？

::: {.solu}
未关闭 HTTP 请求。HTTP 服务端主动关闭请求，但是程序没有关闭连接，一直停留在 `close-wait` 状态，导致端口被占满。
:::

(@) Kubernetes 中，Ingress Nginx 对容器网络有很强的依赖性，如果容器网络中断，Nginx Upstream 将全部超时，影响范围很大。已知在服务器重启时，Calico（Kubernetes 网络插件）需要几分钟的时间来恢复容器网络，但是 Ingress Pod 却可以在数十秒内启动。因此有必要在机器重启时检测容器网络是否正常，不正常则应禁止该节点处理流量。现计划在开机时执行一个 Shell 脚本来检测容器网络，检测不通过则使用 iptables 关闭 80，443 端口，直到容器网络正常之后再删除相应 iptables 规则。请编写该脚本并说明部署方式。已知满足以下 2 条，则认为容器网络正常：a）`ip route |grep bird |wc -l` 应大于 1；b）`dig @169.169.0.2 +time=1 kubernetes.default.svc.cluster.local` 应正常响应。此方案只解决了 Ingress 问题，对于业务容器，如依赖 CoreDNS，则仍然会受影响。如果你有更好的方案，可以直接回答你的方案。（提示：此问题涉及的三方：业务 Pod，网络插件，Kubernetes，谁是问题根源？最好由谁来解决此问题？）

::: {.solu}
开放作答
:::

# 10 分题（10 分）

(@) 请谈谈你对运维工程师这个职位的认识？为这个职位做过什么准备？你认为你擅长的哪些知识、技能或能力能够帮助你胜任此职位？

::: {.solu}
开放作答
:::