* Description: describe or install the Stata commands written by Meiting Wang.
* Author: Meiting Wang, Ph.D. Candidate, Institute for Economic and Social Research, Jinan University
* Email: wangmeiting92@gmail.com
* Created on July 26, 2021
* Updated on Sep 25, 2021



program define wmt, rclass
version 16.0

syntax anything(everything) [, replace force]
/*
***编程注意事项
- 这里 anything 会将双引号传递下来
*/


*-------------------序---------------------
local wmt_commands_master "wmtsum wmttest wmtcorr wmtreg wmtmat matmh wmtstr space_rm mat_cagn table2 tabstat2" //早期 github 主分支为 master 时 wmt 所写的命令
local wmt_commands_main "fsfz fn mas del wmt levelsof2 skewnor open lpoly1" //后期 github 主分支改为 main 之后 wmt 所编写的命令
local all_wmt_cmds "`wmt_commands_master' `wmt_commands_main'" //所有 wmt 写过的命令


*----------------前期程序-------------------
* 提取 subcmd 和 commands
gettoken subcmd commands: anything
local describe_str "^d((e?)|(es?)|(esc?)|(escr?)|(escri?)|(escrib?)|(escribe?))$"
local install_str "^i((n?)|(ns?)|(nst?)|(nsta?)|(nstal?)|(nstall?))$"
local update_str "^u((p?)|(pd?)|(pda?)|(pdat?)|(pdate?))$"
if ~ustrregexm("`subcmd'","(`describe_str')|(`install_str')|(`update_str')") {
	dis as error `"Only {cmd:wmt describe ...} , {cmd:wmt install ...} or {cmd:wmt update} allowed"'
	error 9999
} //让 subcmd 符合 describe, install, 或 update

local commands = ustrregexra(`"`commands'"',`"(^\s*"?\s*)|(\s*"?$)"',"") //去除 commands 前端和末端的双引号和空格
if ~ustrregexm("`subcmd'","`update_str'") & ("`commands'"=="") {
	dis as error "Commands written by Meiting Wang required"
	error 9999
}
else if ustrregexm("`subcmd'","`update_str'") & ("`commands'"!="") {
	dis as error "No need to input commands in {cmd:wmt update}"
	error 9999
}


* (1) 提取 command1-command...; (2) 提取 main1-main...
tokenize `commands'
local i = 1
while "``i''" != "" {
	local command`i' ``i'' //提取 command1-command...
	if ustrregexm("`wmt_commands_master'","\b`command`i''\b") {
		local main`i' "master" //提取 main1-main...
	}
	else {
		local main`i' "main" //提取 main1-main...
	}
	local i = `i' + 1
}
local commands_num = `i' - 1 //所输入命令的总数量


*-------------------主程序--------------------
if ustrregexm("`subcmd'","`describe_str'") { //当 subcmd 为 describe 时
	forvalues i = 1/`commands_num' {
		net describe `command`i'', from("https://raw.githubusercontent.com/Meiting-Wang/`command`i''/`main`i''")
		if `i' < `commands_num' {
			dis "" //输出时这里空出一行
		}
	}
}
else if ustrregexm("`subcmd'","`install_str'") { //当 subcmd 为 install 时
	dis "" //输出时这里空出一行
	forvalues i = 1/`commands_num' {
		dis as text "{hline}"
		net install `command`i'', from("https://raw.githubusercontent.com/Meiting-Wang/`command`i''/`main`i''") `replace' `force'
		if `i' == `commands_num' {
			dis as text "{hline}"
		}
	}
}
else { //当 subcmd 为 update 时
	dis as text "{hline}"
	net install wmt, from("https://raw.githubusercontent.com/Meiting-Wang/wmt/main") replace
	dis as text "{hline}"
	local commands "wmt"
	local commands_num = 1
}



*---------------------返回值---------------------
return local all_wmt_cmds "`all_wmt_cmds'" //返回 wmt 所编写的所有命令
return local cmds_num = `commands_num'
return local cmds "`commands'"

end
