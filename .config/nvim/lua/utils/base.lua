local function contains (arr, val)
    for _, value in ipairs(arr) do
        if value == val then
            return true
        end
    end
    return false
end

return {
  contains = contains,
}
