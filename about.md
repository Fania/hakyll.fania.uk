---
title: About
icon: envelope
---

## *Smile and Wave*

<span class="icon fa-envelope"></span>

[Email me here](mailto:me@fania.eu?Subject=fania.uk)

## Posts

$partial("templates/post-list.html")$

[Archive](archive.html)

```
$ hakyll-init my-site

$ ghc --make -threaded site.hs
$ ./site build
$ ./site watch
```

[Local Site](http://localhost:8000/)

0. `./site clean`
1. `./site rebuild` (performs clean and build)
2. `./site watch`
3. `ctrl c`

`deployCommand :: String`  
Here, you can plug in a system command to upload/deploy your site.  
Example:  
`rsync -ave 'ssh -p 2217' _site jaspervdj@jaspervdj.be:hakyll`  
You can execute this by using  
`./site deploy`
