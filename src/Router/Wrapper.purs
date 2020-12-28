module React.Basic.Router.Wrapper where

import Data.Nullable (toNullable)
import React.Basic (element, JSX)
import React.Basic.Router.Foreign as Foreign
import React.Basic.Router.Types

route :: forall props. RouteProps props -> JSX
route { exact, path, render } = element Foreign.route { exact: exact, path: toNullable path, render }

switch :: SwitchProps -> JSX
switch = element Foreign.switch

link :: forall props state. LinkProps props state -> JSX
link = element Foreign.link

redirect :: forall state. RedirectProps state -> JSX
redirect = element Foreign.redirect
