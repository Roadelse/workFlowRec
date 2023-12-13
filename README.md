# WorkFlowRec Readme

+ 一个用于记录Linux中目标路径及其子路径中所有操作的小工具

+ version 20231212

## Usage

`wf [OPTION]`

+ `-h`, **help_mode**, show help information
+ `-n 1/*`, **new_mode**, create workflow.md (1) or .workflow.md in current directory
+ `-s cat/head/tail/glow`, **show_mode**, show the workflow record file content in selected way
+ `-c`, **cancel_mode**, cancel last record
+ `-e ...`, **exec_mode**, record and execute the following command
+ `-r ...`, **record_mode**, record the following command only without execution
+ `-f ...`, **filter_mode**, filter the recorded content according to .wfignore

+ `source wf`, **auto_mode**, toggle the auto_mode between on and off, if on, it will automatically record the operations
+ if `OPTION` is empty when executing `wf`, **loc_mode**, just show the target record file


***

## source code

+ wf : main bash script
+ filter : python3 script used to filter commands in workflow.md
