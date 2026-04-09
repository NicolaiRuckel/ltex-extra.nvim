.PHONY: local localtest locallint test

local: localtest locallint

localtest:
	echo "===> Local Testing"
	nvim --headless -c "PlenaryBustedDirectory test/"

locallint:
	selene --display-style=quiet .

test:
	echo "===> Testing"
	nvim --headless --noplugin -u test/minimal_init.lua \
        -c "PlenaryBustedDirectory test/ {minimal_init = './test/minimal_init.lua'}"


clean:
	echo "===> Cleaning"
	rm /tmp/lua_*
