// Feather ignore GM2017

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_ltgrey);

// Hello text that rotates independently from the current locale
draw_text_transformed(128, 64, helloArray[helloIndex], 2, 2, 0);

draw_set_color(c_white);

// The name of the current locale
draw_text(128, 152, locale_get_name() + ":");

// "Confirm" text that's based on the current locale
draw_text(128, 192, localize("button_confirm"));

// Health points (also based on current locale but use a variable)
draw_text(128, 224, localize_with_variable("health_points", healthPoints));
