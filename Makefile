.PHONY : build upload-test upload install-test install upgrade-test upgrade update-test update

build:
	python -m build

upload-test:
	twine upload --skip-existing --repository testpypi dist/*

upload:
	twine upload --skip-existing --repository pypi dist/*

install-test:
	pip install --index-url https://test.pypi.org/simple/ --no-deps lumberjack

install:
	pip install lumberjack

upgrade-test:
	pip install -U --index-url https://test.pypi.org/simple/ --no-deps lumberjack

upgrade:
	pip install -U lumberjack

update-test: build upload-test upgrade-test

update: build upload upgrade
