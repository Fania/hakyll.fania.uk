# README


https://jaspervdj.be/hakyll/tutorials/01-installation.html





## Recompiling

```stack exec site build```
```stack exec site clean```
```stack exec site rebuild```
```stack exec site watch```

If you made changes to site.hs, you need to recompile site.hs followed by a rebuild:

```
stack build
stack exec site rebuild
```


## BUILDING THE EXAMPLE SITE

Apart from the main Hakyll library, the cabal package also provides you with an executable hakyll-init to create an example site. This is an easy way to get started:

```$ hakyll-init my-site```
This creates a folder my-site in the current directory, with some example content and a generic configuration.

If hakyll-init is not found, you should make sure your stack bin path (usually $HOME/.local/bin) is in your $PATH. You can check your stack local bin path by running stack path --local-bin.

The file site.hs holds the configuration of your site, as an executable haskell program. We can compile and run it like this:

```
$ cd my-site
$ stack init  # creates stack.yaml file based on my-site.cabal
$ stack build
$ stack exec site build
```

If you installed hakyll with a preview server (this is the default), you can now use

```$ stack exec site watch```
and have a look at your site at http://localhost:8000/.









## Setup

```
$ hakyll-init my-site
$ ghc --make -threaded site.hs
$ ./site build
$ ./site watch
```

[http://localhost:8000/](http://localhost:8000/)

`./site clean`
`./site rebuild` <!-- (performs clean and build) -->
`./site watch`
`ctrl c`

## Deploying
`rsync -ave 'ssh -p 2217' _site jaspervdj@jaspervdj.be:hakyll`
`./site deploy`
