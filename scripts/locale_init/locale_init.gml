// Feather ignore GM2017

/// This function will initialize the localization functionality of GMLocale. You only want to call this one time at the beginning of the game.
///
/// @param {String} _file The name of the localization file to load (as a string).
/// @param {Array<Real>} _columnsToIgnore An array of column indexes that should be skipped when reading the localization file. This is useful if you have additional column(s) that only serve as comments or explanations.
/// @param {Function} _deobfuscationFunction The function used to deobfuscate the localization file. This is useful if the file is encrypted and you wish to decrypt it on load. Defaults to function(_file){ return load_csv(_file); }
function locale_init(_file, _columnsToIgnore = [], _deobfuscationFunction = function(_fl){return load_csv(_fl)}){
	
	global.__gmlocale_localization_file = _file;
	global.__gmlocale_localization_data = _deobfuscationFunction(_file);
	global.__gmlocale_localization_text = ds_map_create();
	global.__gmlocale_localization_locale_names = [];
	global.__gmlocale_localization_locale_count = 0;
	global.__gmlocale_localization_current_locale = 0;
	
	if(ds_exists(global.__gmlocale_localization_data, ds_type_grid)){
		
		var _dataWidth = ds_grid_width(global.__gmlocale_localization_data);
		var _dataHeight = ds_grid_height(global.__gmlocale_localization_data);
		
		// This starts at 1 to skip cell A1
		var _columnsToIgnoreCount = array_length(_columnsToIgnore);
		for(var i=1; i<_dataWidth; i++){
			
			var _getData = true;
			for(var j=0; j<_columnsToIgnoreCount; j++){
				if(_columnsToIgnore[j] == i){
					_getData = false;
					break;
				}
			}
			
			if(_getData){
				var _localeName = string(global.__gmlocale_localization_data[# i, 0]);
			
				// Filter out anything in square brackets may have been appended
				var _bracketPos = string_pos("[", _localeName);
				if(_bracketPos > 0){
					_localeName = string_copy(_localeName, 1, _bracketPos-2);
				}
			
				array_push(global.__gmlocale_localization_locale_names, _localeName);
				global.__gmlocale_localization_locale_count++;
			}
			
		}
		
		// This starts at 1 to skip the header row
		for(var i=1; i<_dataHeight; i++){
			ds_map_add(global.__gmlocale_localization_text, global.__gmlocale_localization_data[# 0, i], i);
		}
		
	}
	
}
