function fish_mode_prompt
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold red
                echo ' φ'
            case insert
                set_color --bold green
                echo ' Δ'
            case replace_one
                set_color --bold green
                echo ' δ'
            case visual
                set_color --bold magenta
                echo ' τ'
        end
        set_color normal
        echo -n ' '
    end
end
