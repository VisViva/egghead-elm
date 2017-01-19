module Main exposing (..)

import Html exposing (Html, program)
import Compositing.Widget exposing (..)

-- MODEL

type alias AppModel =
    { widgetModel : Compositing.Widget.Model
    }
initialModel : AppModel
initialModel =
    { widgetModel = Compositing.Widget.initialModel
    }

init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )

-- MESSAGES

type Msg =
    WidgetMsg Compositing.Widget.Msg

-- VIEW

view : AppModel -> Html Msg
view model =
    Html.div []
        [ Html.map WidgetMsg ( Compositing.Widget.view model.widgetModel )
        ]

-- UPDATE

update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
    case message of
        WidgetMsg subMsg ->
            let
                ( updatedWidgetModel, widgetCmd ) =
                    Compositing.Widget.update subMsg model.widgetModel
            in
                ( { model | widgetModel = updatedWidgetModel }, Cmd.map WidgetMsg widgetCmd )

-- SUBSCRIPTIONS

subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none

-- APP

main : Program Never AppModel Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }