{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.Wai (responseLBS, pathInfo, Application)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)

main :: IO ()
main = do
    let port = 3000
    putStrLn $ "Listening on port " <> show port
    run port app

app :: Application
app req respond =
    case pathInfo req of
        ["hello"] ->
          respond $ responseLBS status200 [(hContentType, "text/plain")] "hello world!"
        _ ->
          respond $ responseLBS status200 [(hContentType, "text/plain")] "Not Found"
