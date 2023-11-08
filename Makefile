.PHONY: list

list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

py:
	# read-pos adds object start and end markers
	kaitai-struct-compiler --read-pos -t python eventio_kaitai.ksy

test:
	pytest
