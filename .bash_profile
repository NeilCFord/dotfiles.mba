[[ -s ~/.bashrc ]] && source ~/.bashrc

ESC="\033" # This is the escape sequence
NO_COLOR="$ESC[0m"
IRED="$ESC[1;31m" # ANSI color code for intense/bold red
IGRN="$ESC[1;32m" # ANSI color code for intense/bold green

# From http://railstips.org/blog/archives/2009/02/02/bedazzle-your-bash-prompt-with-git-info/
# I had to change 'git-symbolic-ref' to 'git symbolic-ref'
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " ["${ref#refs/heads/}"]" # I wanted my branch wrapped in [], use () or <> or whatever
}

#PS1="\h:\W \u\$" # For reference, here's the default OS X prompt
#export PS1="\$(rvm_version)\W \$(parse_git_branch)\$ " # Without the colors

# I had to put the \[ and \] down here, as opposed to $IRED, to avoid wrapping funkiness.
# export PS1="\[$IRED\]\$(rvm_version)\[$NO_COLOR\] \w\[$IGRN\]\$(parse_git_branch)\[$NO_COLOR\] \u \$ "

# Personalised version removing the ruby version.
export PS1="\w\[$IGRN\]\$(parse_git_branch)\[$NO_COLOR\] \u \$ "