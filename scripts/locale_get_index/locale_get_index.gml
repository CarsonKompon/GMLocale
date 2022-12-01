// Feather ignore GM2017

/// This function will return index of a locale from the name. Returns -1 if invalid.
///
/// @param {String} _name The name of the locale.
/// @returns {Real}
function locale_get_index(_name){
	
	for(var i=0; i<global.__gmlocale_localization_locale_count; i++){
		if(global.__gmlocale_localization_locale_names[i] == _name) return i;	
	}
	
	return -1;
	
}
