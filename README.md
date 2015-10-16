## Georgios Gousios's homepage

This is the source code to my homepage.

## Build instuctions

To build the home page do the following:

* `gem install jekyll jekyll-scholar`
* `easy_install pygments`

The `jekyll-scholar` plugin is configured to read its publication database
from the `_bibliography/all.bib` file, therefore it must be created prior
to running `jekyll`

## Deploying

```bash
jekyll build
rsync -av _site/* gousiosg@www.gousios.gr:~/gousios.gr/
```

## License

[2-clause BSD](http://www.opensource.org/licenses/bsd-license.php)
