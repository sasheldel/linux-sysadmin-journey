## Shell Builtins Documentation
- Use `help builtin-name` (e.g., `help umask`)
- Not `man` (man looks for external programs)

## Essential Builtins for RHCSA
- Navigation: `cd`, `pwd`
- Output: `echo`
- Variables: `export`, `read`
- Permissions: `umask`
- Scripting: `test`, `[ ]`, `shift`, `exit`, `source`
- Job control: `jobs`, `fg`, `bg`, `kill`
- History: `history`, `!!`, `!$`
- Aliases: `alias`, `unalias`
- Information: `type`, `help`

##Essential Shell Builtins for RHCSA

You don't need to memorize all 60+ builtins. Focus on these for the exam:
Builtin	Purpose	RHCSA Relevance
cd	Change directory	Daily navigation
pwd	Print working directory	Know where you are
echo	Print text to stdout	Scripting
export	Set environment variables	Scripting, PATH
alias / unalias	Create/remove aliases	Exam may ask
umask	Set default file permissions	Security objective
exit	Exit shell or script	Scripting
source (or .)	Execute script in current shell	Reload .bashrc
jobs / fg / bg	Job control	Process management
kill (builtin)	Send signals to jobs (also external /bin/kill)	Process management
type	Show command type	Understanding commands
history	Display command history	Exam efficiency
read	Read input into variable	Scripting
test or [ ]	Condition evaluation	Scripting (if statements)
shift	Shift positional parameters	Scripting with arguments
