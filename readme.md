# README

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
