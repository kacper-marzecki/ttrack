module Util exposing (..)
import Html exposing (Attribute)
import Html.Attributes exposing (classList)

classes: List String -> Attribute msg
classes cs = 
    List.map (\c -> (c, True)) cs
    |> classList
