# set -gx PATH ~/anaconda3/bin $PATH  # commented out by conda initialize 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/ferdinand/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


alias st "git status"
alias cda "conda deactivate"
alias ca "conda activate"


# anytime the cd command is called, this handler gets executed
# need to source this function for it to work, otherwise it wont work
source ~/.config/fish/functions/_cd_handler.fish

# use the env variable set by _cd_handler to auto cd into the last directory
# that we changed into inside a different shell.
# This way, we start in the same dir as the last shell.
if set -q _cd_handler_last_pwd
    cd $_cd_handler_last_pwd
end
