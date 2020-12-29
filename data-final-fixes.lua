require("json")

--[[
-- Save copied tables in `copies`, indexed by original table.
function deepcopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
            setmetatable(copy, deepcopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Initial fill of all the objects
rawCopy = deepcopy(data.raw);
jsonData = {}
jsonData.recipe = rawCopy.recipe;
jsonData.item = rawCopy.item;
jsonData.fluid = rawCopy.fluid;
jsonData["assembling-machine"] = rawCopy["assembling-machine"];
jsonData.furnace = rawCopy.furnace;
jsonData["mining-drill"] = rawCopy["mining-drill"];
jsonData["offshore-pump"] = rawCopy["offshore-pump"];
jsonData.module = rawCopy.module;
jsonData["item-group"] = rawCopy["item-group"];

-- Start removing stuff we don't need. Mainly looks for lists/tables to reduce the amount of overall lines the resulting JSON will have.
-- Recipe
for name,recipe in pairs(jsonData.recipe) do
    recipe.crafting_machine_tint = nil;
end

-- Item
for name,item in pairs(jsonData.item) do
    item.dark_background_icons = nil;
    item.dark_background_icon = nil;
    item.flags = nil;
    item.pictures = nil;
    item.place_as_tile = nil;
end

-- Fluid
-- Nothing to do

-- Assembling machine
for name,assemblingMachine in pairs(jsonData["assembling-machine"]) do
    assemblingMachine.energy_source = nil;
    assemblingMachine.animation = nil;
    assemblingMachine.default_recipe_tint = nil;
    assemblingMachine.fluid_boxes = nil;
    assemblingMachine.idle_animation = nil;
    assemblingMachine.shift_animation_waypoints = nil;
    assemblingMachine.status_colors = nil;
    assemblingMachine.working_visualisations = nil;
    assemblingMachine.attack_reaction = nil;
    assemblingMachine.corpse = nil;
    assemblingMachine.damaged_trigger_effect = nil;
    assemblingMachine.dying_explosion = nil;
    assemblingMachine.dying_trigger_effect = nil;
    assemblingMachine.integration_patch = nil;
    assemblingMachine.loot = nil;
    assemblingMachine.repair_sound = nil;
    assemblingMachine.resistances = nil;
    assemblingMachine.additional_pastable_entities = nil;
    assemblingMachine.autoplace = nil;
    assemblingMachine.build_sound = nil;
    assemblingMachine.close_sound = nil;
    assemblingMachine.collision_box = nil;
    assemblingMachine.collision_mask = nil;
    assemblingMachine.created_effect = nil;
    assemblingMachine.created_smoke = nil;
    assemblingMachine.drawing_box = nil;
    assemblingMachine.flags = nil;
    assemblingMachine.hit_visualization_box = nil;
    assemblingMachine.map_generator_bounding_box = nil;
    assemblingMachine.minable = nil;
    assemblingMachine.mined_sound = nil;
    assemblingMachine.mining_sound = nil;
    assemblingMachine.open_sound = nil;
    assemblingMachine.placeable_by = nil;
    assemblingMachine.radius_visualisation_specification = nil;
    assemblingMachine.remains_when_mined = nil;
    assemblingMachine.rotated_sound = nil;
    assemblingMachine.selection_box = nil;
    assemblingMachine.sticker_box = nil;
    assemblingMachine.trigger_target_mask = nil;
    assemblingMachine.vehicle_impact_sound = nil;
    assemblingMachine.water_reflection = nil;
    assemblingMachine.working_sound = nil;
end

-- Furnace
for name,furnace in pairs(jsonData.furnace) do
--    furnace.energy_source = nil;
    furnace.animation = nil;
    furnace.default_recipe_tint = nil;
    furnace.fluid_boxes = nil;
    furnace.idle_animation = nil;
    furnace.shift_animation_waypoints = nil;
    furnace.status_colors = nil;
    furnace.working_visualisations = nil;
    furnace.attack_reaction = nil;
    furnace.corpse = nil;
    furnace.damaged_trigger_effect = nil;
    furnace.dying_explosion = nil;
    furnace.dying_trigger_effect = nil;
    furnace.integration_patch = nil;
    furnace.loot = nil;
    furnace.repair_sound = nil;
    furnace.resistances = nil;
    furnace.additional_pastable_entities = nil;
    furnace.autoplace = nil;
    furnace.build_sound = nil;
    furnace.close_sound = nil;
    furnace.collision_box = nil;
    furnace.collision_mask = nil;
    furnace.created_effect = nil;
    furnace.created_smoke = nil;
    furnace.drawing_box = nil;
    furnace.flags = nil;
    furnace.hit_visualization_box = nil;
    furnace.map_generator_bounding_box = nil;
    furnace.minable = nil;
    furnace.mined_sound = nil;
    furnace.mining_sound = nil;
    furnace.open_sound = nil;
    furnace.placeable_by = nil;
    furnace.radius_visualisation_specification = nil;
    furnace.remains_when_mined = nil;
    furnace.rotated_sound = nil;
    furnace.selection_box = nil;
    furnace.sticker_box = nil;
    furnace.trigger_target_mask = nil;
    furnace.vehicle_impact_sound = nil;
    furnace.water_reflection = nil;
    furnace.working_sound = nil;
end

-- Mining drill
for name,miningDrill in pairs(jsonData["mining-drill"]) do
    miningDrill.energy_source = nil;
    miningDrill.animations = nil;
    miningDrill.base_picture = nil;
    miningDrill.base_render_layer = nil;
    miningDrill.circuit_connector_sprites = nil;
    miningDrill.circuit_wire_connection_points = nil;
    miningDrill.graphics_set = nil;
    miningDrill.input_fluid_box = nil;
    miningDrill.output_fluid_box = nil;
    miningDrill.radius_visualisation_picture = nil;
    miningDrill.storage_slots = nil;
    miningDrill.wet_mining_graphics_set = nil;
    miningDrill.attack_reaction = nil;
    miningDrill.corpse = nil;
    miningDrill.damaged_trigger_effect = nil;
    miningDrill.dying_explosion = nil;
    miningDrill.dying_trigger_effect = nil;
    miningDrill.integration_patch = nil;
    miningDrill.loot = nil;
    miningDrill.repair_sound = nil;
    miningDrill.resistances = nil;
    miningDrill.additional_pastable_entities = nil;
    miningDrill.autoplace = nil;
    miningDrill.build_sound = nil;
    miningDrill.close_sound = nil;
    miningDrill.collision_box = nil;
    miningDrill.collision_mask = nil;
    miningDrill.created_effect = nil;
    miningDrill.created_smoke = nil;
    miningDrill.drawing_box = nil;
    miningDrill.flags = nil;
    miningDrill.hit_visualization_box = nil;
    miningDrill.map_generator_bounding_box = nil;
    miningDrill.minable = nil;
    miningDrill.mined_sound = nil;
    miningDrill.mining_sound = nil;
    miningDrill.open_sound = nil;
    miningDrill.placeable_by = nil;
    miningDrill.radius_visualisation_specification = nil;
    miningDrill.remains_when_mined = nil;
    miningDrill.rotated_sound = nil;
    miningDrill.selection_box = nil;
    miningDrill.sticker_box = nil;
    miningDrill.trigger_target_mask = nil;
    miningDrill.vehicle_impact_sound = nil;
    miningDrill.water_reflection = nil;
    miningDrill.working_sound = nil;
end

-- Offshore pump
for name,offshorePump in pairs(jsonData["offshore-pump"]) do
    offshorePump.fluid_box = nil;
    offshorePump.adjacent_tile_collision_box = nil;
    offshorePump.adjacent_tile_collision_mask = nil;
    offshorePump.adjacent_tile_collision_test = nil;
    offshorePump.center_collision_mask = nil;
    offshorePump.circuit_connector_sprites = nil;
    offshorePump.circuit_wire_connection_points = nil;
    offshorePump.fluid_box_tile_collision_test = nil;
    offshorePump.graphics_set = nil;
    offshorePump.picture = nil;
    offshorePump.placeable_position_visualization = nil;
    offshorePump.attack_reaction = nil;
    offshorePump.corpse = nil;
    offshorePump.damaged_trigger_effect = nil;
    offshorePump.dying_explosion = nil;
    offshorePump.dying_trigger_effect = nil;
    offshorePump.integration_patch = nil;
    offshorePump.loot = nil;
    offshorePump.repair_sound = nil;
    offshorePump.resistances = nil;
    offshorePump.additional_pastable_entities = nil;
    offshorePump.autoplace = nil;
    offshorePump.build_sound = nil;
    offshorePump.close_sound = nil;
    offshorePump.collision_box = nil;
    offshorePump.collision_mask = nil;
    offshorePump.created_effect = nil;
    offshorePump.created_smoke = nil;
    offshorePump.drawing_box = nil;
    offshorePump.flags = nil;
    offshorePump.hit_visualization_box = nil;
    offshorePump.map_generator_bounding_box = nil;
    offshorePump.minable = nil;
    offshorePump.mined_sound = nil;
    offshorePump.mining_sound = nil;
    offshorePump.open_sound = nil;
    offshorePump.placeable_by = nil;
    offshorePump.radius_visualisation_specification = nil;
    offshorePump.remains_when_mined = nil;
    offshorePump.rotated_sound = nil;
    offshorePump.selection_box = nil;
    offshorePump.sticker_box = nil;
    offshorePump.trigger_target_mask = nil;
    offshorePump.vehicle_impact_sound = nil;
    offshorePump.water_reflection = nil;
    offshorePump.working_sound = nil;
end

-- Module
for name,module in pairs(jsonData.module) do
    module.beacon_tint = nil;
    module.dark_background_icons = nil;
    module.dark_background_icon = nil;
    module.flags = nil;
    module.pictures = nil;
    module.place_as_tile = nil;
end

-- Item group
-- Nothing to do
--]]

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

for type,prototypes in pairs(data.raw) do
    for _,prototype in pairs(prototypes) do
        if availableTypes[type] then
            curData = {};
            -- Needed by everybody
            curData.icons = prototype.icons;
            curData.icon = prototype.icon;
            curData.name = prototype.name;
            curData.type = prototype.type;
            -- Only not needed in item group
            if type ~= "item-group" then
                curData.subgroup = prototype.subgroup;
            end
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
            jsonData[type][prototype.name] = curData
        end
    end
end

log(json.stringify(jsonData))
