local table2 = {}

function table2.find(t, value)
    for i, v in ipairs(t) do
        if v == value then
            return i
        end
    end

    return nil
end

return table2