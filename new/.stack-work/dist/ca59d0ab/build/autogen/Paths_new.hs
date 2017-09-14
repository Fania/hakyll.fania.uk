{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_new (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Documents\\GitHub\\hakyll.fania.uk\\new\\.stack-work\\install\\495683e6\\bin"
libdir     = "D:\\Documents\\GitHub\\hakyll.fania.uk\\new\\.stack-work\\install\\495683e6\\lib\\x86_64-windows-ghc-8.0.2\\new-0.1.0.0"
dynlibdir  = "D:\\Documents\\GitHub\\hakyll.fania.uk\\new\\.stack-work\\install\\495683e6\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "D:\\Documents\\GitHub\\hakyll.fania.uk\\new\\.stack-work\\install\\495683e6\\share\\x86_64-windows-ghc-8.0.2\\new-0.1.0.0"
libexecdir = "D:\\Documents\\GitHub\\hakyll.fania.uk\\new\\.stack-work\\install\\495683e6\\libexec"
sysconfdir = "D:\\Documents\\GitHub\\hakyll.fania.uk\\new\\.stack-work\\install\\495683e6\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "new_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "new_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "new_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "new_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "new_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "new_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
