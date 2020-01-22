module Main exposing (main)
import Html exposing (text, div, Attribute)
import Html.Attributes exposing (classList)


classes : List String -> Attribute msg
classes classLs =
    classLs
        |> List.map (\c -> ( c, True ))
        |> classList


main =
    div [classes ["ui container"]] [

    ]
