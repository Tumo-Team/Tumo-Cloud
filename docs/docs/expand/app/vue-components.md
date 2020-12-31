# Vue组件

## Vue父子组件交互

### 子组件修改`props`

[.sync 修饰符](https://cn.vuejs.org/v2/guide/components-custom-events.html#sync-%E4%BF%AE%E9%A5%B0%E7%AC%A6)

### Vue子组件访问`props`中的数据

```vue
props: {
  form: {
    type: Object,
    default() {
      return {}
    }
  }
},
watch: {
  'form': function(form) {
    this.pId = [form.parentId]
  }
}
```

## ElementUI小技巧

### Form组件清除表单校验状态

```vue
if (this.$refs['form'] !== undefined) {
    this.$refs['form'].resetFields()
}
```

### Tree组件多选改为单选

ElementUI Tree组件官方文档：[https://element.eleme.cn/#/zh-CN/component/tree](https://element.eleme.cn/#/zh-CN/component/tree)

从文档中可以看到，官方提供的Tree组件有个问题：

- 开启`show-checkbox`选项，则`tree`组件展示`checkbox`，但此时组件已经支持多选了
- 不开启`show-checkbox`，组件默认支持单选，节点是否选中根据此节点颜色判断。

如果你和我一样觉得这是很坑的（实现`tree`组件既要显示`checkbox`，又要是单选的），那么请遵循以下方式：

1. 页面`<el-tree>`

```html
<el-tree
         ref="tree"
         v-model="form.deptId"
         :data="deptTree"
         highlight-current
         show-checkbox
         check-strictly
         :default-checked-keys="deptId"
         :default-expanded-keys="deptId"
         node-key="id"
         :props="treeProps"
         @check-change="checkChange"
/>
```

2. JS代码

```vue
checkChange(data, node, self) {
    if (node) {
      this.pId = [data.id]
      this.$refs.tree.setCheckedKeys(this.pId)
      this.form.parentId = data.id
    } else {
      if (this.$refs.tree.getCheckedKeys().length == 0) {
        this.pId = []
        this.form.parentId = null
      }
    }
}
```

### Radio组件绑定Boolean类型参数

正常情况使用`<el-radio>`组件，需要使用`v-model`绑定选中按钮的`label`值：

```html
  <template>
    <el-radio v-model="radio" label="true">true</el-radio>
    <el-radio v-model="radio" label="false">false</el-radio>
  </template>
```

```vue
data () {
  return {
    radio: ''
  };
}
```

如果`v-model`绑定的是字符串，上述写法是完全没问题的，但如果绑定的参数是Boolean类型，上述写法就失效了：

```vue
data () {
  return {
    radio: true
  };
}
```


