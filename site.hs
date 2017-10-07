--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid
import           Hakyll
import           Text.Pandoc

--------------------------------------------------------------------------------

main :: IO ()
main = hakyll $ do

    -- Static folder
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler
    
    -- CSS
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    -- Index
    create ["index.html"] $ do
        route idRoute
        compile $ do
            posts <- fmap (take 6) . recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) <>
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/index.html" indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    -- About and Haskell pages with TOC
    match (fromList ["haskell.md"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompilerWith defaultHakyllReaderOptions withToc
            >>= loadAndApplyTemplate "templates/withTOC.html" defaultContext
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- Other pages without TOC
    match (fromList ["about.md", "images.md", "links.md", "contact.md"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- Tags
    tags <- buildTags "posts/*" (fromCapture "tags/*.html")

    -- Tag pages
    tagsRules tags $ \tag pattern -> do
        let title = "Posts tagged \"" ++ tag ++ "\""
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll pattern
            let ctx = constField "title" title <>
                      listField "posts" postCtx (return posts) <>
                      defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/tag.html" ctx
                >>= loadAndApplyTemplate "templates/default.html" ctx
                >>= relativizeUrls

    -- Individual posts
    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
            >>= relativizeUrls

    -- Posts main page
    create ["stuff.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) <>
                    constField "title" "Stuff"               <>
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/stuff.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    -- Individual solutions
    match "solutions/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    -- Solutions main page
    create ["cheats.html"] $ do
        route idRoute
        compile $ do
            solutions <- recentFirst =<< loadAll "solutions/*"
            let archiveCtx =
                    listField "solutions" postCtx (return solutions) <>
                    constField "title" "Solutions Log"                    <>
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/cheats.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

    -- Templates
    match "templates/*" $ compile templateCompiler
  where
    withToc = defaultHakyllWriterOptions
        { writerTableOfContents = True
        , writerTOCDepth        = 2
        , writerTemplate        = Just "$toc$\n$body$"
        , writerHtml5           = True
        , writerHighlight       = True
        }


--------------------------------------------------------------------------------

-- indexCtx :: Context String
-- indexCtx =
--     listField "posts" postCtx (return posts) <>
--     constField "title" "Home"                <>
--     defaultContext

-- archiveCtx :: Context String
-- archiveCtx =
--     listField "posts" postCtx (return posts) <>
--     constField "title" "Stuff"               <>
--     defaultContext
--     where
--         posts = recentFirst =<< loadAll "posts/*"

postCtx :: Context String
postCtx =
    dateField "date" "%d.%m.%0Y" <>
    -- mainImgCtx <>
    defaultContext

postCtxWithTags :: Tags -> Context String
postCtxWithTags tags = tagsField "tags" tags <> postCtx

-- solutionsCtx :: Context String
-- solutionsCtx =
--     listField "solutions" postCtx (return solutions) <>
--     constField "title" "Solutions Log"                    <>
--     defaultContext
--     where
--         solutions = recentFirst =<< loadAll "solutions/*"

-- mainImgCtx :: Context String 
-- mainImgCtx = 
--   field "cover" $ \item -> do
--       identifier <- getUnderlying 
--       metadata <- getMetadata (itemIdentifier item)
--       return $ fromMaybe "blank.png" $ M.lookup "cover" metadata
--------------------------------------------------------------------------------

-- faniaconfig :: Configuration
-- faniaconfig = Configuration
--     { destinationDirectory = "docs"
--     , storeDirectory       = "_cache"
--     , tmpDirectory         = "_cache/tmp"
--     , providerDirectory    = "."
--     , ignoreFile           = ignoreFile'
--     , deployCommand        = "echo 'No deploy command specified' && exit 1"
--     , deploySite           = system . deployCommand
--     , inMemoryCache        = True
--     , previewHost          = "127.0.0.1"
--     , previewPort          = 8000
--     }
--   where
--     ignoreFile' path
--         | "."    `isPrefixOf` fileName = True
--         | "#"    `isPrefixOf` fileName = True
--         | "~"    `isSuffixOf` fileName = True
--         | ".swp" `isSuffixOf` fileName = True
--         | otherwise                    = False
--       where
--         fileName = takeFileName path