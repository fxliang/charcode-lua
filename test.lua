local unpack = table.unpack
-- add package path
package.path = package.path .. ';./dist/?.lua'

local charcode = require('charcode')
local FilterText = charcode.FilterText
local conv_to_utf = charcode.conv_to_utf
local conv_from_utf = charcode.conv_from_utf

---[[
-- test FilterText
local str = "荣罒"
local cs = 'gb2312'
local ee = true
print(FilterText(str, cs, ee))
local info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣耀"
cs = 'gb2312'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣耀"
cs = 'gbk+mac_japanese'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣罒😀😁"
cs = 'gb2312+gbk'
ee = true
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣罒😀😁"
cs = 'gb2312+gbk'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣罒𤘺😀😁"
cs = 'gb2312+gbk'
ee = true
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣罒𤘺😀😁"
cs = 'cjk'
ee = true
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "荣罒𤘺😀😁"
cs = 'cjk'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "中州韻輸入法引擎😀😁"
cs = 'cp950+gbk'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "中州韻輸入法引擎😀😁"
cs = 'utf8'
ee = true
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "中州韻輸入法引擎😀😁"
cs = 'bigd5'
ee = true
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "こんにちは、世界！"
cs = 'cp932'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "こんにちは、世界！😀😁😂"
cs = 'cp932'
ee = false
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

str = "こんにちは、世界！😀😁😂"
cs = 'cp932'
ee = true
print(FilterText(str, cs, ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

ee = false
print(FilterText(str, '', ee))
info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
print(info)

-- gbk codes for 中国人
local gbk = {0xd6, 0xd0, 0xb9, 0xfa, 0xc8, 0xcb, 0x61, 0x62, 0x63}
local gbkBytes = string.char(unpack(gbk))

print("convert with cp936")
print("convert by array", conv_to_utf(gbk, 'cp936'))
print("convert by string", conv_to_utf(gbkBytes, 'cp936'))

-- test convertions
local u8str = "中國人abc"
print("convert with cp950")
local ns = conv_from_utf(u8str, 'cp950')
print(conv_to_utf(ns, 'cp950'))

print("convert with big5")
ns = conv_from_utf(u8str, 'big5')
print(conv_to_utf(ns, 'big5'))

local jpstr = "こんにちは、世界！"
print("convert with cp932")
ns = conv_from_utf(jpstr, 'cp932')
print(conv_to_utf(ns, 'cp932'))

print("convert with charset mac_japanese")
ns = conv_from_utf(jpstr, 'mac_japanese')
print(conv_to_utf(ns, 'mac_japanese'))

local kstr = "즐거운 시간 되세요"
print("convert with charset cp949")
ns = conv_from_utf(kstr, 'cp949')
print(conv_to_utf(ns, 'cp949'))

print("convert with charset mac_korean")
ns = conv_from_utf(kstr, 'mac_korean')
print(conv_to_utf(ns, 'mac_korean'))

local memoryUsage = collectgarbage("count")
print("\nTotal memory usage:", memoryUsage, "KB")
--]]
