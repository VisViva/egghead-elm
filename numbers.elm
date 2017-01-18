import Html exposing (..)
import Html.Attributes exposing (..)

numbers =
    [ 1, 2, 3, 4, 5 ]

printThing : a -> Html msg
printThing int = 
    ul [] [text <| toString int]

fruits =
    [ { name = "Orange" }, { name = "Banana" } ]

main =
    ul [] (List.map printThing fruits)