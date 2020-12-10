module React.Basic.Router.Foreign where

import Data.Function.Uncurried (Fn0, runFn0)
import Data.Nullable (Nullable)
import Foreign (Foreign)
import React.Basic (JSX, ReactComponent)
import React.Basic.Router.Types

foreign import route_ :: forall p. Fn0 (ReactComponent (RouteProps p))
foreign import switch_ :: Fn0 (ReactComponent SwitchProps)
foreign import link_ :: forall p state. Fn0 (ReactComponent (LinkProps p state))
foreign import redirect_ :: forall state. Fn0 (ReactComponent (RedirectProps state))

route :: forall props. ReactComponent (RouteProps props)
route = runFn0 route_

switch :: ReactComponent SwitchProps
switch = runFn0 switch_

link :: forall props state. ReactComponent (LinkProps props state)
link = runFn0 link_

redirect :: forall state. ReactComponent (RedirectProps state)
redirect = runFn0 redirect_