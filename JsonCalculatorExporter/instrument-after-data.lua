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
jsonData["item-subgroup"] = {};
jsonData["resource"] = {};
-- Additional export data objects which are added to the item list
jsonItemData = {};
jsonItemData["item"] = 0;
jsonItemData["ammo"] = 0;
jsonItemData["capsule"] = 0;
jsonItemData["gun"] = 0;
jsonItemData["item-with-entity-data"] = 0;
jsonItemData["item-with-label"] = 0;
jsonItemData["item-with-inventory"] = 0;
jsonItemData["item-with-tags"] = 0;
jsonItemData["module"] = 0;
jsonItemData["rail-planner"] = 0;
jsonItemData["spidertron-remote"] = 0;
jsonItemData["tool"] = 0;
jsonItemData["armor"] = 0;
jsonItemData["mining-tool"] = 0;
jsonItemData["repair-tool"] = 0;
jsonItemData["fluid"] = 0; -- Technically not an item, but for calculator purposes it's close enough

-- For every kind of prototype
for type,prototypes in pairs(data.raw) do
    -- Only if we actually want to export this kind/type (predefined)
    if jsonData[type] or jsonItemData[type] then
        -- For every prototype of said kind/type
        for _,prototype in pairs(prototypes) do
            -- Data we'll add to our export object
            curData = {};

            -- Fields needed by every type
            curData.icons = prototype.icons;
            curData.icon = prototype.icon;
            curData.name = prototype.name;
            curData.type = prototype.type;

            -- Field only not present in "item (sub)group" type
            if type ~= "item-group" and type ~= "item-subgroup" then
                curData.subgroup = prototype.subgroup;
            end

            -- Item-related part done. See if this should be added to the item list
            if jsonItemData[type] then
                jsonData["item"][prototype.name] = curData
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

                -- Additional handling for subgroups/icons to take that of results/products in case the recipe does not have one defined itself
                if curData.subgroup == nil then
                    if curData.result ~= nil then
                        -- Try from all item-type sources
                        for itemType,__ in pairs(jsonItemData) do
                            local item = data.raw[itemType][curData.result]
                            if item ~= nil then
                                curData.subgroup = item.subgroup
                            end
                        end
                    else
                        -- Try from all item-type sources
                        for itemType,__ in pairs(jsonItemData) do
                            local item = data.raw[itemType][curData.main_product]
                            if item ~= nil then
                                curData.subgroup = item.subgroup
                            end
                        end
                    end
                end
                if curData.icons == nil and curData.icon == nil then
                    if curData.result ~= nil then
                        -- Try from all item-type sources
                        for itemType,__ in pairs(jsonItemData) do
                            local item = data.raw[itemType][curData.result]
                            if item ~= nil then
                                curData.icons = item.icons
                                curData.icon = item.icon
                            end
                        end
                    else
                        -- Try from all item-type sources
                        for itemType,__ in pairs(jsonItemData) do
                            local item = data.raw[itemType][curData.main_product]
                            if item ~= nil then
                                curData.icons = item.icons
                                curData.icon = item.icon
                            end
                        end
                    end
                end
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
            if type == "item-subgroup" then
                curData.group = prototype.group;
            end
            if type == "fluid" then
                curData.default_temperature = prototype.default_temperature;
                curData.max_temperature = prototype.max_temperature;
                curData.fuel_value = prototype.fuel_value;
                curData.heat_capacity = prototype.heat_capacity;
                -- Make sure that a nil subgroup is properly adjusted to the default
                if curData.subgroup == nil then
                    curData.subgroup = "fluid"
                end
            end
            if type == "resource" then
                curData.category = prototype.category;
                -- Make sure that a nil category is properly adjusted to the default
                if curData.category == nil then
                    curData.category = "basic-solid";
                end
                if prototype.minable == nil then
                    curData.minable = false;
                else
                    curData.minable = true;
                    curData.mining_time = prototype.minable.mining_time;
                    curData.results = prototype.minable.results;
                    curData.result = prototype.minable.result;
                    curData.count = prototype.minable.count;
                    curData.fluid_amount = prototype.minable.fluid_amount;
                    curData.required_fluid = prototype.minable.required_fluid;
                end
            end

            -- Add the constructed data object to our export under the same prototype type, if this wasn't an exclusive item type object
            if jsonData[type] then
                jsonData[type][prototype.name] = curData
            end
        end
    end
end

-- Do the actual "export"
log(json.stringify(jsonData))
