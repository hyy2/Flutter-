## Align

### 简介
用来控制一个子View的在父控件中的位置

### 属性参数
属性名 |  介绍 | 使用 
---| ---| ---
alignment |  默认 Alignment.center，child居中显示 | Alignment类中定义了一系列常量可供使用，eg, topLeft、topCenter、topRight等。 <p>你也可以使用构造函数初始化Alignment, 构造函数参数的传参数的范围必须在 -1 到 1 之间。<p>详细信息见Alignment介绍。
widthFactor | Align控件宽度 = child宽度 * widthFactor | 必须 >= 0. <p> 如果没有设置此值，则撑满限制的最大宽度
heightFactor | Align控件高度 = child高度 * heightFactor | 必须 >= 0. <p>如果没有设置此值，则撑满限制的最大高度
child |  控件 | Align修饰的child控件

