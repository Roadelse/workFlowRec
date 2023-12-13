# WorkFlowRec Readme

## v2023

**@2023-12-11 22:16:55**

+ WorkFlowRec, 堂堂redive!
+ 此前是用wf指令作为prefix, 手动指定某些命令的记录, 但是属实麻烦, 于是现在, 计划利用`PROMPT_COMMAND`来实现自动的指令记录
+ 同时, 在最终记录后, 对指令的有效性进行筛查, 例如一些ls啥的, 就没必要留着了!



### Tech-Route

**v20231212**

+ 首先实现个bash的function, 作为`PROMPT_COMMAND`的执行内容, 功能是存储该指令到一个指定文件中, 同时需要在内部做一些筛选, 一些无实际影响的command不记录, 例如ls, cd之类的...
+ 将wf分为执行模式(`./`)和载入模式(`source`), 执行模式照旧, 载入模式, 自动toggle auto_mode(因为接受不了参数, 日...)
+ 动态添加屏蔽指令和屏蔽executable, 存储形式是本地文件, 搞个类似.gitignore的玩意儿!
+ 手动过滤, 例如记了很多, 在更新屏蔽词后, 过滤一下

### workflow

**@2023-12-13 11:32:24**
+ 实现filter_mode的功能
+ 优化auto_mode的进出方式, 一方面在*module::rdee*中添加alias wfa='source wf'; 另一方面利用trap bash EXIT实现ctrl+D退出, 但是这个本质是开了个子shell, 可能会有点问题

**@2023-12-12 21:40:34**

+ 确定动态屏蔽内容的存储形式: 本地文件

**@2023-12-12 11:11:49**

+ 基本实现了**Tech-Route/v20231212**的内容
+ 改用markdown实现, 同时增加glow的查看方式
+ 重构了逻辑, 现在在同一路径下的操作会汇总在一个block内而不是每个command单独
+ 修正`-c`的逻辑以适配新的记录方式<sub>@2023-12-12 11:34:11</sub>



***
***
***

## Deprecated @2023-12-11

### Usage

`wf ` 

+ -n 1/2 创建workFlow.rec, 2为隐藏的
+ -s cat/head/tail 查看workFlow.rec
+ -c 取消上次的记录
+ -e commands 记录并执行命令
+ -r sentennce 仅记录, 不执行

(next : 记录上一条或下一条执行的命令)

### 实现方法

+ 通过.workFlow.rec或者workFlow.rec记录, 取决于是否public; 自动向上级寻找有w权限的这个文件, 直到~. 没有的话给个提示
+ 任何需要记录的命令, 在前面加上wf, wf脚本负责记录命令内容及时间, 并执行命令
+ 还得记录所处的相对路径, 这样就不用记录cd了...

***

