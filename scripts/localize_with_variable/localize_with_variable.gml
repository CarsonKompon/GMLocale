// Feather ignore GM2017

/// This function returns a string based on a key and locale and inserts a variable in place of any instances of "{x}" within the returned string.
///
/// @param {String} _key The unique key of the string in your localization file.
/// @param {String} _var The string to insert in place of "{x}".
/// @param {Real} _locale The locale to localize the string within. Defaults to locale_get()
/// @returns {String}
function localize_with_variable(_key, _var, _locale = global.__gmlocale_localization_current_locale){
	
	var _text = _key;
	
	if(ds_map_exists(global.__gmlocale_localization_text, _key)){
		
		var _newText = global.__gmlocale_localization_data[# 1 + _locale, global.__gmlocale_localization_text[? _key]];
		
		if(_newText != ""){
			
			_text = string_replace_all(_newText, "{x}", _var);
		
		}
		
	}
	
	return _text;
	
}
