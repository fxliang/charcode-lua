
all:
	mkdir -p dist/charcode-lua
	cp ./lua/charcode.lua ./dist/charcode-lua
	cp -r ./lua/GB2312_to_UNICODE.lua ./dist/charcode-lua
	cp -r ./lua/convert-charsets/convert-charsets/*.lua ./dist/charcode-lua
	cp ./lua/init.lua ./dist/charcode-lua
	cp ./charcode_lua_schema_patch.txt ./dist/
	cp ./LICENSE ./dist/
	cp ./test.lua ./dist/
	cp ./ReadMe.md ./dist/

test:
	lua test.lua

clean:
	rm -rf ./dist
