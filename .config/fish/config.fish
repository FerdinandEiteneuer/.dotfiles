# set -gx PATH ~/anaconda3/bin $PATH  # commented out by conda initialize 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/ferdinand/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


alias st "git status"
alias cda "conda deactivate"
alias ca "conda activate"

