local vanillaClamp = settings.startup["aai-boost-clamp-to-vanilla"].value
local sizes = {
    ["strongboxes"]: vanillaClamp and 192 or 256,
    ["storehouses"]: vanillaClamp and 768 or 1280,
    ["warehouses"]: vanillaClamp and 1728 or 3456
}
local containers = {
    ["strongboxes"]: {
        "aai-strongbox",
        "aai-strongbox-passive-provider",
        "aai-strongbox-active-provider",
        "aai-strongbox-storage",
        "aai-strongbox-buffer",
        "aai-strongbox-requester"
    },
    ["storehouses"]: {
       "aai-strongbox",
        "aai-strongbox-passive-provider",
        "aai-strongbox-active-provider",
        "aai-strongbox-storage",
        "aai-strongbox-buffer",
        "aai-strongbox-requester"
    },
    ["warehouses"]: {
        "aai-strongbox",
        "aai-strongbox-passive-provider",
        "aai-strongbox-active-provider",
        "aai-strongbox-storage",
        "aai-strongbox-buffer",
        "aai-strongbox-requester"
    }
}
for category, containerNames in pairs(containers) do
    local size = sizes[category]
    if size then
        for _, containerName in ipairs(containerNames) do
            if data.raw.container[containerName] then
                data.raw.container[containerName].inventory_size = size
            end
            if data.raw["logistic-container"][containerName] then
                data.raw["logistic-container"][containerName].inventory_size = size
            end
        end
    end
end
