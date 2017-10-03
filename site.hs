--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid
import           Hakyll
-- import           Data.Map as M (lookup)
-- import           Data.Maybe
import qualified Data.Set as S
import           Hakyll.Web.Pandoc
import           Text.Pandoc.Options

--------------------------------------------------------------------------------

myPandocCompiler = 
    let writerOps = defaultHakyllWriterOptions
                    { writerTableOfContents = True
                    -- , writerTemplate = "$if(toc)$\n$toc$\n$endif$\n$body$"
                    , writerTemplate = Just "$toc$\n$body$"
                    , writerHighlight  = True
                    -- , writerTOCDepth = 3
                    -- , writerHighlightStyle = Style,
                    , writerExtensions = S.insert Ext_literate_haskell (writerExtensions def)
                    -- , writerHtml5 = True
                    } 
    in pandocCompilerWith defaultHakyllReaderOptions writerOps

main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- fmap (take 6) . recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) <>
                    constField "title" "Home"                <>
                    defaultContext
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match (fromList ["about.md", "images.md", "links.md", "haskell.md", "contact.md"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "haskell.md" $ do
        route   $ setExtension "html"
        compile $ myPandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls


    tags <- buildTags "posts/*" (fromCapture "tags/*.html")

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

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
            >>= relativizeUrls

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

    -- create ["haskell.html"] $ do
    --     route idRoute
    --     compile $ do
    --         posts <- recentFirst =<< loadAll "posts/*"
    --         let archiveCtx =
    --                 listField "posts" postCtx (return posts) <>
    --                 constField "title" "Stuff"               <>
    --                 defaultContext
    --         makeItem ""
    --             >>= loadAndApplyTemplate "templates/maths.html" archiveCtx
    --             -- >>= loadAndApplyTemplate "templates/default.html" archiveCtx
    --             >>= relativizeUrls

    match "solutions/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

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

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%d.%m.%0Y" <>
    -- mainImgCtx <>
    defaultContext

postCtxWithTags :: Tags -> Context String
postCtxWithTags tags = tagsField "tags" tags <> postCtx

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