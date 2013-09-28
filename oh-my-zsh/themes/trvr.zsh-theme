# We'll need colors where we're going
autoload -U colors && colors

time="%(?.%{$fg[cyan]%}.%{$fg[yellow]%})%*%{$reset_color%}"

# A nice prompt
# Colors: (G)reen, (C)yan, (G)reen, (x)reset
# GGGGGGGGCCCCCCCCCxxxxx GGGGGGGxYxGx
# username@hostname:path gitness ! #
if [[ $USER == "root" || $(id -u -n) == "root" ]]; then
    PROMPT='${time} %{$fg[red]%}%n%{$fg[cyan]%}@%m%{$reset_color%}:%c $(git_prompt_info) %{$fg[green]%}# %{$reset_color%}'
else
    PROMPT='${time} %{$fg[green]%}%n%{$fg[cyan]%}@%m%{$reset_color%}:%c $(git_prompt_info) %{$fg[green]%}# %{$reset_color%}'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}!%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
