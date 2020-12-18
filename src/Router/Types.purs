module React.Basic.Router.Types where

import Data.Nullable (Nullable)
import Foreign (Foreign)
import React.Basic.Classic (JSX)

type JSRouterProps a = { location :: Location a }

type Match =
  { params :: Foreign
  , isExact :: Boolean
  , path :: String
  , url :: String
  }

type Location state =
  { key :: String
  , pathname :: String
  , search :: String
  , hash :: String
  , state :: Nullable state
  }

type BaseRedirectProps state =
  ( to   :: To state
  , from :: String
  , push :: Boolean
  )

type RedirectProps state = Record (BaseRedirectProps state)

type DelayedRedirectProps state = { delay :: Number | BaseRedirectProps state }

type To state_ =
  { pathname :: String
  , state :: state_
  }

type SwitchProps = { children :: Array JSX }

type RouteProps jsProps =
  { exact :: Boolean
  , path :: Nullable String
  , render :: jsProps -> JSX
  }

type LinkProps props state = { to :: To state, children :: Array JSX, className :: String }