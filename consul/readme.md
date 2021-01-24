# Docker 中 Consul 的安装与配置及使用

## 前言

- **为什么要使用 Consul ？**

  服务发现，用于连接：

  Service Registry使服务能够相互注册和发现。

  服务细分，为了安全：

  通过自动TLS加密和基于身份的授权实现安全的服务到服务通信。

  服务配置，用于运行时配置：

  功能丰富的Key/Value存储，可轻松配置服务。

  Consul Open Source解决了跨分布式基础架构连接服务的技术复杂性。

  Consul Enterprise通过协作和治理功能解决了大型用户群的组织复杂性和合规性要求。

- **什么是 Consul ？**

  基于服务的动态基础架构网络。

  Consul是一个分布式服务网格，用于跨任何运行时平台和公共云或私有云连接，保护和配置服务。

  从静态基础架构向动态基础架构的转变，改变了从基于主机到基于服务的网络连接方法。连接性从使用静态IP转变为动态服务发现，安全性从静态防火墙转移到动态服务分段。

  Consul Principles 领事原则

  API-Driven（API驱动）

  对服务定义，运行状况检查，服务授权策略，故障转移逻辑等进行编码和自动化。

  Run and Connect Anywhere（随处运行和连接）

  跨任何运行时平台和公共云或私有云连接服务。将服务从Kubernetes连接到VM，容器到无服务器功能。

  Extend and Integrate 扩展和集成

  在任何基础架构上配置群集

  通过代理集成连接到TLS上的服务。

  使用可插拔证书颁发机构提供TLS证书。

- **什么是 Docker？**

  具体请参考我的第08章内容。

- **为什么要在 Docker 中安装 Consul ？**

  为了开发环境一致性、可移植性、易于管理和维护性。

## 目标

- 完成 Consul 在 Docker 中的安装与配置。
- 安装在 Docker 中的 Consul 能正常对外提供服务。
- 在外部开发环境中能正常访问和使用 Consul 进行服务的注册与发现。

## 环境

- **VMware：**VMware Workstation 14 Pro
- **Linux：**CentOS7.4
- **Docker：**18.06.0-ce, build 0ffa825
- **Jenkins：**Jenkins2.121.1
- **JDK：**jdk1.8.0_172
- **Consul :** 1.3.0

## 介绍

Consul是一个数据中心运行时，提供服务发现，配置和编排。

支持的标签和相应的Dockerfile链接

- [`1.3.0`, `latest` (*0.X/Dockerfile*)](https://github.com/hashicorp/docker-consul/blob/3e9120657c15e2f208e3cf16a698f1bb3bee3cdd/0.X/Dockerfile)

## 快速参考（Quick reference）

- **Where to get help**:
  [the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack/), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)
- **Where to file issues**:
  https://github.com/hashicorp/docker-consul/issues
- **Maintained by**:
  [HashiCorp](https://github.com/hashicorp/docker-consul)
- **Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64))
  [`amd64`](https://hub.docker.com/r/amd64/consul/), [`arm32v6`](https://hub.docker.com/r/arm32v6/consul/), [`arm64v8`](https://hub.docker.com/r/arm64v8/consul/), [`i386`](https://hub.docker.com/r/i386/consul/)
- **Published image artifact details**:
  [repo-info repo’s `repos/consul/` directory](https://github.com/docker-library/repo-info/blob/master/repos/consul) ([history](https://github.com/docker-library/repo-info/commits/master/repos/consul))
  (image metadata, transfer size, etc)
- **Image updates**:
  [official-images PRs with label `library/consul`](https://github.com/docker-library/official-images/pulls?q=label%3Alibrary%2Fconsul)
  [official-images repo’s `library/consul` file](https://github.com/docker-library/official-images/blob/master/library/consul) ([history](https://github.com/docker-library/official-images/commits/master/library/consul))
- **Source of this description**:
  [docs repo’s `consul/` directory](https://github.com/docker-library/docs/tree/master/consul) ([history](https://github.com/docker-library/docs/commits/master/consul))
- **Supported Docker versions**:
  [the latest release](https://github.com/docker/docker-ce/releases/latest) (down to 1.6 on a best-effort basis)

## 什么是Consul ？

Consul是一种分布式，高可用性和多数据中心感知工具，用于服务发现，配置和编排。 Consul可以大规模快速部署，配置和维护面向服务的体系结构。有关更多信息，请参阅：

- [Consul documentation](https://www.consul.io/)
- [Consul on GitHub](https://github.com/hashicorp/consul)

## Consul and Docker

Consul有几个移动部件，因此我们首先简要介绍Consul的架构，然后详细介绍Consul如何与Docker交互。有关所有这些概念的更多详细信息，请参阅 [Consul Architecture](https://www.consul.io/docs/internals/architecture.html)指南。

Consul集群中的每个主机都运行Consul代理，这是一个可以在客户端或服务器模式下启动的长时间运行的守护程序。每个群集在服务器模式下至少有一个代理，通常为3或5以实现高可用性。服务器代理参与共识协议，维护集群状态的集中视图，并响应来自集群中其他代理的查询。客户端模式中的其余代理参与gossip 协议以发现其他代理并检查其是否有故障，并将有关群集的查询转发给服务器代理。

在给定主机上运行的应用程序仅使用其HTTP API或DNS接口与其本地Consul代理进行通信。主机上的服务也向本地Consul代理注册，该代理将信息与Consul服务器同步。使用Consul进行最基本的基于DNS的服务发现，应用程序查询foo.service.consul并获取提供服务“foo”的所有主机的随机洗牌子集。==这允许应用程序在没有任何中间代理的情况下定位服务并负载均衡。==多个HTTP API也可用于与Consul的服务发现功能进行更深入集成的应用程序，以及其他功能，如键/值存储。

在Docker中运行Consul时，这些概念也适用。通常，您将在每个主机上运行一个Consul代理程序容器，与Docker守护程序一起运行。您还需要将某些代理配置为服务器（基于HA设置至少为3）。 ==Consul应始终在Docker中使用`--net=host`运行，因为Consul的共识和gossip 协议对延迟和数据包丢失很敏感，因此与其他网络类型相关的额外层通常是不受欢迎的，也是不必要的。==我们将在下面详细讨论这个问题。

我们在这里没有介绍Consul的多数据中心功能，但只要使用`--net=host`，Docker就不应该有特殊的考虑因素了。

## Using the Container

我们选择Alpine作为轻量级基础，具有相当小的表面积以解决安全问题，但具有足够的开发，交互式调试功能，以及在容器中Consul下运行的有用的健康，监视和执行脚本。从Consul 0.7开始，镜像还包括卷Volumes，因为它常用于健康检查。

### `dumb-init`

Consul总是在`dumb-init`下运行，它处理收割僵尸进程并将信号转发到容器中运行的所有进程。我们还使用gosu作为非root“consul”用户运行Consul以提高安全性。这些二进制文件都是由HashiCorp构建的，并使用我们的GPG密钥签名，因此您可以验证用于构建给定基本映像的已签名包。

### `consul members`

运行不带参数的Consul容器将为您提供处于开发模式的Consul服务器。提供的入口点脚本还将查找Consul子命令，并将consul作为正确的用户和该子命令运行。例如，您可以执行`docker run consul`成员，它将在容器内运行`consul members`命令。入口点还添加了一些特殊配置选项，如下面的部分中详细介绍的，在运行agent子命令时。任何其他命令都在`dumb-init`下的容器内执行。

### `VOLUME /consul/data`

容器暴露了`VOLUME /consul/data`，这是Consul将其持久化状态的路径。在开发模式下运行时，不会以任何方式使用它。==对于客户端代理，这将存储有关群集的一些信息以及客户端的运行状况检查，以防重新启动容器。====对于服务器代理，它存储客户端信息以及与一致性算法相关的快照和数据以及Consul的`key/value`存储和目录等其他状态。对于服务器，非常希望在重新启动容器时保持此卷的数据以从中断方案中恢复。==如果这是绑定挂载，那么当容器启动时，所有权将更改为consul用户。

### `/consul/config`

容器具有在`/consul/config`处设置的Consul配置目录，并且代理将通过绑定卷或通过组合新镜像和添加文件来加载放置在此处的任何配置文件。或者，可以通过环境变量`CONSUL_LOCAL_CONFIG`传递配置JSON来添加配置。如果这是绑定挂载，那么当容器启动时，所有权将更改为consul用户。

### `--net=host`

由于Consul几乎总是在Docker中使用`--net=host`运行，因此在配置Consul的IP地址时需要注意。 Consul具有其集群地址的概念以及其客户端地址。群集地址是其他Consul代理可以联系给定代理的地址。==客户端地址是主机上的其他进程联系Consul以发出HTTP或DNS请求的地址。==您通常需要告诉Consul启动时其群集地址是什么，以便它绑定到正确的接口并向其他Consul代理通告可行的接口。您将在下面的示例中看到Consul的`-bind = <external ip>`参数。

## Running Consul for Development

```bash
$ docker run -d --name=dev-consul -e CONSUL_BIND_INTERFACE=eth0 consul
```

这将运行一个完全内存的Consul服务器代理，其默认桥接网络并且主机上不显示任何服务，这对于开发很有用，但不应在生产中使用。例如，如果该服务器在内部地址172.17.0.31上运行，则可以通过启动另外两个实例并告诉它们加入第一个节点来运行三节点集群以进行开发。

```bash
$ docker run -d -e CONSUL_BIND_INTERFACE=eth0 consul agent -dev -join=172.17.0.2
... server 2 starts
$ docker run -d -e CONSUL_BIND_INTERFACE=eth0 consul agent -dev -join=172.17.0.2
... server 3 starts
```

然后，我们可以通过在第一个容器中运行`Consul CLI`命令来查询集群中的所有成员：

```bash
$ docker exec -t dev-consul consul members
Node          Address          Status  Type    Build  Protocol  DC
579db72c1ae1  172.17.0.32:8301  alive   server  0.6.3  2         dc1
93fe2309ef19  172.17.0.33:8301  alive   server  0.6.3  2         dc1
c9caabfd4c2a  172.17.0.321:8301  alive   server  0.6.3  2         dc1
```

请记住，Consul不会在此模式下使用数据量 - 一旦容器停止，您的所有状态都将被清除，因此请不要将此模式用于生产。使用开发服务器在桥接网络上完全运行对于在单个机器上测试Consul的多个实例非常有用，由于端口冲突，这通常很难做到。

开发模式还在端口`8500`上启动Consul的Web UI版本。通过在命令行上向Consul提供`-ui`选项，可以将其添加到其他Consul配置中。 Web资产捆绑在容器中的Consul二进制文件中。

## Running Consul Agent in Client Mode

```bash
$ docker run -d --net=host -e 'CONSUL_LOCAL_CONFIG={"leave_on_terminate": true}' consul agent -bind= -retry-join=<root agent ip>
==> Starting Consul agent...
==> Starting Consul agent RPC...
==> Consul agent running!
         Node name: 'linode'
        Datacenter: 'dc1'
            Server: false (bootstrap: false)
       Client Addr: 127.0.0.1 (HTTP: 8500, HTTPS: -1, DNS: 8600, RPC: 8400)
      Cluster Addr: <external ip> (LAN: 8301, WAN: 8302)
    Gossip encrypt: false, RPC-TLS: false, TLS-Incoming: false
             Atlas: <disabled>
...
```

这将运行Consul客户端代理，共享主机的网络并将外部IP地址通告给群集的其余部分。请注意，代理默认将其客户端接口绑定到127.0.0.1，这是主机的环回接口。如果主机上的其他容器也使用`--net=host`，那么这将是一个很好的配置，它还会将代理暴露给直接在容器外部的主机上运行的进程，例如HashiCorp的Nomad。

`-retry-join`参数指定群集中用于在启动时加入的其他一个代理的外部IP。有多种方法可以控制代理如何加入群集，有关`-join`，`-retry-join`和`-atlas-join`选项的更多详细信息，请参阅代理配置指南 [agent configuration](https://www.consul.io/docs/agent/options.html) 。

另请注意，我们使用`CONSUL_LOCAL_CONFIG`环境变量设置了`leave_on_terminate`。建议客户使用，并在Consul 0.7及更高版本中默认为true，因此不再需要这样做。

在启动时，代理将从`/consul/config`读取配置`JSON`文件。数据将保留在`/consul/data`卷中。

以下是外部`IP`为`66.175.220.234`的主机上的一些示例查询：

```bash
$ curl http://localhost:8500/v1/health/service/consul?pretty
[
    {
        "Node": {
            "Node": "linode",
            "Address": "66.175.220.234",
...
$ dig @localhost -p 8600 consul.service.consul
; <<>> DiG 9.9.5-3ubuntu0.7-Ubuntu <<>> @localhost -p 8600 consul.service.consul
; (2 servers found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 61616
;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
;; WARNING: recursion requested but not available

;; QUESTION SECTION:
;consul.service.consul.         IN      A

;; ANSWER SECTION:
consul.service.consul.  0       IN      A       66.175.220.234
...
```

如果要通过其他网络（例如桥接网络）将Consul接口公开给其他容器，请使用Consul的`-client`选项：

```bash
docker run -d --net=host consul agent -bind=<external ip> -client=<bridge ip> -retry-join=<root agent ip>
==> Starting Consul agent...
==> Starting Consul agent RPC...
==> Consul agent running!
         Node name: 'linode'
        Datacenter: 'dc1'
            Server: false (bootstrap: false)
       Client Addr: <bridge ip> (HTTP: 8500, HTTPS: -1, DNS: 8600, RPC: 8400)
      Cluster Addr: <external ip> (LAN: 8301, WAN: 8302)
    Gossip encrypt: false, RPC-TLS: false, TLS-Incoming: false
             Atlas: <disabled>
...
```

使用此配置，Consul的客户端接口将绑定到网桥IP，并可供该网络上的其他容器使用，但不能在主机网络上使用。请注意，我们仍将群集地址保留在主机网络上以提高性能。 Consul还将接受`-client = 0.0.0.0`选项以绑定到所有接口。

## Running Consul Agent in Server Mode

```bash
$ docker run -d --net=host -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true}' consul agent -server -bind=<external ip> -retry-join=<root agent ip> -bootstrap-expect=<number of server agents>
```

这将运行共享主机网络的Consul服务器代理。我们上面介绍的客户端代理的所有网络注意事项和行为也适用于服务器代理。单个服务器本身将无法形成仲裁，并且将等待其他服务器加入。

与客户端代理一样，`-retry-join`参数指定群集中用于在启动时加入的其他代理的外部IP。有多种方法可以控制代理如何加入群集，有关-join，`-retry-join`和`-atlas-join`选项的更多详细信息，请参阅代理配置[agent configuration](https://www.consul.io/docs/agent/options.html) 指南。==服务器代理还使用`-bootstrap-expect`选项，该选项指定在首次引导群集之前要监视的服务器代理程序数。==这提供了一种使用新群集进行有序启动的简便方法。有关`-bootstrap`和`-bootstrap-expect`选项的更多详细信息，请参阅代理配置[agent configuration](https://www.consul.io/docs/agent/options.html)指南。

另请注意，我们使用`CONSUL_LOCAL_CONFIG`环境变量设置了`skip_leave_on_interrupt`。建议用于服务器，并在Consul 0.7及更高版本中默认为true，因此不再需要这样做。

在启动时，代理将从`/consul/config`读取配置JSON文件。数据将保留在`/consul/data`卷中。

引导群集并实现仲裁后，必须小心保持最小数量的服务器正常运行，以避免群集中断状态。共识 [consensus](https://www.consul.io/docs/internals/consensus.html)指南中的部署表概述了不同配置所需的服务器数量。还有一个 [adding/removing servers](https://www.consul.io/docs/guides/servers.html) 指南，用于描述该过程，该过程也与Docker配置相关。如果服务器永久丢失，则中断恢复 [outage recovery](https://www.consul.io/docs/guides/outage.html) 指南包含执行的步骤。通常，最好一次重新启动或更换一台服务器，确保服务器在进入下一台服务器之前是健康的。

## Exposing Consul’s DNS Server on Port 53(在端口53上公开Consul的DNS服务器)

默认情况下，Consul的DNS服务器在端口`8600`上公开。由于使用`resolv.conf`等工具进行配置很麻烦，您可能希望在端口53上公开DNS.Consul 0.7及更高版本通过设置运行`setcap`的环境变量来支持此功能。 Consul二进制文件，允许它绑定到特权端口。请注意，并非所有Docker存储后端都支持此功能（特别是AUFS）。

```bash
$ docker run -d --net=host -e 'CONSUL_ALLOW_PRIVILEGED_PORTS=' consul -dns-port=53 -recursor=8.8.8.8
```

此示例还包括一个recursor配置，该配置使用Google的DNS服务器进行非Consul查找。您可能希望根据特定的DNS配置进行调整。如果您将Consul的客户端接口绑定到主机的环回地址，那么您应该能够配置主机的`resolv.conf`，通过将“`127.0.0.1`”作为主DNS服务器来将DNS请求路由到Consul。这会将Consul的DNS暴露给主机上运行的所有应用程序，但由于Docker的内置DNS服务器，您无法直接从容器内部指出这一点;如果您尝试执行此操作，Docker将发出错误消息。您必须将Consul配置为侦听可从其他容器中访问的非本地主机地址。

将Consul的客户端接口绑定到网桥或其他网络后，您可以在其他容器中使用`--dns`选项，以便他们使用Consul的DNS服务器，映射到端口53.这是一个示例：

```bash
$ docker run -d --net=host -e 'CONSUL_ALLOW_PRIVILEGED_PORTS=' consul agent -dns-port=53 -recursor=8.8.8.8 -bind=<bridge ip>
```

现在启动另一个容器，并使用主机的桥接地址将其指向Consul的DNS：

```bash
$ docker run -i --dns=<bridge ip> -t ubuntu sh -c "apt-get update && apt-get install -y dnsutils && dig consul.service.consul"
...
;; ANSWER SECTION:
consul.service.consul.  0       IN      A       66.175.220.234
...
```

在上面的示例中，将桥接地址添加到主机的`/etc/resolv.conf`文件中应将其公开给所有容器，而不使用`--dns`选项运行。注：centos下的命令 dig 安装包是：`bind-utils`

## Service Discovery with Containers(使用容器进行服务发现)

您可以使用几种方法来注册使用Consul在容器中运行的服务。对于手动配置，您的容器可以使用本地代理的API来注册和注销自己，有关详细信息，请参阅代理API[Agent API](https://www.consul.io/docs/agent/http/agent.html) 。另一个策略是为每个主机类型创建一个派生的Consul容器，其中包含Consul在启动时解析的JSON配置文件，有关详细信息，请参阅服务 [Services](https://www.consul.io/docs/agent/services.html)。这两种方法都相当麻烦，如果容器死亡或启动了其他容器，配置的服务可能会失去同步。

如果您在HashiCorp的`Nomad`调度程序下运行容器，它对Consul有一流的支持。 `Nomad`代理在Consul代理旁边的每个主机上运行。在给定主机上安排作业时，Nomad代理会自动负责将Consul代理与服务信息同步。这非常容易管理，甚至在Docker容器外部运行的主机上的服务也可以由`Nomad` 管理并在Consul中注册。您可以在Docker Driver指南中找到有关在`Nomad`下运行Docker的更多信息。

其他开源选项包括Glider Labs的`Registrator`和Joyent的ContainerPilot。 Registrator通过在每个主机上与Consul代理一起运行Registrator实例来工作。`Registrator`监视Docker守护程序以获取容器停止和启动事件，并使用容器名称和公开端口作为服务信息来处理与Consul的服务注册。 ContainerPilot使用在容器内运行的工具来管理服务注册，以便在启动时向Consul注册服务，在运行时管理Consul TTL运行状况检查，以及在容器停止时取消注册服务。

## Running Health Checks in Docker Containers(在Docker容器中运行状况检查)

Consul能够在容器内执行健康检查。==如果Docker守护程序暴露给Consul代理并且设置了DOCKER_HOST环境变量，则可以使用要执行的Docker容器ID配置检查。==有关详细信息，请参阅运行状况检查[health checks](https://www.consul.io/docs/agent/checks.html)指南。

## License

查看此映像中包含的软件的许可证信息。

与所有Docker映像一样，这些映像也可能包含其他许可证（例如来自基本分发版的Bash等，以及所包含的主要软件的任何直接或间接依赖关系）。

可以在repo-info存储库的`consul/`目录中找到一些能够自动检测的其他许可证信息。

对于任何预先构建的镜像使用，镜像用户有责任确保对此镜像的任何使用都符合其中包含的所有软件的任何相关许可。

## Consul Architecture

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-Kf7SJZsU-1599612136673)(assets/consul-arch-420ce04a.png)]

看数据中心1，可以看出consul的集群是由N个SERVER，加上M个CLIENT组成的。而不管是SERVER还是CLIENT，都是consul的一个**节点**，所有的服务都可以注册到这些节点上，正是通过这些节点实现服务注册信息的共享。除了这两个，还有一些小细节，一一简单介绍。

- #### CLIENT

CLIENT表示consul的client模式，就是客户端模式。是consul节点的一种模式，这种模式下，所有注册到当前节点的服务会被转发到SERVER，本身是**不持久化**这些信息。

- #### SERVER

SERVER表示consul的server模式，表明这个consul是个server，这种模式下，功能和CLIENT都一样，唯一不同的是，它会把所有的信息持久化的本地，这样遇到故障，信息是可以被保留的。

- #### SERVER-LEADER

中间那个SERVER下面有LEADER的字眼，表明这个SERVER是它们的老大，它和其它SERVER不一样的一点是，它需要负责同步注册的信息给其它的SERVER，同时也要负责各个节点的健康监测。

- #### 其它信息

其它信息包括它们之间的通信方式，还有一些协议信息，算法。它们是用于保证节点之间的数据同步，实时性要求等等一系列集群问题的解决。这些有兴趣的自己看看[官方文档](https://link.jianshu.com/?t=https://www.consul.io/docs/internals/index.html)。

## 架构概念详解

上图是官网提供的一个事例系统图，图中的Server是consul服务端高可用集群，Client是consul客户端。consul客户端不保存数据，客户端将接收到的请求转发给响应的Server端。Server之间通过局域网或广域网通信实现数据一致性。每个Server或Client都是一个consul agent。

Consul集群间使用了GOSSIP协议通信和raft一致性算法。上面这张图涉及到了很多术语：

- Agent——agent是一直运行在Consul集群中每个成员上的守护进程。通过运行`consul agent`来启动。agent可以运行在client或者server模式。指定节点作为client或者server是非常简单的，除非有其他agent实例。所有的agent都能运行DNS或者HTTP接口，并负责运行时检查和保持服务同步。
- Client——一个Client是一个转发所有RPC到server的代理。这个client是相对无状态的。client唯一执行的后台活动是加入LAN gossip池。这有一个最低的资源开销并且仅消耗少量的网络带宽。
- Server——一个server是一个有一组扩展功能的代理，这些功能包括参与Raft选举，维护集群状态，响应RPC查询，与其他数据中心交互WAN gossip和转发查询给leader或者远程数据中心。
- DataCenter——虽然数据中心的定义是显而易见的，但是有一些细微的细节必须考虑。例如，在EC2中，多个可用区域被认为组成一个数据中心。我们定义数据中心为一个私有的，低延迟和高带宽的一个网络环境。这不包括访问公共网络，但是对于我们而言，同一个EC2中的多个可用区域可以被认为是一个数据中心的一部分。
- Consensus——一致性，使用Consensus来表明就leader选举和事务的顺序达成一致。为了以容错方式达成一致，一般有超过半数一致则可以认为整体一致。Consul使用Raft实现一致性，进行leader选举，在consul中的使用bootstrap时，可以进行自选，其他server加入进来后bootstrap就可以取消。
- Gossip——Consul建立在Serf的基础之上，它提供了一个用于多播目的的完整的gossip协议。Serf提供成员关系，故障检测和事件广播。Serf是去中心化的服务发现和编制的解决方案，节点失败侦测与发现，具有容错、轻量、高可用的特点。
- LAN Gossip——它包含所有位于同一个局域网或者数据中心的所有节点。
- WAN Gossip——它只包含Server。这些server主要分布在不同的数据中心并且通常通过因特网或者广域网通信。
- RPC——远程过程调用。这是一个允许client请求server的请求/响应机制。

在每个数据中心，client和server是混合的。一般建议有3-5台server。这是基于有故障情况下的可用性和性能之间的权衡结果，因为越多的机器加入达成共识越慢。然而，并不限制client的数量，它们可以很容易的扩展到数千或者数万台。

同一个数据中心的所有节点都必须加入gossip协议。这意味着gossip协议包含一个给定数据中心的所有节点。这服务于几个目的：第一，不需要在client上配置server地址。发现都是自动完成的。第二，检测节点故障的工作不是放在server上，而是分布式的。这是的故障检测相比心跳机制有更高的可扩展性。第三：它用来作为一个消息层来通知事件，比如leader选举发生时。

每个数据中心的server都是Raft节点集合的一部分。这意味着它们一起工作并选出一个leader，一个有额外工作的server。leader负责处理所有的查询和事务。作为一致性协议的一部分，事务也必须被复制到所有其他的节点。因为这一要求，当一个非leader得server收到一个RPC请求时，它将请求转发给集群leader。

server节点也作为WAN gossip Pool的一部分。这个Pool不同于LAN Pool，因为它是为了优化互联网更高的延迟，并且它只包含其他Consul server节点。这个Pool的目的是为了允许数据中心能够以low-touch的方式发现彼此。这使得一个新的数据中心可以很容易的加入现存的WAN gossip。因为server都运行在这个pool中，它也支持跨数据中心请求。当一个server收到来自另一个数据中心的请求时，它随即转发给正确数据中想一个server。该server再转发给本地leader。

这使得数据中心之间只有一个很低的耦合，但是由于故障检测，连接缓存和复用，跨数据中心的请求都是相对快速和可靠的。

## 配置参数说明

| 参数列表         | 参数的含义和使用场景说明                                     |
| ---------------- | ------------------------------------------------------------ |
| advertise        | 通知展现地址用来改变我们给集群中的其他节点展现的地址，一般情况下-bind地址就是展现地址 |
| bootstrap        | 用来控制一个server是否在bootstrap模式，在一个datacenter中只能有一个server处于bootstrap模式，当一个server处于bootstrap模式时，可以自己选举为raft leader |
| bootstrap-expect | 在一个datacenter中期望提供的server节点数目，当该值提供的时候，consul一直等到达到指定sever数目的时候才会引导整个集群，该标记不能和bootstrap共用 |
| bind             | 该地址用来在集群内部的通讯IP地址，集群内的所有节点到地址都必须是可达的，默认是0.0.0.0 |
| client           | consul绑定在哪个client地址上，这个地址提供HTTP、DNS、RPC等服务，默认是127.0.0.1 |
| config-file      | 明确的指定要加载哪个配置文件                                 |
| config-dir       | 配置文件目录，里面所有以.json结尾的文件都会被加载            |
| data-dir         | 提供一个目录用来存放agent的状态，所有的agent允许都需要该目录，该目录必须是稳定的，系统重启后都继续存在 |
| dc               | 该标记控制agent允许的datacenter的名称，默认是dc1             |
| encrypt          | 指定secret key，使consul在通讯时进行加密，key可以通过consul keygen生成，同一个集群中的节点必须使用相同的key |
| join             | 加入一个已经启动的agent的ip地址，可以多次指定多个agent的地址。如果consul不能加入任何指定的地址中，则agent会启动失败，默认agent启动时不会加入任何节点 |
| retry-interval   | 两次join之间的时间间隔，默认是30s                            |
| retry-max        | 尝试重复join的次数，默认是0，也就是无限次尝试                |
| log-level        | consul agent启动后显示的日志信息级别。默认是info，可选：trace、debug、info、warn、err |
| node             | 节点在集群中的名称，在一个集群中必须是唯一的，默认是该节点的主机名 |
| protocol         | consul使用的协议版本                                         |
| rejoin           | 使consul忽略先前的离开，在再次启动后仍旧尝试加入集群中       |
| server           | 定义agent运行在server模式，每个集群至少有一个server，建议每个集群的server不要超过5个 |
| syslog           | 开启系统日志功能，只在linux/osx上生效                        |
| pid-file         | 提供一个路径来存放pid文件，可以使用该文件进行SIGINT/SIGHUP(关闭/更新)agent |

**参数说明：**

**-node：**节点的名称

**-bind：**绑定的一个地址，用于节点之间通信的地址，可以是内外网，必须是可以访问到的地址

**-server：**这个就是表示这个节点是个SERVER

**-bootstrap-expect：**这个就是表示期望提供的SERVER节点数目，数目一达到，它就会被激活，然后就是LEADER了

参数说明：

**-join：**这个表示启动的时候，要加入到哪个集群内，这里就是说要加入到节点1的集群

**-node-id：**这个貌似版本8才加入的，这里用这个来指定唯一的节点ID，可以查看这个[issue](https://link.jianshu.com/?t=https://github.com/hashicorp/consul/issues/2877)

**-client：**这个表示注册或者查询等一系列客户端对它操作的IP，如果不指定这个IP，默认是127.0.0.1。

## 配置文件说明

除了命令行参数外，配置也可以写入文件中。配置文件是json格式的，很容易编写。配置文件不仅被用来设置agent的启动，也可以用来提供健康检测和服务发现的定义。

配置文件详细参数说明:

> 1. acl_datacenter：只用于server，指定的datacenter的权威ACL信息，所有的servers和datacenter必须同意ACL datacenter
> 2. acl_default_policy：默认是allow。
> 3. acl_token：agent会使用这个token和consul server进行请求。
> 4. acl_ttl：控制TTL的cache，默认是30s。
> 5. addresses：一个嵌套对象，可以设置以下key：dns、http、rpc。
> 6. advertise_addr：等同于-advertise。
> 7. bootstrap：等同于-bootstrap。
> 8. bootstrap_expect：等同于-bootstrap-expect。
> 9. bind_addr：等同于-bind。
> 10. ca_file：提供CA文件路径，用来检查客户端或者服务端的链接。
> 11. cert_file：必须和key_file一起。
> 12. client_addr：等同于-client。
> 13. datacenter：等同于-dc。
> 14. data_dir：等同于-data-dir。
> 15. disable_anonymous_signature：在进行更新检查时禁止匿名签名。
> 16. disable_remote_exec：禁止支持远程执行，设置为true，agent会忽视所有进入的远程执行请求。
> 17. disable_update_check：禁止自动检查安全公告和新版本信息。
> 18. dns_config：是一个嵌套对象，可以设置以下参数：allow_stale、max_stale、node_ttl 、service_ttl、enable_truncate。
> 19. domain：默认情况下consul在进行DNS查询时查询的是consul域，可以通过该参数进行修改。
> 20. enable_debug：开启debug模式。
> 21. enable_syslog：等同于-syslog。
> 22. encrypt：等同于-encrypt。
> 23. key_file：提供私钥的路径。
> 24. leave_on_terminate：默认是false，如果为true，当agent收到一个TERM信号的时候，它会发送leave信息到集群中的其他节点上。
> 25. log_level：等同于-log-level。
> 26. node_name:等同于-node。
> 27. ports：这是一个嵌套对象，可以设置以下key：dns(dns地址：8600)、http(http api地址：8500)、rpc(rpc:8400)、serf_lan(lan port:8301)、serf_wan(wan port:8302)、server(server rpc:8300)。
> 28. protocol：等同于-protocol。
> 29. rejoin_after_leave：等同于-rejoin。
> 30. retry_join：等同于-retry-join。
> 31. retry_interval：等同于-retry-interval。
> 32. server：等同于-server。
> 33. server_name：会覆盖TLS CA的node_name，可以用来确认CA name和hostname相匹配。
> 34. skip_leave_on_interrupt：和leave_on_terminate比较类似，不过只影响当前句柄。
> 35. start_join：一个字符数组提供的节点地址会在启动时被加入。
> 36. syslog_facility：当enable_syslog被提供后，该参数控制哪个级别的信息被发送，默认Local0。
> 37. ui_dir：等同于-ui-dir。
> 38. verify_incoming：默认false，如果为true，则所有进入链接都需要使用TLS，需要客户端使用ca_file提供ca文件。只用于consul server端，因为client从来没有进入的链接。
> 39. verify_outgoing：默认false，如果为true，则所有出去链接都需要使用TLS，需要服务端使用ca_file提供ca文件，consul server和client都需要使用，因为两者都有出去的链接。
> 40. watches：watch一个详细名单。

## 常用端口说明

> 1. dns - The DNS server, -1 to disable. Default 8600.
> 2. http - The HTTP API, -1 to disable. Default 8500.
> 3. https - The HTTPS API, -1 to disable. Default -1 (disabled).
> 4. rpc - The CLI RPC endpoint. Default 8400.
> 5. serf_lan - The Serf LAN port. Default 8301.
> 6. serf_wan - The Serf WAN port. Default 8302.
> 7. server - Server RPC address. Default 8300.

## 服务发现机制

加入集群

- 当一个Consul代理启动后，它并不知道其它节点的存在，它是一个孤立的单节点集群。
- 如果想感知到其它节点的存在，它必须加入到一个现存的集群。
- 要加入到一个现存的集群，它只用加入集群中任意一个现存的成员。
- 当加入一个现存的成员后，会通过成员间的通讯很快发现集群中的其它成员。
- 一个Consul代理可以加入任意一个代理，而不仅仅是服务节点。

为了让三个Server间能互相感知，这里就要让其它二个Server加入同一个集群中。

## 通过json配置文件集群安装

### 集群节点规划

本地使用的是`CentOS 17.x`的虚拟机：

| 容器名称 | 容器IP地址 | 映射端口号    | 宿主机IP地址  | 服务运行模式  |
| -------- | ---------- | ------------- | ------------- | ------------- |
| consul1  | 172.20.0.2 | 8500 -> 8500  | 192.168.56.76 | Server Master |
| consul2  | 172.20.0.3 | 9500 -> 8500  | 192.168.56.76 | Server        |
| consul3  | 172.20.0.4 | 10500 -> 8500 | 192.168.56.76 | Server        |
| consul4  | 172.20.0.5 | 11500 -> 8500 | 192.168.56.76 | Client        |

172.20.0.1是网关

### 下载镜像

```bash
$ sudo docker pull consul:1.3.0
```

### 配置docker 网络

因为docker 默认的 docker0 虚拟网卡是不支持直接设置静态ip的。所以我们先创建一个自己的虚拟网络。

```bash
$ docker network create -d bridge --subnet=172.20.0.0/24 static-net
```

执行完可以通过 下面了命令查看

```bash
$ docker network ls
```

PS:

```
私有网络ip选取小知识：
这三个地址段分别位于A、B、C三类地址内：
A类地址：10.0.0.0--10.255.255.255
B类地址：172.16.0.0--172.31.255.255
C类地址：192.168.0.0--192.168.255.255
```

### 三个server节点配置

创建的三个server节点命名 为 consul_server1，consul_server2， consul_server3。

下面先创建好配置文件，在 /opt/consul/server_conf 目录添加三个配置文件。
consul_server1_conf.json、consul_server2_conf.json 和 consul_server3_conf.json

#### consul_server1_conf.json 的内容如下：

```json
{
        "datacenter": "dc1",
        "log_level": "INFO",
        "node_name": "consul_server1",
        "server": true,
        "bootstrap_expect": 3,
        "bind_addr": "0.0.0.0",
        "client_addr": "0.0.0.0",
        "ui": true,
        "ports": {
            "dns": 8600,
            "http": 8500,
            "https": -1,
            "server": 8300,
            "serf_lan": 8301,
            "serf_wan": 8302
        },
        "rejoin_after_leave": true,
        "retry_join": [
            "172.20.0.2",
            "172.20.0.3",
            "172.20.0.4"
        ],
        "retry_interval": "30s",
        "reconnect_timeout": "72h"
}
```

另外两个配置基本一样只用更改 node_name 为 consul_server2 和 consul_server3 即可。

#### consul_server2_conf.json 的内容如下：

```json
{
        "datacenter": "dc1",
        "log_level": "INFO",
        "node_name": "consul_server2",
        "server": true,
        "bootstrap_expect": 3,
        "bind_addr": "0.0.0.0",
        "client_addr": "0.0.0.0",
        "ui": true,
        "ports": {
            "dns": 8600,
            "http": 8500,
            "https": -1,
            "server": 8300,
            "serf_lan": 8301,
            "serf_wan": 8302
        },
        "rejoin_after_leave": true,
        "retry_join": [
            "172.20.0.2",
            "172.20.0.3",
            "172.20.0.4"
        ],
        "retry_interval": "30s",
        "reconnect_timeout": "72h"
}
```

#### consul_server3_conf.json 的内容如下：

```json
{
        "datacenter": "dc1",
        "log_level": "INFO",
        "node_name": "consul_server3",
        "server": true,
        "bootstrap_expect": 3,
        "bind_addr": "0.0.0.0",
        "client_addr": "0.0.0.0",
        "ui": true,
        "ports": {
            "dns": 8600,
            "http": 8500,
            "https": -1,
            "server": 8300,
            "serf_lan": 8301,
            "serf_wan": 8302
        },
        "rejoin_after_leave": true,
        "retry_join": [
            "172.20.0.2",
            "172.20.0.3",
            "172.20.0.4"
        ],
        "retry_interval": "30s",
        "reconnect_timeout": "72h"
}
```

#### 启动 server 节点

分别依次执行启动server，命令如下：

```bash
$ docker run -d  --name consul_server1 --net static-net --ip 172.20.0.2 -h consul1 -v /opt/consul/server_conf/consul_server1_conf.json:/consul/config/consul_server1_conf.json consul:1.3.0 agent -config-dir /consul/config
```

根据启动不同的 server 修改相应的名称、IP、主机和配置文件。

### 三个 client节点配置

创建的三个server节点命名 为 consul_client1，consul_client2， consul_client3。

下面先创建好配置文件，在 /opt/consul/client_conf 目录添加三个配置文件。
consul_client1_conf.json、consul_client2_conf.json 和 consul_client3_conf.json

#### consul_client1_conf.json 的内容如下：

```json
{
    "datacenter": "dc1",
    "log_level": "INFO",
    "node_name": "consul_client1",
    "server": false,
    "bind_addr": "172.20.0.5",
    "client_addr": "0.0.0.0",
    "ui": false,
    "ports": {
        "dns": 8600,
        "http": 8500,
        "https": -1,
        "server": 8300,
        "serf_lan": 8301,
        "serf_wan": 8302
    },
    "rejoin_after_leave": true,
    "retry_join": [
        "172.20.0.2",
        "172.20.0.3",
        "172.20.0.4"
    ],
    "retry_interval": "30s",
    "reconnect_timeout": "72h"
}
```

另外两个配置基本一样只用更改 node_name 为 consul_client2 和 consul_client3 即可。

#### 启动 client 节点

分别依次执行启动client，命令如下：

```bash
$ docker run -d --name consul_client1 --net static-net --ip 172.20.0.5 -h consul4 -v /opt/consul/client_conf/consul_client1_conf.json:/consul/config/consul_client1_conf.json consul:1.3.0 agent -config-dir /consul/config
```

根据启动不同的 client 修改相应的容器和节点名称、IP、主机和配置文件。

## 集群部署与配置

不使用配置文件的集群与配置部署

### 启动consul_server1节点

```bash
$ docker run -d --name=consul-server1 --net host --ip 172.20.0.2 \
             -p 8300:8300 \
             -p 8301:8301 \
             -p 8301:8301/udp \
             -p 8302:8302/udp \
             -p 8302:8302 \
             -p 8400:8400 \
             -p 8500:8500 \
             -p 8600:8600 \
             -h consul-server1 \
             consul:1.3.0 agent -server -bind=172.20.0.2 \
             -bootstrap-expect=3 -node=consul-server1 \
             advertise 192.168.56.76 \
             -data-dir=/tmp/data-dir -client 0.0.0.0 -ui
```

### 启动consul_server2节点

```bash
$ docker run -d --name=consul-server2 --net static-net --ip 172.20.0.3 \
             -p 9300:8300  \
             -p 9301:8301 \
             -p 9301:8301/udp \
             -p 9302:8302/udp \
             -p 9302:8302 \
             -p 9400:8400 \
             -p 9500:8500 \
             -p 9600:8600 \
             -h consul-server2 \
             consul:1.3.0 agent -server -bind=172.20.0.3 \
             -join=192.168.56.76  \
             -node=consul-server2 \
             -data-dir=/tmp/data-dir -client 0.0.0.0 -ui
```

### 启动consul_server3节点

```bash
$ docker run -d --name=consul-server3 --restart=always \
             -p 10300:8300  \
             -p 10301:8301 \
             -p 10301:8301/udp \
             -p 10302:8302/udp \
             -p 10302:8302 \
             -p 10400:8400 \
             -p 10500:8500 \
             -p 10600:8600 \
             -h consul-server3 \
             consul:1.3.0 agent -server -bind=172.20.0.4 \
             -join=192.168.56.76 -node-id=$(uuidgen | awk '{print tolower($0)}') \
             -node=consul-server3 \
             -data-dir=/tmp/data-dir -client 0.0.0.0 -ui
```

### 启动consul_client1节点

```bash
$ docker run -d --name=consul-client1 --net static-net --ip 172.20.0.5 \
            -p 11300:8300 \
            -p 11301:8301 \
            -p 11301:8301/udp \
            -p 11302:8302/udp \
            -p 11302:8302 \
            -p 11400:8400 \
            -p 11500:8500 \
            -p 11600:8600 \
            -h consul-client1 \
            consul:1.3.0 agent -bind=172.20.0.5 \
            -retry-join=172.20.0.2 \
            -node=consul-client1 -client 0.0.0.0 -ui
```

## 集群监控与跟踪

### 查看server日志

查看`consu_serverl`的日志，追踪运行情况：

```bash
$ sudo docker logs -f consul_server1
```

当3个`Server`节点都启动并正常运行时，观察`consul_server2`和`consul_server3`的进程日志，可以发现`consul_server1`被选举为`leader`节点，也就是这个**数据中心**的`Server Master`。

再次查看`consul_server1`节点的进程启动日志：

```bash
$ sudo docker logs -f consul_srver1
```

观察日志发现，`consul_server2`和`consul_server3`都成功join到了`consul_server1`所在的数据中心`dc1`。当集群中有3台`Consul Server`启动时，`consul_server1`被选举为`dc1`中的主节点。然后，`consul_server1`会通过心跳检查的方式，不断地对`consul_server2`和`consul_server3`进行健康检查。

### 查看client日志

查看`consu_clientl`的日志，追踪运行情况：

```bash
$ sudo docker ps -f consul_client1
```

可以发现：`consul_client1`是以`Client`模式启动运行的。启动后完成后，把`dc1`数据中心中的以`Server`模式启动的节点`consul_server1`、`consul_server2`和`consul_server3`都添加到**本地缓存列表**中。当客户端向`consul_client1`发起服务发现的请求后，`consul_client1`会通过`RPC`将请求转发给`Server`节点中的其中一台做处理。

### 查看集群状态

```bash
$ docker exec -t consul_server1 consul members
Node            Address          Status  Type    Build  Protocol  DC   Segment
consul_server1  172.20.0.2:8301  alive   server  1.3.0  2         dc1  <all>
consul_server2  172.20.0.3:8301  alive   server  1.3.0  2         dc1  <all>
consul_server3  172.20.0.4:8301  alive   server  1.3.0  2         dc1  <all>
consul_client1  172.20.0.5:8301  alive   client  1.3.0  2         dc1  <default>
```

`dc1`数据中心中的4个节点`consul_server1`, `consul_server2`, `consul_server3`和`consul_server4`分别成功启动，`Status`表示他们的状态，都为`alive`。`consul_server1`, `consul_server2`, `consul_server3`以`Server`模式启动，而`consul_client1`以`Client`模式启动。

与之前启动的一样。DC表示数据中心，都是dc1。

### 节点异常consul的处理

- LEADER 挂了
  leader挂了，consul会重新选取出新的leader，只要超过一半的SERVER还活着，集群是可以正常工作的。consul1是leader，所以把这个容器停了。

```bash
$ docker stop consul_server1
```

看看其他节点的日志（consul_server2）：

日志打印，心跳检查consul_server1的ip超时，接着开始选举。consul_server2被选举为新的leader。我们查看下现在的leader：

```bash
$ curl http://172.17.0.33:8500/v1/status/leader
"172.20.0.3:8300"
```

> 172.20.0.3 就是 consul_server2节点的IP

### 拉取Registrator的镜像

```bash
$ sudo docker pull gliderlabs/registrator
```

### 启动Registrator节点

```bash
$ sudo docker run -d --name=registrator \
             -v /var/run/docker.sock:/tmp/docker.sock \
             --net=host \
             gliderlabs/registrator -ip="192.168.56.76" consul://172.20.0.2:8500
```

> `--net：`指定为host表明使用主机模式。
>
> `-ip：`用于指定宿主机的IP地址，用于健康检查的通信地址。
>
> `consul://192.168.56.76:8500:` 使用Consul作为服务注册表，指定具体的Consul通信地址进行服务注册和注销（注意：8500是Consul对外暴露的HTTP通信端口）。

查看`Registrator`的容器进程启动日志：

```bash
$ sudo docker logs -f registrator
```

`Registrator`在启动过程完成了以下几步操作：

1. 查看Consul数据中心的leader节点，作为服务注册表；
2. 同步当前宿主机的启用容器，以及所有的服务端口；
3. 分别将各个容器发布的服务地址/端口注册到Consul的服务注册列表。

### 查看Consul的注册状态

`Consul`提供了一个`Web UI`来可视化**服务注册列表**、**通信节点**、**数据中心**和**键/值存储**等，直接访问宿主机的`8500`端口。

**服务注册列表**：

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-xVUlBeaQ-1599612136677)(assets/1541719660720.png)]

`NODES`节点下挂载着`dc1`数据中心中的所有的`Consul`节点，包括`Consul Server`和`Client`。

**通信节点列表**：

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-2FP30a9c-1599612136679)(assets/1541719699164.png)]

## 使用

部署完了，那么可以看看怎么用这个东东了。

### 注册个服务

使用HTTP API 注册个服务，使用[接口API]([https://www.consul.io/api/agent/service.html](https://link.jianshu.com/?t=https://www.consul.io/api/agent/service.html) API)调用

调用 [http://192.168.56.76:8500/v1/agent/service/register](https://link.jianshu.com/?t=http://consul:8500/v1/agent/service/register) PUT 注册一个服务。request body:

```json
{
  "ID": "userServiceId", //服务id
  "Name": "userService", //服务名
  "Tags": [              //服务的tag，自定义，可以根据这个tag来区分同一个服务名的服务
    "primary",
    "v1"
  ],
  "Address": "127.0.0.1",//服务注册到consul的IP，服务发现，发现的就是这个IP
  "Port": 8000,          //服务注册consul的PORT，发现的就是这个PORT
  "EnableTagOverride": false,
  "Check": {             //健康检查部分
    "DeregisterCriticalServiceAfter": "90m",
    "HTTP": "http://www.baidu.com", //指定健康检查的URL，调用后只要返回20X，consul都认为是健康的
    "Interval": "10s"   //健康检查间隔时间，每隔10s，调用一次上面的URL
  }
}
```

### 调用服务

使用curl调用服务

```json
curl http://192.168.56.76:8500/v1/agent/service/register -X PUT -i -H "Content-Type:application/json" -d '{
 "ID": "userServiceId",  
 "Name": "userService",
 "Tags": [
   "primary",
   "v1"
 ],
 "Address": "127.0.0.1",
 "Port": 8000,
 "EnableTagOverride": false,
 "Check": {
   "DeregisterCriticalServiceAfter": "90m",
   "HTTP": "http://www.baidu.com",
   "Interval": "10s"
 }
}'
```

OK，注册了一个服务

### 发现个服务

刚刚注册了名为userService的服务，我们现在发现（查询）下这个服务

```bash
curl http://172.20.0.2:8500/v1/catalog/service/userService
```

返回的响应：

```json
[
    {
        "Address": "172.17.0.33",
        "CreateIndex": 880,
        "ID": "e6e9a8cb-c47e-4be9-b13e-a24a1582e825",
        "ModifyIndex": 880,
        "Node": "consul3",
        "NodeMeta": {},
        "ServiceAddress": "127.0.0.1",
        "ServiceEnableTagOverride": false,
        "ServiceID": "userServiceId",
        "ServiceName": "userService",
        "ServicePort": 8000,
        "ServiceTags": [
            "primary",
            "v1"
        ],
        "TaggedAddresses": {
            "lan": "172.17.0.33",
            "wan": "172.17.0.33"
        }
    }
]
```

内容有了吧，这个就是我们刚刚注册的服务的信息，就可以获取到

> 服务的名称是“userService”
> 服务地址是“127.0.0.1”
> 服务的端口是“8000”

### 存储个K/V

设置一个值到user/config/connections 内容为5

```bash
$ docker exec -t consul1 consul kv put user/config/connections 5
```

获取特定的值

```bash
$ docker exec -t consul1 consul kv get -detailed user/config/connections
```

## 总结

启动`Registrator`以后，宿主机中的所有容器把服务都注册到`Consul`的`SERVICES`上，测试完成！

**单数据中心**的`Consul`集群的搭建就完成了！！！后续章节我会介绍如何使用`Registrator`进行服务注册的**标签化**。然后通过`docker`部署**多实例**的`Web`容器来实现基于`HTTP`的`RESTful Service`和基于`TCP`的`RPC Service`的**服务注册**和**健康检查定义**，并演示如何以**标签**标识一个服务的多个实例。

## 参考

docker官网镜像

https://hub.docker.com/_/consul/

https://blog.csdn.net/liuzhuchen/article/details/81913562 详细参数说明

https://www.jianshu.com/p/f8746b81d65d

nomad

https://www.cnblogs.com/magic-chenyang/p/7975677.html

http://www.cnblogs.com/magic-chenyang/p/7975724.html

官网

https://www.consul.io/

集群安装配置

https://juejin.im/post/5b2a6b606fb9a00e594c676d

安装与配置gliderlabs/registrator具有可插入后端的Docker服务注册表桥

https://hub.docker.com/r/gliderlabs/registrator/

consul 入门

http://www.10tiao.com/html/357/201705/2247485185/1.html

使用jenkins、docker、consul、nginx搭建支持自动化构建部署以及弹性伸缩的集群系统详细教程

https://blog.csdn.net/qq_22152261/article/details/76099579

consul-template & nginx

https://tonybai.com/2018/09/10/setup-service-discovery-and-load-balance-based-on-consul/

```
## 总结

启动`Registrator`以后，宿主机中的所有容器把服务都注册到`Consul`的`SERVICES`上，测试完成！

**单数据中心**的`Consul`集群的搭建就完成了！！！后续章节我会介绍如何使用`Registrator`进行服务注册的**标签化**。然后通过`docker`部署**多实例**的`Web`容器来实现基于`HTTP`的`RESTful Service`和基于`TCP`的`RPC Service`的**服务注册**和**健康检查定义**，并演示如何以**标签**标识一个服务的多个实例。



## 参考

docker官网镜像

https://hub.docker.com/_/consul/

https://blog.csdn.net/liuzhuchen/article/details/81913562 详细参数说明

https://www.jianshu.com/p/f8746b81d65d

nomad

https://www.cnblogs.com/magic-chenyang/p/7975677.html

http://www.cnblogs.com/magic-chenyang/p/7975724.html

官网

https://www.consul.io/

集群安装配置

https://juejin.im/post/5b2a6b606fb9a00e594c676d



安装与配置gliderlabs/registrator具有可插入后端的Docker服务注册表桥

https://hub.docker.com/r/gliderlabs/registrator/

consul 入门

http://www.10tiao.com/html/357/201705/2247485185/1.html



使用jenkins、docker、consul、nginx搭建支持自动化构建部署以及弹性伸缩的集群系统详细教程

https://blog.csdn.net/qq_22152261/article/details/76099579

consul-template & nginx

https://tonybai.com/2018/09/10/setup-service-discovery-and-load-balance-based-on-consul/
```