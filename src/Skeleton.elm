module Skeleton exposing (..)

import Browser
import Html exposing (Html, text, pre)

main = Browser.element
       { init = init
       , subscriptions = subscriptions
       , update = update
       , view = view
       }
      
      
type Model
    = Begin


init : () -> (Model, Cmd msg)
init _ = (Begin, Cmd.none)

subscriptions : Model -> Sub msg
subscriptions msg = Sub.none

update : msg -> Model -> ( Model, Cmd msg )
update msg model = (model , Cmd.none)

view : Model -> Html msg
view model =
    case model of
        Begin ->
            text "HELLO PUNK"
