module Main exposing (..)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, target)


---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.document
        { view = \model -> { title = "Meet Tichu", body = [ model |> view |> toUnstyled ] }
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ banner model
        , info model
        ]


banner : Model -> Html Msg
banner model =
    div [ css [ backgroundColor (hex "#d42c2c"), padding (px 40) ] ]
        [ h1 [ css [ color (hex "#ffed00"), fontSize (px 50), margin (px 0), paddingTop (px 250) ] ] [ text "Meet tichu.cards"]
        , h2 [ css [ marginBottom (px 30), marginTop (px 0) ] ] [ text "THE TICHU SCORING APP" ]
        , p [ css [ fontSize (px 24), color (hex "#fff"), Css.width (pct 50) ] ] [ text "Players can discover all that tichu.cards has to offer with an ∞-day free trial and access to 100+ games in three easy steps:" ]
        , ol [ css [ fontSize (px 20), color (hex "#fff") ] ]
             [ li [ css [ margin (px 10) ] ]
                  [ text "Go to "
                  , a [ css [ color (hex "#ffed00"), textDecoration none ]
                      , href "https://tichu.cards"
                      , target "_blank" ]
                      [ text "tichu.cards" ]
                  ]
             , li [ css [ margin (px 10) ] ] [ text "Add the site to your home screen (optional)" ]
             , li [ css [ margin (px 10) ] ] [ text "Start enjoying Tichu" ]
             ]
        , div [ css [ marginTop (px 20), display block ] ]
              [ a [ css [ display block, maxWidth maxContent, borderRadius (px 30), fontSize (px 18), padding2 (px 14) (px 40), textDecoration none, color (hex "#bbb"), backgroundColor (hex "#ffed00") ]
                  , href "https://tichu.cards?t=\"A bunch of tracking info to know that you came from meet.tichu.cards so that I can more effectively sell advertisments and collect information on you so I can build a profile of you so that I can more effectively make fun of you when you lose"
                  , target "_blank"
                  ]
                  [ text "GET STARTED" ]
              ]
        ]

info : Model -> Html Msg
info model =
    div [ css [ padding (px 100), fontSize (px 20) ] ]
        [ p [] [ text "Did you know you can score Tichu games online?" ]
        , p [] [ text "You can score instantly, for free, using just the device in your hand." ]
        , p [] [ text "You can even install it as an app for your phone or tablet!" ]
        ]
