readme

为linux下记录操作的快捷方法, 主要是为了增加某个proj/directory下面的self-expression
以便debug和日后理解

3s脑测的实现方法是:
    ●  通过.workFlow.rec或者workFlow.rec记录, 取决于是否public; 自动向上级寻找有w权限的这个文件, 直到~. 没有的话给个提示
    ●  任何需要记录的命令, 在前面加上wf, wf脚本负责记录命令内容及时间, 并执行命令
    ●  还得记录所处的相对路径, 这样就不用记录cd了...

使用
wf cat/head/tail 进行灵活查看内容
wf new/new2 进行创建workFlow.rec或.workFlow.rec
wf cnacel 取消上一步的记录