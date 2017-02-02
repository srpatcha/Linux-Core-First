
#===============================================================
#
# PERSONAL $HOME/.bashrc FILE for bash-2.05a (or later)
#
# Last modified: Tue Apr 15 20:32:34 CEST 2003
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#
# This file was designed (originally) for Solaris but based 
# on Redhat's default .bashrc file
# --> Modified for Linux.
# The majority of the code you'll find here is based on code found
# on Usenet (or internet).
# This bashrc file is a bit overcrowded - remember it is just
# just an example. Tailor it to your needs
#
#
#===============================================================

# --> Comments added by HOWTO author.
# --> And then edited again by ER :-)

#-----------------------------------
# Source global definitions (if any)
#-----------------------------------

alias repo="cd /c/Users/Owner/gitrepo/"
set -o notify
set -o noclobber
set -o ignoreeof
set -o nounset
#set -o xtrace          # useful for debuging

shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s mailwarn
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s histappend histreedit
shopt -s extglob        # useful for programmable completion

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'              # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.

# Looks best on a black background.....
echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
date

# Personnal Aliases
#-------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.

alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias which='type -all'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined 
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias background='xv -root -quit -max -rmode 5' # put a picture in the background
alias vi='vim'
alias du='du -h'
alias df='df -kh'

# The 'ls' family (this assumes you use the GNU ls)
alias ls='ls -hF --color'	# add colors for filetype recognition
alias lx='ls -lXB'		# sort by extension
alias lk='ls -lSr'		# sort by size
alias la='ls -Al'		# show hidden files
alias lr='ls -lR'		# recursice ls
alias lt='ls -ltr'		# sort by date
alias lm='ls -al |more'		# pipe through 'more'
alias tree='tree -Cs'		# nice alternative to 'ls'


# tailoring 'less'
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # Use this if lesspipe.sh exists
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# spelling typos - highly personnal :-)
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

shopt -s extglob        # necessary
set +o nounset		# otherwise some completions will fail

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A command    nohup exec eval trace gdb
complete -A command    command type which
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # currently same as builtins
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

complete -f -d -X '*.gz'  gzip
complete -f -d -X '*.bz2' bzip2
complete -f -o default -X '!*.gz'  gunzip
complete -f -o default -X '!*.bz2' bunzip2
complete -f -o default -X '!*.pl'  perl perl5
complete -f -o default -X '!*.ps'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X '!*.dvi' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.pdf' acroread pdf2ps 
complete -f -o default -X '!*.+(pdf|ps)' gv 
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex 
complete -f -o default -X '!*.lyx' lyx 
complete -f -o default -X '!*.+(jpg|gif|xpm|png|bmp)' xv gimp
complete -f -o default -X '!*.mp3' mpg123 
complete -f -o default -X '!*.ogg' ogg123 