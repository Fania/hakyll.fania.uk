---
title: Haskell
date: 2017-10-03
head: "<script type='text/javascript' async
      src='https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML'></script>
      <script type='text/x-mathjax-config'>
      MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$']]},
                          TeX:     {extensions: ['color.js'],
                                    Macros:     {RR:    '{\\bf R}',
                                                bold:  ['{\\bf #1}', 1]}
                                  }
                        });
      </script>"
---

# Haskell FAQ



TOC HERE

TOC TEST
--------

## Setup Stuff

### How do I open GHCi?

Just open a terminal window and simply type `ghci` to open the Glasgow Haskell Compiler in interactive mode.

In the computer labs in the Gateway building you need to log into Linux where Haskell is already installed. If you want to install Haskell on your laptop or home computer you can download it [here](https://www.haskell.org/). Alternatively, if you just quickly want to try an expression but don’t have Haskell installed on your computer at home, you can use the interactive prompt on [haskell.org](https://www.haskell.org/) or [tryhaskell.org](http://tryhaskell.org/). There is even an app for iOS devices ([Raskell](http://slidetocode.com/raskell)). **Let me know if you find a good app for Android!**


### What’s the point of `:set +t`?

Setting this will show the type of any value returned. It is optional but useful. You will have to set this every time you restart GHCi. Don’t forget to type the `:` at the start of the expression. In some of the examples throughout the lab sessions you will encounter instructions telling you to type `:s +t` which might not work on your machine. Use `:set +t` instead.

### Setting up your GHCi config file

You may want to setup a config file on your profile which can save you typing out certain commands every time you start a new session. For example you can put the `:set +t` command into this file and you will never have to remember it again.

To do this, open your home folder on Linux and enable the viewing of hidden files. Find the `.ghc` folder. You need to create a new file called `ghci.conf` within that folder. Now, open this file and simply type in `:set +t` and save.

There are various other things you can do with this config file. For example you can change the prompt from `Prelude>` to your name or the Haskell “logo” lambda (`λ`) using this command: `:set prompt "λ>"`.

If you have installed GHC on your laptop or home computer you may have noticed that `:set +t` produces slightly different results than on the Gateway Linux lab machines. This is due to the version you are using.

In the labs (which use version 7.4.1) you would see something like this:

```
> 4 + 6
10
it :: Integer
```

If you installed the newest version of GHC (7.10.3) then you will see this instead:

```
> 4 + 6
10
it :: Num a => a
```

Right now this might not mean much to you, so you can change this setting in your `ghci.conf` file (see above) by adding this command: `:set -XMonomorphismRestriction`. To change it back to what it was before change the command to: `:set -XNoMonomorphismRestriction`.

An example `ghci.conf` file can look like this:

```
:set +t
:set -XMonomorphismRestriction
:set prompt "λ> "
```

### Some other useful commands for GHCi

- `:quit` or `:q` to leave your current GHCi session
- `:! clear` to clear your terminal window within an GHCi session

### Hoogle

Don’t forget you can check what functions do in [Hoogle](https://www.haskell.org/hoogle/?hoogle=floor): floor. For example, you can also search for functions by their type declarations: `String -> Int` [Hoogle: String -> Int](https://www.haskell.org/hoogle/?hoogle=String+-%3E+Int).

### How do I load scripts into GHCi?

Once you have typed a few expressions into a text editor of your choice and saved the file with an `.hs` extension, you can load it into GHCi.

First you need to make sure your terminal prompt is in the right directory. Use the `cd` command to enter the folder where you saved the Haskell script. So, if you called your file `Script101.hs` and saved it in a folder called `CTEC1901` within your home directory, you need to enter the following commands into your terminal prompt: `cd CTEC1901`, then `ghci` and then `:load Script101.hs`.

```
~$ cd CTEC1901
~/CTEC1901$ ghci
Prelude> :load Script101.hs
*Main>
```

- Script names are case sensitive!
- `:reload` or `:r` to reload a script
- `:load` or `:l` to load a script
- You need to be in the correct directory
- `:cd` to change directory within GHCi
- You don’t have to type the file extension `.hs`

### How do I use script files and functions?

Let’s assume you have a script file which contains the following code:

```
add x y = x + y
```

You can call this function in GHCi by loading the script and then typing:

```
add 4 6
```

which should then return:

```
10
it :: Integer
```

Similarly if your file contained the following code:

```
add :: (Int, Int) -> Int
add (x,y) = x + y
```

Then you need to type the following to call the function:

```
add (4,6)
```

Note that the first line in your script `add :: (Int, Int) -> Int` tells you which types of values you need to pass to the function as parameters. In this case the left hand side (before the `::`) tells you that the function is called `add` and the right hand side tells you that the function takes a **tuple** of two Integers `(Int, Int)` as input (before the `->`) and that the output of the function is an `Int` (after the `->`).


## Intro to Expressions

### Div and mod aren’t working?

The expressions ``x `div` y`` and ``x `mod` y`` need **backwards quotes** (left of the ‘1’ key on the keyboard). Note that the above notation is just syntactic sugar for `div x y` and `mod x y` - you can interchange them as you like.

### What do `floor` and `ceiling` do?

`floor x` returns the greatest integer not greater than x and similarly, `ceiling x` returns the least integer not less than x. So `floor 1.4` will return `1` and `ceiling 1.4` will return `2`. This is different from rounding!

### How does `1 + if 2==2 then 3 else 4` work?

The `if` statement automatically takes precedence over the addition:

```
1 + if 2 == 2 then 3 else 4
1 + ( if 2 == 2 then 3 else 4 )
1 + ( if True then 3 else 4 ) 
-- 2 == 2 is True so we enter the `then` statement
1 + ( 3 )
1 + 3
4
```

### How does `(if 2/=2 then reverse else tail) "abc"` work?

Here, the `if` statement determines which function to apply to the string `"abc"`. Since 2 is ***not*** not equal to 2, it’s `False` and the function performs `tail "abc"` and returns `"bc"`.

### Why does `two * length name` produce an error?

In this particular example, the variable `two` is defined as `2` in your script which Haskell interprets as having type `Integer`. You can test this by using the `:type` or `:t` command: 

```
:t two
two :: Integer
```

`name` is defined as a String `"Haskell"` (of type`[Char]`). The function `length` returns an `Int` (see <a href="https://www.haskell.org/hoogle/?hoogle=length">here</a>), so `length name` will return an `7` of type `Int`.<br>Now, the multiplication function `*` requires you to call it with two values of the <strong>same numeric type</strong> (see <a href="https://www.haskell.org/hoogle/?hoogle=%28*%29">here</a>). But we have seen that GHCi interprets the value `two` as an `Integer` rather than an `Int`. Therefore trying to multiply it with  `length name` (which returns an `Int`) GHCi will return an error:

```
Couldn't match expected type `Integer' with actual type `Int'
In the return type of a call of `length'
In the second argument of `(*)', namely `length name'
In the expression: two * length name
```

On the other hand, if you type `2 * length name` into your terminal it will return `14` of type `Int`. That is because manually typing a number into GHCi will default to an `Int`.
One way around this would be to convert the two parts of the evaluation to the same type. For example you can convert an `Int` to an `Integer` by using the `fromIntegral` function (see <a href="https://www.haskell.org/hoogle/?hoogle=fromIntegral">here</a>).

```
two * fromIntegral (length name)
14
it :: Integer
```

Or using the `fromInteger` function (see <a href="https://www.haskell.org/hoogle/?hoogle=fromInteger">here</a>) similarly:

```
fromInteger two * length name
14
it:: Int
```


## Curry, Lamda and Sections
  
See page 64 of David Smallwoods [tutorial file](https://vle.dmu.ac.uk/bbcswebdav/pid-3025849-dt-content-rid-4603139_1/courses/CTEC1901_2015_Y/tut.pdf#page=72). The following examples are taken from [wunki.org](https://wunki.org/posts/2011-10-04-currying-and-partial-application.html)

### Curried and uncurried functions

**Uncurried** function:

```
fooU :: (Int, Int) -> Int
fooU (x, y) = x * y
```

**Curried** function:

```
fooC :: Int -> Int -> Int
fooC x y = x * y
```

The main difference *in very simple terms* is that the function parameters `x` and `y` are given separately in curried functions compared to a tuple in uncurried functions `(x,y)`.

### Anonymous / Lamda functions

Lamda functions are sometimes called anonymous functions because they are not given a name.

```
fooA :: Int -> Int -> Int
fooA x = \y -> x * y
```

Note that the type signature indicates that the function takes 2 input parameters of type Int, even though in the function expression it only lists 1 of them as `x`.

```
> let foo x = \y -> x * y
> foo 2 3
6
```

### Sections / Partial application

> “Partial function application is the ability to take a function of many parameters and apply arguments to some of the parameters to create a new function that needs only the application of the remaining arguments to produce the equivalent of applying all arguments to the original function.” 
> ([Source](http://rosettacode.org/wiki/Partial_function_application) & [Code examples](http://rosettacode.org/wiki/Partial_function_application#Haskell))

Consider the following example:

```
sumTwo x y = x + y
addSeven = sumTwo 7
```

The second line is equivalent to:

```
addSeven = \y -> 7 + y
```

and:

```
addSeven y = sumTwo 7 y
```


