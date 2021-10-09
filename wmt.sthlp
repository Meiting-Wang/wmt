{smcl}
{right:Created time: July 27, 2021}
{right:Updated time: Oct   9, 2021}
{* -----------------------------title------------------------------------ *}{...}
{p 0 14 2}
{bf:[W-16] wmt} {hline 2} describe or install the Stata commands written by Meiting Wang. You can view the source code in {browse "https://github.com/Meiting-Wang/wmt":github}.


{* -----------------------------Syntax------------------------------------ *}{...}
{title:Syntax}

{p 4 4 2}
Describe one or more commands written by Meiting Wang

{p 8 8 2}
{cmd:wmt} {opt d:escribe} {it:commands}

{p 4 4 2}
Install one or more commands written by Meiting Wang

{p 8 8 2}
{cmd:wmt} {opt i:nstall} {it:commands} [{opt , replace force}]

{p 4 4 2}
Update command {cmd:wmt} itself

{p 8 8 2}
{cmd:wmt} {opt u:pdate}


{* -----------------------------Contents------------------------------------ *}{...}
{title:Contents}

{p 4 4 2}
{help wmt##Description:Description}{break}
{help wmt##Options:Options}{break}
{help wmt##Examples:Examples}{break}
{help wmt##Author:Author}{break}
{help wmt##Also_see:Also see}{break}


{* -----------------------------Description------------------------------------ *}{...}
{marker Description}{title:Description}

{p 4 4 2}
{cmd:wmt} {opt d:escribe} will describe the specified commands written by Meiting Wang, including title, description, authors, and installation files.

{p 4 4 2}
{cmd:wmt} {opt i:nstall} will install the specified commands written by Meiting Wang, including {it:.ado} and {it:.sthlp} files.

{p 4 4 2}
{cmd:wmt} {opt u:pdate} will update command {cmd:wmt} itself, the same as {bf:wmt install wmt, replace}.

{p 4 4 2}
The above commands all contain the following return values in {bf:r()}: (1) the commands you want to describe or install; (2) the number of commands you want to describe or install; (3) all the commands that Meiting Wang has written.

{p 4 4 2}
It is worth noting that this command can only be used in version 16.0 or later.


{* -----------------------------Options------------------------------------ *}{...}
{marker Options}{title:Options}

{synoptset 18}{...}
{synopthdr:install options}
{synoptline}
{synopt :{opt replace}}Secifies that the downloaded files replace existing files if any of the files already exists.{p_end}
{synopt :{opt force}}Specifies that the downloaded files replace existing files if any of the files already exists, even if Stata thinks all the files are the same. It is obvious that {opt force} implies {opt replace}.{p_end}
{synoptline}


{* -----------------------------Examples------------------------------------ *}{...}
{marker Examples}{title:Examples}

{p 4 4 2}Describe one or more commands written by Meiting Wang{p_end}
{p 8 10 2}. {stata wmt describe mas}{p_end}
{p 8 10 2}. {stata wmt describe fn mas}{p_end}

{p 4 4 2}Install one or more commands written by Meiting Wang{p_end}
{p 8 10 2}. {stata wmt install mas}{p_end}
{p 8 10 2}. {stata wmt install mas, replace}{p_end}
{p 8 10 2}. {stata wmt install mas, force}{p_end}
{p 8 10 2}. {stata wmt install fn mas}{p_end}
{p 8 10 2}. {stata wmt install fn mas, replace}{p_end}
{p 8 10 2}. {stata wmt install fn mas, force}{p_end}

{p 4 4 2}Update command {cmd:wmt} itself{p_end}
{p 8 10 2}. {stata wmt update}{p_end}

{p 4 4 2}Get the return value in {bf:r()}{p_end}
{p 8 10 2}. {stata wmt install fn mas, replace}{p_end}
{p 8 10 2}. {stata return list}{p_end}


{* -----------------------------Author------------------------------------ *}{...}
{marker Author}{title:Author}

{p 4 4 2}
Meiting Wang{break}
Institute for Economic and Social Research, Jinan University{break}
Guangzhou, China{break}
wangmeiting92@gmail.com


{* -----------------------------Also see------------------------------------ *}{...}
{marker Also_see}{title:Also see}

{p 4 4 2}All the commands written by Meiting Wang are as follows:{p_end}

{space 4}{help lpoly1}(already installed)   {col 40}{stata wmt install lpoly1,replace:install lpoly1}(to install)
{space 4}{help open}(already installed)   {col 40}{stata wmt install open,replace:install open}(to install)
{space 4}{help skewnor}(already installed)   {col 40}{stata wmt install skewnor,replace:install skewnor}(to install)
{space 4}{help levelsof2}(already installed)   {col 40}{stata wmt install levelsof2,replace:install levelsof2}(to install)
{space 4}{help wmt}(already installed)   {col 40}{stata wmt install wmt,replace:install wmt}(to install)
{space 4}{help del}(already installed)   {col 40}{stata wmt install del,replace:install del}(to install)
{space 4}{help mas}(already installed)   {col 40}{stata wmt install mas,replace:install mas}(to install)
{space 4}{help fn}(already installed)   {col 40}{stata wmt install fn,replace:install fn}(to install)
{space 4}{help tabstat2}(already installed)   {col 40}{stata wmt install tabstat2,replace:install tabstat2}(to install)
{space 4}{help table2}(already installed)   {col 40}{stata wmt install table2,replace:install table2}(to install)
{space 4}{help mat_cagn}(already installed)   {col 40}{stata wmt install mat_cagn,replace:install mat_cagn}(to install)
{space 4}{help space_rm}(already installed)   {col 40}{stata wmt install space_rm,replace:install space_rm}(to install)
{space 4}{help wmtstr}(already installed)   {col 40}{stata wmt install wmtstr,replace:install wmtstr}(to install)
{space 4}{help matmh}(already installed)   {col 40}{stata wmt install matmh,replace:install matmh}(to install)
{space 4}{help wmtmat}(already installed)   {col 40}{stata wmt install wmtmat,replace:install wmtmat}(to install)
{space 4}{help wmtreg}(already installed)   {col 40}{stata wmt install wmtreg,replace:install wmtreg}(to install)
{space 4}{help wmtcorr}(already installed)   {col 40}{stata wmt install wmtcorr,replace:install wmtcorr}(to install)
{space 4}{help wmttest}(already installed)   {col 40}{stata wmt install wmttest,replace:install wmttest}(to install)
{space 4}{help wmtsum}(already installed)   {col 40}{stata wmt install wmtsum,replace:install wmtsum}(to install)

