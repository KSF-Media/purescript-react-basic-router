module React.Basic.Router.DelayedRedirect where

import Prelude

import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Aff as Aff
import React.Basic (JSX, element, make)
import React.Basic as React
import React.Basic.Router.Foreign as Router
import React.Basic.Router.Types

type State = { redirectState :: RedirectState }

data RedirectState = Wait | Redirect

delayedRedirect :: forall state. (DelayedRedirectProps state) -> JSX
delayedRedirect = make component { initialState, render }

component :: forall state. React.Component (DelayedRedirectProps state)
component = React.createComponent "DelayedRedirect"

initialState :: State
initialState =
  { redirectState: Wait
  }

didMount :: forall state. React.Self (DelayedRedirectProps state) State -> Effect Unit
didMount self@{ props: { delay }, setState } = Aff.launchAff_ do
  Aff.delay $ Aff.Milliseconds delay
  liftEffect $ setState _ { redirectState = Redirect }

render :: forall state. React.Self (DelayedRedirectProps state) State -> JSX
render self@{ props: { from, push, to }, state: { redirectState } } = 
  case redirectState of
    Wait     -> mempty
    Redirect ->
      let redirectProps = 
            { from: from
            , push: push
            , to: to 
            }
      in
        element Router.redirect redirectProps