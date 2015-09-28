set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  printf '%s%s%s> ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function fish_right_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '(%s)' (parse_git_branch)
  else
    printf ''
  end
end

alias ul "osascript ~/.termtile/tile.scpt up left"
alias ur "osascript ~/.termtile/tile.scpt up right"
alias dl "osascript ~/.termtile/tile.scpt down left"
alias dr "osascript ~/.termtile/tile.scpt down right"
alias ll "osascript ~/.termtile/tile.scpt left"
alias rr "osascript ~/.termtile/tile.scpt right"
alias up "osascript ~/.termtile/tile.scpt up"
alias down "osascript ~/.termtile/tile.scpt down"
alias big "osascript ~/.termtile/resize.scpt "
alias cen "osascript ~/.termtile/center.scpt "
alias max "osascript ~/.termtile/maximize.scpt "
alias sn "osascript ~/.termtile/changeScreen.scpt next"
alias fs "osascript ~/.termtile/fullscreen.scpt "
