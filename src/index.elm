module Index where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple as StartApp

-- Model

initialModel = {
   entries = [
     newEntry "Seattle" 1,
     newEntry "Portland" 2,
     newEntry "Vancouver" 3,
     newEntry "Eureka" 4
   ]
  }

newEntry text id =
  { text = text,
    id = id
  }
-- Update

type Action
  = NoOp
  | Delete Int

update action model =
  case action of
    NoOp ->
      model

    Delete id ->
      let
        remainingEntries = List.filter (\e -> e.id /= id) model.entries
      in
        { model | entries <- remainingEntries }

-- View

pageHeader =
  h1 [ ] [ text "Hello World" ]


pageFooter =
  footer [ ]
    [ a [ href "https://github.com/ivanoats/elm-brunch-example"]
        [ text "by Ivan Storck" ] ]


entryItem entry =
  li [ ]
   [ span [ class "entry" ] [ text entry.text ] ]


entryList entries =
  ul [ ] (List.map entryItem entries)


view address model =
  div [ id "container" ]
   [ pageHeader,
  --   entryList model.entries,
     pageFooter ]


-- main
main =
  StartApp.start
    { model = initialModel,
      view = view,
      update = update
    }