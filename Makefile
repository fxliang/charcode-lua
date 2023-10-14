
all:
	mkdir dist
	cp ./lua/charcode.lua ./dist
	cp -r ./lua/convert-charsets/convert-charsets/*.lua ./dist/
	cp -r ./lua/GB2312_to_UNICODE.lua ./dist/

test:
	lua test.lua

clean:
	rm -rf ./dist
