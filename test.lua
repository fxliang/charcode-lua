local unpack = table.unpack
-- add package path
package.path = package.path .. ';./dist/charcode-lua/?.lua;./charcode-lua/?.lua'

local charcode = require('charcode')
local FilterText = charcode.FilterText
local conv_to_utf = charcode.conv_to_utf
local conv_from_utf = charcode.conv_from_utf

local function test_filtertext(str, cs, ee)
	local info = string.format("FilterText called: text = %s, charsets = %s, is_emoji_enbaled = %s", str, cs, ee)
	print(string.format("%s, result = %s", info, FilterText(str, cs, ee)))
end

local function test_conv(str, charset)
	local ns = conv_from_utf(str, charset)
	local ostr = (conv_to_utf(ns, charset))
	local sta = (str == ostr) and "Pass" or "NG"
	print(string.format("%s test: convert '%s' with %s, conv_to_utf and conv_to_utf, result is '%s'", sta, str, charset, ostr))
end

---[[
-- test FilterText
test_filtertext("🐮逼", 'gbk', true)
test_filtertext("荣罒", 'gb2312', true)
test_filtertext("荣耀", 'gb2312', false)
test_filtertext("荣耀", 'gbk+mac_japanese', false)
test_filtertext("荣罒😀😁", 'gb2312+gbk', true)
test_filtertext("荣罒😀😁", 'gb2312+gbk', false)
test_filtertext("荣罒𤘺😀😁", 'gb2312+gbk', true)
test_filtertext("荣罒𤘺😀😁", 'cjk', true)
test_filtertext("荣罒𤘺😀😁", 'cjk', false)
test_filtertext("中州韻輸入法引擎😀😁", 'cp950+gbk', false)
test_filtertext("中州韻輸入法引擎😀😁", 'utf8', true)
test_filtertext("中州韻輸入法引擎😀😁", 'bigd5', true)
test_filtertext("こんにちは、世界！", 'cp932', false)
test_filtertext("こんにちは、世界！😀😁😂", 'cp932', false)
test_filtertext("こんにちは、世界！😀😁😂", 'mac_japanese', false)
test_filtertext("こんにちは、世界！😀😁😂", 'cp932', true)

-- gbk codes for 中国人
local gbk = {0xd6, 0xd0, 0xb9, 0xfa, 0xc8, 0xcb, 0x61, 0x62, 0x63}
local gbkBytes = string.char(unpack(gbk))
print("convert with cp936")
print("convert by array", conv_to_utf(gbk, 'cp936'))
print("convert by string", conv_to_utf(gbkBytes, 'cp936'))

-- test convertions
test_conv("中国人abc", 'cp936')
test_conv("中國人abc", 'big5')
test_conv("こんにちは、世界！", 'cp932')
test_conv("こんにちは、世界！", 'mac_japanese')
test_conv("즐거운 시간 되세요", 'cp949')
test_conv("즐거운 시간 되세요", 'mac_korean')

local memoryUsage = collectgarbage("count")
print("\nTotal memory usage:", memoryUsage, "KB")
--]]
