require("json")

-- Define export data object
jsonData = {};
jsonData["recipe"] = {};
jsonData["item"] = {};
jsonData["fluid"] = {};
jsonData["assembling-machine"] = {};
jsonData["furnace"] = {};
jsonData["mining-drill"] = {};
jsonData["offshore-pump"] = {};
jsonData["module"] = {};
jsonData["item-group"] = {};

-- Define export types we "support". Essentially identical to above only with true as value.
availableTypes = {};
availableTypes["recipe"] = true;
availableTypes["item"] = true;
availableTypes["fluid"] = true;
availableTypes["assembling-machine"] = true;
availableTypes["furnace"] = true;
availableTypes["mining-drill"] = true;
availableTypes["offshore-pump"] = true;
availableTypes["module"] = true;
availableTypes["item-group"] = true;

-- For every kind of prototype
for type,prototypes in pairs(data.raw) do
    -- Only if we actually want to export this kind/type
    if availableTypes[type] then
        -- For every prototype of said kind/type
        for _,prototype in pairs(prototypes) do
            -- Data we'll add to our export object
            curData = {};

            -- Fields needed by every type
            curData.icons = prototype.icons;
            curData.icon = prototype.icon;
            curData.name = prototype.name;
            curData.type = prototype.type;

            -- Field only not present in "item group" type
            if type ~= "item-group" then
                curData.subgroup = prototype.subgroup;
            end

            -- Check and add fields for every other type in an inclusive manner
            -- Switches seem weird in LUA, so opted not to use that...
            if type == "recipe" then
                curData.ingredients = prototype.ingredients;
                curData.category = prototype.category;
                curData.enabled = prototype.enabled;
                curData.energy_required = prototype.energy_required;
                curData.expensive = prototype.expensive;
                curData.main_product = prototype.main_product;
                curData.normal = prototype.normal;
                curData.result = prototype.result;
                curData.result_count = prototype.result_count;
                curData.results = prototype.results;
            end
            if type == "assembling-machine" or type == "furnace" then
                -- Fields not relevant for "furnace" type
                if type == "assembling-machine" then
                    curData.ingredient_count = prototype.ingredient_count;
                end
                curData.crafting_categories = prototype.crafting_categories;
                curData.crafting_speed = prototype.crafting_speed;
                curData.allowed_effects = prototype.allowed_effects;
                curData.base_productivity = prototype.base_productivity;
                curData.module_specification = prototype.module_specification;
            end
            if type == "mining-drill" then
                curData.mining_speed = prototype.mining_speed;
                curData.resource_categories = prototype.resource_categories;
                curData.allowed_effects = prototype.allowed_effects;
                curData.base_productivity = prototype.base_productivity;
                curData.module_specification = prototype.module_specification;
            end
            if type == "offshore-pump" then
                curData.fluid = prototype.fluid;
                curData.pumping_speed = prototype.pumping_speed;
            end
            if type == "module" then
                curData.category = prototype.category;
                curData.effect = prototype.effect;
                curData.tier = prototype.tier;
                curData.limitation = prototype.limitation;
            end

            -- Add the constructed data object to our export under the same prototype type
            jsonData[type][prototype.name] = curData
        end
    end
end

-- Do the actual "export"
log(json.stringify(jsonData))
