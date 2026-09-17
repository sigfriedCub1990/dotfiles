function e
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv[1]
    end
end
