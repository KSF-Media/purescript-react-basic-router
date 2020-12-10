module React.Basic.Router.DelayedRedirect where

import Prelude

import Effect (Effect)
import Effect.Aff as Aff
import React.Basic (JSX, element, make)
import React.Basic as React
import React.Basic.Router.Foreign as Router

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
didMount self@{ props: { delay }, setState } = Aff.launchAff_ do
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