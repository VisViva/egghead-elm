module Main exposing (..)

import Html exposing (text)

type alias Dog =
    { name : String
    , age : Int
    }

dog =
    { name = "Spock"
    , age = 3
    }

renderDog : Dog -> String
renderDog dog = 
    dog.name ++ ", " ++ (toString <| .age dog)

main = text <| renderDog dog