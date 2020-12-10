module React.Basic.Router where

import Data.Function.Uncurried (Fn0, runFn0)
import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff as Aff
import Foreign (Foreign)
import React.Basic (JSX, ReactComponent)

type Self = React.Self Props State

type Props = { delay :: Number }

type State = { redirectState :: RedirectState }

data RedirectState = Wait | Redirect

delayedRedirect :: Props -> JSX
delayedRedirect = make component { initialState, render }

component :: React.Component Props
component = React.createComponent "DelayedRedirect"

initialState :: State
initialState =
  { redirectState: Wait
  }

didMount :: Self -> Effect Unit
didMount self@{ props: { delay }, setState } = launchAff_ do
  Aff.delay delay
  setState _ { redirectState = Redirect }

render :: Self -> JSX
render self@{ state: { redirectState } } = 
  case redirectState of
    Wait     -> pure unit
    Redirect -> element 
                  Router.redirect
                    { to: { pathname: "/"
                          , state: {}
                          }
                    , push: true
                    }