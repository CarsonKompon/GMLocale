# GMLocale

*A super lightweight and easy-to-use localization library for GameMaker, written in GML. Works for GameMaker 2.3+*

## Getting Started

Go to the [releases](https://github.com/CarsonKompon/GMLocale/releases) and download the latest `.yymps` file.

You can then drag the downloaded file into your project, or select `Tools > Import Local Package` from the toolbar at the top of GameMaker.
Then find and select the downloaded file and import all from there.

## Localization CSV Layout

Here's an example as to how your localization file should be laid out (before encryption if you are using it)

|  | English | Italiano |
| :--- | :--- | :--- |
| text_test | This is test dialogue. | Questo è il dialogo test. |
| hud_test | Health: {x} | Punti Ferita: {x} |

---

## locale_init
Initializes GMLocale and loads the localization file into memory. 

#### Syntax
```js
locale_init(_file, [_deobfuscationFunction]);
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `_file` | String | The file to load (should be a csv, but can be parsed however you'd like through the next parameter) |
| `[_deobfuscationFunction]` | Function | The function used to deobfuscate the localization file. This is useful if the file is encrypted and you wish to decrypt it on load. Defaults to `function(_file){ return load_csv(_file); }` |

#### Returns
```js
None
```

#### Example
```js
locale_init("locale.csv");
```
The above code will load the `locale.csv` file to be used for localization functions.

---

## localize
Returns a localized string based on a key and locale.

#### Syntax
```js
localize(_key, [_locale]);
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `_key` | String | The unique key of the string in your localization file. |
| `[_locale]` | Real | The locale index to localize the string within. Defaults to `locale_get()` |

#### Returns
```js
String
```

#### Example
```js
var _greeting = localize("text_greeting");
```
The above code will find the string associated with the `"text_greeting"` key under the current locale.

---

## localize_with_variable
Returns a localized string based on a key and locale and inserts a variable in place of any instance of "{x}" within the returned string.

#### Syntax
```js
localize_with_variable(_key, _var, [_locale]);
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `_key` | String | The unique key of the string in your localization file. |
| `_var` | String | The string to insert in place of "{x}". |
| `[_locale]` | Real | The locale index to localize the string within. Defaults to `locale_get()` |

#### Returns
```js
String
```

#### Example
```js
// "hud_health" - "HP: {x}"
var _health = localize_with_variable("hud_health", string(global.hp));
```
The above code will get the localized string for `"hud_health"` and replace all instances of `"{x}"` with `global.hp` as a string.

---

## localize_with_variables
Returns a localized string based on a key and locale and inserts variables in the string from a struct.

#### Syntax
```js
localize_with_variables(_key, _struct, [_locale]);
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `_key` | String | The unique key of the string in your localization file. |
| `_struct` | Struct | The struct containing variables to insert into the string. |
| `[_locale]` | Real | The locale index to localize the string within. Defaults to `locale_get()` |

#### Returns
```js
String
```

#### Example
```js
// "text_action" - "{person} is {action}"
var _log = localize_with_variable("text_action", {person: "Carson", action: "Coding");
```
The above code will get the localized string for `"text_action"` and replace all instances of `"{person}"` with `"Carson"` and `"{action}"` with `"Coding"`.

---

## locale_get
Returns the index of the current locale.

#### Syntax
```js
locale_get()
```

#### Returns
```js
Real
```

#### Example
```js
var _locale = locale_get();
locale_set(_locale + 1);
```
The above code will set the locale to the current locale index + 1.

---

## locale_set
Sets the current locale from it's index.

#### Syntax
```js
locale_set(_index);
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `_index` | Real | The index of the locale. |

#### Returns
```js
None
```

#### Example
```js
var _locale = locale_get();
locale_set(_locale + 1);
```
The above code will set the locale to the current locale index + 1.

---

## locale_get_name
This function will return the name of a locale from it's index.

#### Syntax
```js
locale_get_name([_locale])
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `[_locale]` | Real | The locale index to localize the string within. Defaults to `locale_get()` |

#### Returns
```js
String
```

#### Example
```js
var _localeName = locale_get_name();
```
The above code will get the name of the current locale.

---

## locale_get_index
Returns the index of a locale given it's name. Returns `-1` if invalid.

#### Syntax
```js
locale_get_index(_name);
```

| Argument | Type | Description |
| :--- | :---: | :--- |
| `_name` | String | The name of the locale. |

#### Returns
```js
Real
```

#### Example
```js
var _englishIndex = locale_get_index("English");
```
The above code will get the index for the locale `"English"`.

---

## locale_get_locales
Returns an array of strings containing the names of all loaded locales.

#### Syntax
```js
locale_get_locales();
```

#### Returns
```js
Array<String>
```

#### Example
```js
var _locales = locale_get_locales();
for(var i=0; i<array_length(_locales); i++){
  show_debug_message(_locales[i]);
}
```
The above code will get the names of all loaded locales and print them to the console.

---

## locale_get_count
Returns the count of all loaded locales.

#### Syntax
```js
locale_get_count();
```

#### Returns
```js
Real
```

#### Example
```js
var _locale = locale_get();
var _localeCount = locale_get_count();
_locale++;
if(_locale >= _localeCount) _locale = 0;
locale_set(_locale);
```
The above code will try to set the locale to the next index, but will loop back to `0` if the new locale is greater than the count.









