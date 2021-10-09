pr drop _all
cls

*---------------wmt 命令----------------------
* 描述或安装单个命令
wmt describe mas //查询一下 mas 命令(含 title、description、authors、installation files)
wmt install mas //安装命令 mas。如果文件已存在且不一样，则会告诉你哪些文件不一样，但不做任何操作
wmt install mas, replace //安装命令 mas。如果安装文件已存在且不一样，则替换之；如果一样，则不做任何操作
wmt install mas, force //安装命令 mas。如果安装文件已存在(无论是否一样)，都强制替换之
return list //返回值

* 描述或安装多个命令
wmt describe fn mas
wmt install fn mas
wmt install fn mas, replace
wmt install fn mas, force
return list //返回值

* 更新命令 wmt 本身
wmt update


*--------------深入阅读：Stata 自带 net 命令--------------
net describe mas, from("https://raw.githubusercontent.com/Meiting-Wang/mas/main") //描述一下 mas 命令(含 title、description、authors、installation files)
net install mas, from("https://raw.githubusercontent.com/Meiting-Wang/mas/main") //安装命令 mas。如果文件已存在且不一样，则会告诉你哪些文件不一样，但不做任何操作
net install mas, from("https://raw.githubusercontent.com/Meiting-Wang/mas/main") replace //安装命令 mas。如果安装文件已存在且不一样，则替换之；如果一样，则不做任何操作
net install mas, from("https://raw.githubusercontent.com/Meiting-Wang/mas/main") force //安装命令 mas。如果安装文件已存在(无论是否一样)，都强制替换之
