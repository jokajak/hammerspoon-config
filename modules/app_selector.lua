local match_dialgoue = import('utils/match_dialogue')
local function module_init()
    local function match_data_source()
        return fnutils.map(window.allwindows(), function(window)
            return {
                string = window:application():title() .. ' - ' .. window:title(),
                window = window
            }
        end)
    end

    local function match_selected(match)
        match.window:focus()
    end

    local matcher = match_dialgoue(match_data_source, match_selected)

    hotkey.bind(config:get('app_selector.mash', {"ctrl"}), config:get('app_selector.key', "tab"), function()
        matcher:show()
    end)
end

return {
    init = module_init
}

