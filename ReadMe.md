filter string by charsets with pure lua, with converter-charsets tables, add one GB2312 table

license with GPL v2

3 functions return 

```lua
--[[
--  README
--  conv_from_utf is for making native string from utf-8, with charset defined
--  conv_to_utf   is for making utf8 string from native string, with charset defined
--  FilterText    is for checking if text all in charsets defined, '+' to make more than one charset
--  charsets supported list in normalize_charset_name function, charset_names, case insensitive
--  GBK alias to CP936, BIG5 alias to CP950, UTF8 alias to UTF_8
--]]

return {
  FilterText = FilterText,
  conv_to_utf = native_string_to_utf8,
  conv_from_utf = native_string_from_utf8
}
```

to use it, you need to add the script_path to package.path, like it in test.lua

```lua
package.path = package.path .. ';script_path/?.lua'
local charcode = require('charcode')
local FilterText = charcode.FilterText
local conv_to_utf = charcode.conv_to_utf
local conv_from_utf = charcode.conv_from_utf
```

to make dist, just run in linux ` make clean && make && make test `
to use with rime, 
- run `make clean && make && make && test`
- copy `dist/charcode-lua` to `path_to_rime_user_dir/lua`
- patch lines in `charcode_lua_schema_patch.txt` to your schema custom file
- deploy your schema, and have fun
