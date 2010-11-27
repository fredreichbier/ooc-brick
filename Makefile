brick/Brick.ooc: gen/constants.ooc gen/brick-api.ooc
	cat gen/constants.ooc gen/brick-api.ooc > brick/Brick.ooc

gen/brick-api.ooc: gen/brick.yaml gen/brick.json
	cd gen; babbisch-ooc brick.yaml > brick-api.ooc
	sed -i 's/^include.*$$/include brick/g' gen/brick-api.ooc

clean:
	rm -f gen/brick-api.ooc brick/Brick.ooc

.phony: clean
