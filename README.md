Simple exporter mod which I use for my calculator.

# Mod description
Gathers set amount of data during data-final-fixes phase, allowing it to also retrieve icon paths.
Currently gathers set bits of data regarding:
* Recipes
* Items
* Fluids
* Assembling machines
* Furnaces
* Mining drills
* Offshore pumps
* Modules
* Item (sub)groups

The JSON export is contained in Factorio's log, so you'll still need to automate some form of extraction from there.
Not relevant for data in this export (as of time of writing), but some values in `data.raw` use infinity. The JSON parses used converts this to `(-)inf` as a value, which is invalid JSON. Make sure to perform a simple replace on this to something sensible for your usecase, eg. `0` or `"inf"`.

# Calculator
This tool is (going to be) used in an Angular-based calculator. Both a web (pure) and desktop (Electron) version exist.

As I couldn't figure out how to actually run the lua scripts through JS/TS, I opted to use this approach instead.

Web version is discontinued (for now) since I simply couldn't be bothered having to download the mod zips (and either download the base game or include base game icons) and unzip and handle all the icons.
* Web version: https://github.com/dennisfokker/FactorioCalculator
* Desktop version: https://github.com/dennisfokker/FactorioCalculatorElectron

# Contributing
There's only a single file you'll really want to edit: `data-final-fixes.lua`. All this file does is read `data.raw`, take out the relevant information to a new table and log the parsed JSON.

Given the simplicity of the code (go over all the prototypes, filter and copy values X,Y,Z to our own variable) any developer, regardless of language preference, should be able to add additional required data.

When suggesting changes, make sure *not* to change the structure, that way Factorio's prototype documentation can be used for reference instead of having to maintain a separate one.

If you intention is to extend the featureset of this mod and use it for your own tools, feel free to either fork and re-upload under a properly named different mod entry, or making a pull request.

Ideally all data to-be-exported should be an easily configurable setting somehow (no code of conduct for that yet). For now, if it doesn't add too much data (aka, mostly adding small fields of already exported prototypes or small new prototypes such as groups) it's fine to just add as-is.
