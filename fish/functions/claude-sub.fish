function claude-sub
    set -lx CLAUDE_CONFIG_DIR $HOME/.claude-sub
    command claude $argv
end
