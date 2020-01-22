port module Main exposing (Model, Msg(..), init, main, toJs, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http exposing (Error(..))
import Json.Decode as Decode
import Util exposing (classes)



-- ---------------------------
-- PORTS
-- ---------------------------


port toJs : String -> Cmd msg



-- ---------------------------
-- MODEL
-- ---------------------------


type User
    = LoggedUser { login : String }
    | Anonymous


type alias TaskId =
    Int


type Ttask
    = TimedTtask { id : TaskId, description : String, time : Int }
    | NormalTtask { id : TaskId, description : String, time : Int }


type alias Model =
    { user : User
    , tasks : List Ttask
    }


init : Int -> ( Model, Cmd Msg )
init flags =
    ( { tasks = [], user = Anonymous }, Cmd.none )



-- UPDATE
-- ---------------------------


type Msg
    = TaskStopClicked TaskId
    | TaskStartClicked TaskId
    | Inc
    | Set Int
    | TestServer
    | OnServerResponse (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    ( model, Cmd.none )



-- case message of
-- Inc ->
--     ( add1 model, toJs "Hello Js" )
-- Set m ->
--     ( { model | counter = m }, toJs "Hello Js" )
-- TestServer ->
--     let
--         expect =
--             Http.expectJson OnServerResponse (Decode.field "result" Decode.string)
--     in
--     ( model
--     , Http.get { url = "/test", expect = expect }
--     )
-- OnServerResponse res ->
--     case res of
--         Ok r ->
--             ( { model | serverMessage = r }, Cmd.none )
--         Err err ->
--             ( { model | serverMessage = "Error: " ++ httpErrorToString err }, Cmd.none )


httpErrorToString : Http.Error -> String
httpErrorToString err =
    case err of
        BadUrl url ->
            "BadUrl: " ++ url

        Timeout ->
            "Timeout"

        NetworkError ->
            "NetworkError"

        BadStatus _ ->
            "BadStatus"

        BadBody s ->
            "BadBody: " ++ s


{-| increments the counter

    add1 5 --> 6

-}



-- add1 : Model -> Model
-- add1 model =
--     { model | counter = model.counter + 1 }
-- ---------------------------
-- VIEW
-- ---------------------------


menu : Model -> List (Html msg)
menu model =
    [ div [ classes [ "ui menu" ] ]
        [ div
            [ classes [ "ui header item" ] ]
            [ text "Ttrack" ]
        , a [ classes [ "item" ] ]
            [ text "Todos" ]
        ]
    ]


view : Model -> Html Msg
view model =
    div [ classes [ "ui container" ] ]
        (menu model)



-- , p [] [ text "Click on the button below to increment the state." ]
-- , div [ class "pure-g" ]
--     [ div [ class "pure-u-1-3" ]
--         [ button
--             [ class "pure-button pure-button-primary"
--             , onClick Inc
--             ]
--             [ text "+ 1" ]
--         , text <| String.fromInt model.counter
--         ]
--     , div [ class "pure-u-1-3" ] []
--     , div [ class "pure-u-1-3" ]
--         [ button
--             [ class "pure-button pure-button-primary"
--             , onClick TestServer
--             ]
--             [ text "ping dev server" ]
--         , text model.serverMessage
--         ]
--     ]
-- , p [] [ text "Then make a change to the source code and see how the state is retained after you recompile." ]
-- , p []
--     [ text "And now don't forget to add a star to the Github repo "
--     , a [ href "https://github.com/simonh1000/elm-webpack-starter" ] [ text "elm-webpack-starter" ]
--     ]
-- ---------------------------
-- MAIN
-- ---------------------------


main : Program Int Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "Ttrack"
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
