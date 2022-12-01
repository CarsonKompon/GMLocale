// Feather ignore GM2017

/// This function returns a string based on a key and locale.
///
/// @param {String} _key The unique key of the string in your localization file.
/// @param {Real} _locale The locale to localize the string within. Defaults to locale_get()
/// @returns {String}
function localize(_key, _locale = global.__gmlocale_localization_current_locale){
	
	var _text = _key;
	
	if(ds_map_exists(global.__gmlocale_localization_text, _key)){
		
		var _newText = global.__gmlocale_localization_data[# 1 + _locale, global.__gmlocale_localization_text[? _key]];
		
		if(_newText != ""){
			
			_text = _newText;
		
		}
		
	}
	
	return _text;
	
}
