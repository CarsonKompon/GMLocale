// Feather ignore GM2017

/// This function returns a string based on a key and locale and inserts a variables from a struct.
/// For example, the struct {prof: "Dr.", name: "Alan"} would populate the string "Hello, I am {prof} {name}".
///
/// @param {String} _key The unique key of the string in your localization file.
/// @param {Struct} _struct The struct containing variables to insert.
/// @param {Real} _locale The locale to localize the string within. Defaults to locale_get()
/// @returns {String}
function localize_with_variables(_key, _struct, _locale = global.__gmlocale_localization_current_locale){
	
	var _text = _key;
	
	if(ds_map_exists(global.__gmlocale_localization_text, _key)){
		
		var _newText = global.__gmlocale_localization_data[# 1 + _locale, global.__gmlocale_localization_text[? _key]];
		
		if(_newText != ""){
			
			_text = _newText;
			
			var _structNames = variable_struct_get_names(_struct);
			var _structLength = variable_struct_names_count(_struct);
			
			for(var i=0; i<_structLength; i++){
				_text = string_replace_all(_text, "{" + _structNames[i] + "}", variable_struct_get(_struct, _structNames[i]));	
			}
		
		}
		
	}
	
	return _text;
	
}
