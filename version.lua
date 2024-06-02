if true then
    local currentVersion = GetResourceMetadata('n-blockresol', 'version', 0)

    if currentVersion then
        currentVersion = currentVersion:match('%d%.%d+%.%d+')
    end

    SetTimeout(1000, function()
        PerformHttpRequest('https://api.github.com/repos/TheNeti/n-blockresol/releases/latest', function(status, response)
            if status ~= 200 then return end

            response = json.decode(response)
            if response.prerelease then return end

            local latestVersion = response.tag_name:match('%d%.%d+%.%d+')
            if not latestVersion or latestVersion == currentVersion then return end

            local cv = { string.strsplit('.', currentVersion) }
            local lv = { string.strsplit('.', latestVersion) }

            for i = 1, #cv do
                local current, minimum = tonumber(cv[i]), tonumber(lv[i])

                if current ~= minimum then
                    if current < minimum then
                        return print(('^3An update is available for n-blockresol (current version: %s)\r\n%s^0'):format(currentVersion, response.html_url))
                    else break end
                end
            end

        end, 'GET')
    end)
end
