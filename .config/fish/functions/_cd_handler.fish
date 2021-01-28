function _cd_handler --on-variable PWD
    set -Ux _cd_handler_last_pwd $PWD
end
