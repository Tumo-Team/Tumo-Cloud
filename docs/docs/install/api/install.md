# 项目安装

## 开发环境

| Name | Version |
| -- | -- |
| OS | MacOS 10.15 |
| Mysql | 5.7 |
| IDEA | 2020.1 |
| JDK | 1.8 |
| Maven | 3.6.3 |

## 下载项目

如果你本地安装了Git客户端，可以直接使用`git clone`命令下载，或者你可以直接下载`zip`压缩包文件：

1. 使用`git clone`命令下载项目:

![截屏2020-07-18 上午7.09.52](http://cdn.tycoding.cn/20200718070954.png)

2. 直接在`zip`压缩文件

![image-20200718071027472](http://cdn.tycoding.cn/20200718071027.png)

## 修改Hosts文件

作者采用的`SwitchHosts`工具修改的Hosts文件，笔者也可以采用其他方式修改（如果不能直接修改hosts文件，先复制出来修改后再替换源文件）。

修改本地`hosts`文件，添加如下配置：

```
# SCST Project
127.0.0.1 scst-nacos
127.0.0.1 scst-auth
127.0.0.1 scst-gateway
127.0.0.1 scst-mysql
127.0.0.1 scst-sentinel
127.0.0.1 scst-admin
```

## 导入项目

### 前言

这是一个分布式项目，很多时候一些同学对：分布式项目、单体项目、多模块项目、仓库源码结构目录搞不清楚，导致不知道怎么导入项目，这里我统一解释一下：

1. 首先，项目中存在`pom.xml`文件的一定是Maven项目，想都不用想请先配置好本地Maven环境再尝试导入项目
2. GItHub仓库中是单体项目

![image-20200721063334121](http://cdn.tycoding.cn/20200721063339.png)

如上，很明显`TyCoding/tumo`仓库根目录就是项目源码，那么直接导入下载后的`tumo`文件夹。而下载GitHub源码有两种方式：`git clone`命令下载、在GitHub仓库页面`Download ZIP`按钮下载Zip压缩文件。这两种方式最大的区别就是：

- `git clone`方式下载的将携带`.git`文件夹；ZIP方式下载的不携带

- `git clone`方式下载的文件夹名称就是GitHub仓库名称；ZIP方式下载的文件名称是：`仓库名称-master(分支名称)`

如果采用ZIP方式下载最好先删除文件夹名称`-master`后缀。（不然导入项目时，`pom.xml`中项目名称和文件夹名称不统一）

![image-20200721064255984](http://cdn.tycoding.cn/20200721064256.png)

3. GItHub仓库中是前后端分离项目，但仓库中**不止一个项目**

![image-20200721064433445](http://cdn.tycoding.cn/20200721064433.png)

很明显看到，仓库根目录没有`pom.xml`，并且仓库中存在多个文件夹（没有`src`文件夹），就证明这个仓库中很可能是存放了多个项目，那么导入项目时你不要再**导入整个下载后文件夹目录了**：

![image-20200721064746505](http://cdn.tycoding.cn/20200721064746.png)

很多人一股脑直接导入`tumo-vue`文件夹，不是说这种方式不对，但我还是很好奇这些人导入项目时就不分析下项目目录结构吗？

正确的方式是：用IDEA分别导入`api`、`app`两个文件夹

![image-20200721065018851](http://cdn.tycoding.cn/20200721065018.png)

4. GItHub仓库中是一个分布式项目

![image-20200721065128455](http://cdn.tycoding.cn/20200721065128.png)

在本项目仓库中可以看到仓库根目录下就存在`pom.xml`，那么直接用IDEA导入此文件夹就可以；但如果他的分布式项目根目录不存在`pom.xml`，而是存在`xxx-dependences`字样文件夹，那么一样使用IDEA导入此`scst`名称的文件夹。

### 导入SCST

经过上述方式下载后得到如下文件：

![截屏2020-07-21 上午6.57.35](http://cdn.tycoding.cn/20200721065738.png)

使用IDEA导入`scst`文件夹：

![image-20200721070020662](http://cdn.tycoding.cn/20200721070020.png)

首次导入项目，要等待Maven自动加载依赖完成：

![image-20200721070042638](http://cdn.tycoding.cn/20200721070042.png)

当Maven加载完毕，正常情况在有下家弹出`Services`窗口，提示这是个分布式项目，是否打开Services Dashboard：

![image-20200721070218650](http://cdn.tycoding.cn/20200721070218.png)

点击`Show run configurations in Services`：

![image-20200721070306944](http://cdn.tycoding.cn/20200721070307.png)

但例如现在，Spring Boot Start中其实缺少了`scst-nacos`服务的Application，遇到这种情况，可以采用直接找到`scst-nacos`目录`src/main/java/com/alibaba/nacos/`目录下`ScstNacosApplication.java`文件直接运行main方法（将自动加载到`Services Dashboard`中显示）；也可以在IDEA工具栏中找到`Run/Debug Configurations`选项，手动添加`ScstNacosApplication`启动器类：

![image-20200721070855575](http://cdn.tycoding.cn/20200721070855.png)

![image-20200721070955739](http://cdn.tycoding.cn/20200721070955.png)

最终修改名称为如下：

![image-20200721071044463](http://cdn.tycoding.cn/20200721071044.png)

---

上述两种方式无论哪种都可以，但最终要保证Services Dashboard窗口中有如下服务：

![image-20200721071154602](http://cdn.tycoding.cn/20200721071154.png)

到此，项目导入完成。

## 导入数据库

在项目`db/`文件夹内可看到`.sql`文件夹，其中：

- `scst.sql` 是项目基础数据表，对应数据库名称是 `scst`
- `scst_nacos_config.sql` 是Nacos Config配置中心的数据表，对应数据库名称是 `scst_nacos_config`

上按照上述数据库名称，分别导入两个`sql`文件。





## Nacos

```properties
spring.datasource.platform=mysql

db.num=1
db.url.0=jdbc:mysql://127.0.0.1:3306/scst_nacos_config?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
db.user=root
db.password=root
```
