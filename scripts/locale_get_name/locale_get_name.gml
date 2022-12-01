// Feather ignore GM2017

/// This function will return the name of a locale from it's index.
///
/// @param {Real} _locale The index of the locale. Defaults to locale_get()
/// @returns {String}
function locale_get_name(_locale = global.__gmlocale_localization_current_locale){
	
	return global.__gmlocale_localization_locale_names[_locale];
	
}
