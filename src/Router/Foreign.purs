module React.Basic.Router.Foreign where

import Data.Function.Uncurried (Fn0, runFn0)
import Data.Nullable (Nullable)
import Foreign (Foreign)
import React.Basic (JSX, ReactComponent)

foreign import route_ :: forall p. Fn0 (ReactComponent (RouteProps p))
foreign import switch_ :: Fn0 (ReactComponent SwitchProps)
foreign import link_ :: forall p state. Fn0 (ReactComponent (LinkProps p state))
foreign import redirect_ :: forall state. Fn0 (ReactComponent (RedirectProps state))

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

type RedirectProps state =
  { to   :: To state
  , from :: String
  , push :: Boolean
  }

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

route :: forall props. ReactComponent (RouteProps props)
route = runFn0 route_

switch :: ReactComponent SwitchProps
switch = runFn0 switch_

link :: forall props state. ReactComponent (LinkProps props state)
link = runFn0 link_

redirect :: forall state. ReactComponent (RedirectProps state)
redirect = runFn0 redirect_