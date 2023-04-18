# workFlowRec
record the commands, then run

***

## Usage

`wf ` 
+ -n 1/2 创建workFlow.rec, 2为隐藏的
+ -s cat/head/tail 查看workFlow.rec
+ -c 取消上次的记录
+ -e commands 记录并执行命令
+ -r sentennce 仅记录, 不执行

(next : 记录上一条或下一条执行的命令)

## 实现方法

+ 通过.workFlow.rec或者workFlow.rec记录, 取决于是否public; 自动向上级寻找有w权限的这个文件, 直到~. 没有的话给个提示
+ 任何需要记录的命令, 在前面加上wf, wf脚本负责记录命令内容及时间, 并执行命令
+ 还得记录所处的相对路径, 这样就不用记录cd了...


