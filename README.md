# WorkFlowRec Readme

## Preface

**@2023-12-11 22:16:55**

+ WorkFlowRec, 堂堂redive!
+ 此前是用wf指令作为prefix, 手动指定某些命令的记录, 但是属实麻烦, 于是现在, 计划利用`PROMPT_COMMAND`来实现自动的指令记录
+ 同时, 在最终记录后, 对指令的有效性进行筛查, 例如一些ls啥的, 就没必要留着了!



## Tech-Route

**v1211**

+ 首先实现个bash的function, 作为`PROMPT_COMMAND`的执行内容, 功能是存储该指令到一个指定文件中





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

