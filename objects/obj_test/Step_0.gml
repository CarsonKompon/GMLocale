// Feather ignore GM2017

if(keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))){
	var _locale = clamp(locale_get() - 1, 0, locale_get_count()-1);
	locale_set(_locale);
}

if(keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))){
	var _locale = clamp(locale_get() + 1, 0, locale_get_count()-1);
	locale_set(_locale);
}

helloTimer -= delta_time / 1000000;
if(helloTimer <= 0){
	helloTimer = helloTime;
	helloIndex++;
	if(helloIndex >= array_length(helloArray)) helloIndex = 0;
}