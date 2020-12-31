# 安装SCST-UI

## 下载项目

在前面已经介绍了如何下载项目，这里不再赘述，直接使用Git命令下载项目：

```shell
git clone https://github.com/TyCoding/scst-ui.git
```

![image-20200721075628019](http://cdn.tycoding.cn/20200721075628.png)

## 安装依赖

同理Maven，前端项目依赖使用Npm管理，那么需要手动下载依赖（当然也可以使用IDE的自动化工具下载，但如IDEA下载依赖后会同时加载索引，整个工程会很花时间和占内存，所以建议大家手动安装依赖后再导入项目）

使用`cd scst-ui`切换到此目录下，运行`npm install`命令安装依赖

![image-20200721080031018](http://cdn.tycoding.cn/20200721080031.png)

如果你本地的软件版本没问题，依赖会安装成功的，其中安装过程中报错`Error`无需理会：

![image-20200721080229205](http://cdn.tycoding.cn/20200721080229.png)

## 安装插件

这里仅讲解使用IDEA安装前端插件，其他的IDE请自行百度解决。

1. 安装`IntelliVue`和`Vue.js`两个插件

![image-20200721080419297](http://cdn.tycoding.cn/20200721080419.png)

2. 安装`element`插件（适配ElementUI）

![image-20200721080501904](http://cdn.tycoding.cn/20200721080501.png)

其次应该还具有其他的插件，这些插件应该是安装IDEA的时候就默认提供了，不需要手动安装，如果没有启用就手动启用，详细看下面截图：

![image-20200721080714724](http://cdn.tycoding.cn/20200721080714.png)

![image-20200721080747557](http://cdn.tycoding.cn/20200721080747.png)

![image-20200721080811442](http://cdn.tycoding.cn/20200721080811.png)

![image-20200721080842211](http://cdn.tycoding.cn/20200721080842.png)

插件安装完毕重启IDEA。

## 导入项目

使用IDEA导入`scst-ui`文件夹，等待IDEA加载索引：

![image-20200721081108816](http://cdn.tycoding.cn/20200721081108.png)

加载完毕便可运行项目。这里主要用到`npm run dev`命令，意思是以开发环境运行项目。

![image-20200721081229458](http://cdn.tycoding.cn/20200721081229.png)

等待Webpack构建完成：

![image-20200721081308122](http://cdn.tycoding.cn/20200721081308.png)

这时候一般会自动在浏览器弹出`localhost:9527`页面，或者手动访问`http://localhost:9527`也可：

![截屏2020-07-21 上午8.14.15](http://cdn.tycoding.cn/20200721081419.png)

到此为止，前端项目安装并启动完成。

后续将讲解前端项目的设计和交互流程。

