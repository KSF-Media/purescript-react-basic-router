module React.Basic.Router.Types.Foreign where

import Data.Nullable (Nullable)
import React.Basic.Classic (JSX)

type RouteProps jsProps =
  { exact :: Boolean
  , path :: Nullable String
  , render :: jsProps -> JSX
  }
