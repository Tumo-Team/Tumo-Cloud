# Spring Cloud Security Template 

> SCST. 基于SpringCloud Alibaba & Nacos构建的分布式权限管理系统  :rocket:

**项目后端源码：[https://github.com/TyCoding/scst](https://github.com/TyCoding/scst)**

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
├── scst-auth                   oAuth2服务鉴权模块[3000]
├── scst-common
│   ├── scst-common-core        通用工具类模块
│   ├── scst-common-log         通用日志记录模块
│   ├── scst-common-security    通用鉴权服务配置、工具模块
│   ├── scst-common-web         通用Web服务配置、工具模块
├── scst-gateway                SpringCloud Gateway路由网关[9999]
├── scst-nacos                  Nacos Console注册、配置中心[8848]
├── scst-system
│   ├── scst-system-api         项目权限管理业务API模块
│   ├── scst-system-biz         项目权限管理业务实现模块[4000]
├── scst-visual
│   ├── scst-visual-admin       SpringBoot Admin监控[5001]
│   ├── scst-visual-sentinel    Sentinel Dashboard监控[5002]
```

## Install

修改本地`hosts`文件，添加如下配置：

```
# SCST Project
127.0.0.1 scst-nacos
127.0.0.1 scst-auth
127.0.0.1 scst-gateway
127.0.0.1 scst-mysql
127.0.0.1 scst-sentinel
```

按照如下顺序启动项目

```
ScstNacosApplication
SctSystemBizApplication
ScstAuthApplication
ScstGatewayApplication

以上是项目基础服务，启动后即可访问
如果需要查看Sentinel、SpringBootAdmin监控服务，再依次启动如下项目

ScstVisualSentinelApplication
ScstVisualAdminApplication
```

## 鸣谢

[https://gitee.com/log4j/pig](https://gitee.com/log4j/pig) 项目中很多地方借鉴`pig`项目设计，非常感谢原作者提供这么好的开源项目。

## Docs

后续将在我的公众号 **程序员涂陌** 中陆续发布，请持续关注！

| 程序员涂陌                                                  |
| ----------------------------------------------------------- |
| ![qrcode_for_gh](http://cdn.tycoding.cn/20200610184737.jpg) |

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

