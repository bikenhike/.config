function claude-api
    set -lx CLAUDE_CONFIG_DIR $HOME/.claude-api
    command claude $argv
end
