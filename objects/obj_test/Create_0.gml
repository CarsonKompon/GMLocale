// Feather ignore GM2017

locale_init("locale.csv");

helloArray = [];
helloIndex = 0;
helloTimer = 0;
helloTime = 2;

var _localeCount = locale_get_count();
for(var i=0; i<_localeCount; i++){
	array_push(helloArray, localize("greeting_hello", i));
}

draw_set_font(fnt_test);