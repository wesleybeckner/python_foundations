conda_env := static-site-generation
notebooks := $(wildcard notebooks/*.ipynb) $(wildcard notebooks/**/*.ipynb)
md_pages := $(patsubst notebooks/%.ipynb,docs/%.md,$(notebooks))

build.env: ; conda env create -f environment.yml
build.site: $(md_pages)

clean.env: ; conda remove --name $(conda_env) --all
clean.site: ; rm $(md_pages)

print-%: ; @echo $* is $($*):

docs/%.md: notebooks/%.ipynb
	jupyter nbconvert\
		--to markdown $<\
		--output-dir $(dir $@)
