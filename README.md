## Georgios Gousios's homepage

This is the source code to my homepage.

## Build instuctions

To build the home page do the following:

* Install Ruby 1.9: `rvm install 1.9.3`
* Create the `homepage` gemset: `rvm gemset create homepage`
* `rvm 1.9.3-p392@homepage do gem install jekyll-scholar --version '0.2.0'`
* `easy_install pygments`

The `jekyll-scholar` plugin is configured to read its publication database
from the `_bibliography/all.bib` file, therefore it must be created prior
to running `jekyll`

## Deploying

```bash
rvm 1.9.3@homepage do jekyll
rsync -av _site/* gousiosg@www.gousios.gr:~/public_html/
```

## License

[2-clause BSD](http://www.opensource.org/licenses/bsd-license.php)
