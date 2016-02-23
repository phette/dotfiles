# Custom git prompt theme for https://github.com/magicmonty/bash-git-prompt.

override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"
  GIT_PROMPT_PREFIX="("
  GIT_PROMPT_SUFFIX=")"
  GIT_PROMPT_START_USER="${White}[${PathShort}]${ResetColor}"
  GIT_PROMPT_END_USER="${ResetColor} $ "
  GIT_PROMPT_END_ROOT="${BoldRed} # "
}

reload_git_prompt_colors "Custom"
