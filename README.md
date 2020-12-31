# Spring Cloud Security Template 分布式权限管理项目 -- 后端

> SCST. 基于SpringCloud Alibaba & Nacos构建的分布式权限管理系统  :rocket:

**项目前端源码：[https://github.com/TyCoding/scst-ui](https://github.com/TyCoding/scst-ui)**

**项目文档：[https://docs.scst.tycoding.cn](https://docs.scst.tycoding.cn)**

**项目正在完善中...**

欢迎star,fork关注

## Environment

**Dependencies**

| Name                              | Version       |
| --------------------------------- | ------------- |
| spring-boot-starter-parent        | 2.3.1.RELEASE |
| spring-cloud-dependencies         | Hoxton.SR6    |
| spring-cloud-alibaba-dependencies | 2.2.1.RELEASE |

## Introduce

```
.
├── tumo-cloud-auth                   OAuth2服务鉴权模块[3000]
├── tumo-cloud-common
│   ├── tumo-cloud-common-core        通用工具类模块
│   ├── tumo-cloud-common-log         通用日志记录模块
│   ├── tumo-cloud-common-security    通用鉴权服务配置、工具模块
│   ├── tumo-cloud-common-web         通用Web服务配置、工具模块
├── tumo-cloud-gateway                SpringCloud Gateway路由网关[9999]
├── tumo-cloud-nacos                  Nacos Console注册、配置中心[8848]
├── tumo-cloud-system
│   ├── tumo-cloud-system-api         项目权限管理业务API模块
│   ├── tumo-cloud-system-biz         项目权限管理业务实现模块[4000]
├── tumo-cloud-visual
│   ├── tumo-cloud-visual-admin       SpringBoot Admin监控[5001]
│   ├── tumo-cloud-visual-sentinel    Sentinel Dashboard监控[5002]
```

## Install

修改本地`hosts`文件，添加如下配置：

```
# Tumo-Cloud Project
127.0.0.1 tumo-cloud-nacos
127.0.0.1 tumo-cloud-auth
127.0.0.1 tumo-cloud-gateway
127.0.0.1 tumo-cloud-mysql
127.0.0.1 tumo-cloud-sentinel
```

按照如下顺序启动项目

```
TumoBootNacosApplication
TumoBootSystemBizApplication
TumoBootAuthApplication
TumoBootGatewayApplication

以上是项目基础服务，启动后即可访问
如果需要查看Sentinel、SpringBootAdmin监控服务，再依次启动如下项目

TumoBootVisualSentinelApplication
TumoBootVisualAdminApplication
```

## Thanks

[https://gitee.com/log4j/pig](https://gitee.com/log4j/pig) 非常感谢原作者提供这么优质的开源项目。

## Docs

**项目文档：[https://docs.scst.tycoding.cn](https://docs.scst.tycoding.cn)**

后续将在我的公众号 **程序员涂陌** 中陆续发布，请持续关注！

| 程序员涂陌                                                  |
| ----------------------------------------------------------- |
| ![qrcode_for_gh](http://cdn.tycoding.cn/20200610184737.jpg) |

## Preview

![截屏2020-07-19 下午12.42.25](http://cdn.tycoding.cn/20200719124235.png)

![截屏2020-07-19 下午12.43.00](http://cdn.tycoding.cn/20200719124303.png)

![截屏2020-07-19 下午12.43.13](http://cdn.tycoding.cn/20200719124315.png)

![截屏2020-07-19 下午12.43.54](http://cdn.tycoding.cn/20200719124359.png)

![截屏2020-07-19 下午12.44.11](http://cdn.tycoding.cn/20200719124414.png)

![截屏2020-07-19 下午12.44.25](http://cdn.tycoding.cn/20200719124428.png)

![截屏2020-07-19 下午12.44.40](http://cdn.tycoding.cn/20200719124442.png)

![截屏2020-07-19 下午12.44.55](http://cdn.tycoding.cn/20200719124457.png)

![截屏2020-07-19 下午12.47.21](http://cdn.tycoding.cn/20200719124724.png)

![截屏2020-07-19 下午12.48.51](http://cdn.tycoding.cn/20200719124856.png)

![截屏2020-07-19 下午12.49.12](http://cdn.tycoding.cn/20200719124915.png)

## Links

- [https://github.com/alibaba/nacos](https://github.com/alibaba/nacos) Nacos官方仓库
- [https://nacos.io/zh-cn/docs/](https://nacos.io/zh-cn/docs/) Nacos官网
- [https://github.com/apache/skywalking](https://github.com/apache/skywalking) SkyWalking官方仓库
- [https://github.com/alibaba/Sentinel/](https://github.com/alibaba/Sentinel/) Sentinel官方仓库
- [https://github.com/alibaba/spring-cloud-alibaba](https://github.com/alibaba/spring-cloud-alibaba) SpringCloud Alibaba官方示例

# 交流

QQGroup：671017003   

WeChatGroup:  关注公众号查看

# 联系

- [http://www.tycoding.cn](http://www.tycoding.cn)
- [https://github.com/TyCoding](https://github.com/TyCoding)

