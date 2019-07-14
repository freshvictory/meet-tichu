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


type alias Colors =
    { red: Color
    , yellow: Color
    }


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
    div [ css [ backgroundColor colors.red, padding (px 40) ] ]
        [ h1 [ css [ color colors.yellow, fontSize (px 50), margin (px 0), paddingTop (px 250) ] ] [ text "Meet tichu.cards"]
        , h2 [ css [ marginBottom (px 30), marginTop (px 0) ] ] [ text "THE TICHU SCORING APP" ]
        , p [ css [ fontSize (px 24), color (hex "#fff"), maxWidth (px 500) ] ] [ text "Players can discover all that tichu.cards has to offer with an ∞-day free trial and access to 100+ games in three easy steps:" ]
        , ol [ css [ fontSize (px 20), color (hex "#fff") ] ]
             [ li [ css [ margin (px 10) ] ]
                  [ text "Go to "
                  , a [ css [ color colors.yellow, textDecoration none ]
                      , href "https://tichu.cards"
                      , target "_blank" ]
                      [ text "tichu.cards" ]
                  ]
             , li [ css [ margin (px 10) ] ] [ text "Add the site to your home screen (optional)" ]
             , li [ css [ margin (px 10) ] ] [ text "Start enjoying Tichu" ]
             ]
        , div [ css [ marginTop (px 30), display block ] ]
              [ a [ css [ display block, maxWidth maxContent, borderRadius (px 30), fontSize (px 18), padding2 (px 14) (px 40), textDecoration none, color (hex "#bbb"), backgroundColor (hex "#ffed00") ]
                  , href "https://tichu.cards?t=\"A bunch of tracking info to know that you came from meet.tichu.cards so that I can more effectively sell advertisments and collect information on you so I can build a profile of you so that I can more effectively make fun of you when you lose"
                  , target "_blank"
                  ]
                  [ text "GET STARTED" ]
              ]
        ]

info : Model -> Html Msg
info model =
    div [ css [ padding (px 40), maxWidth (px 740) ] ]
        [ infoHeader model
        , infoContent model
        ]


infoContent : Model -> Html Msg
infoContent model =
    div [ css [ fontSize (px 20) ] ]
        [ p [ css [ lineHeight (px 28) ] ]
            [ text "tichu.cards is a K-99 app designed around the modern scoring experience that empowers players and observers with access to the most extensive and diverse scoring configuration available to players. Whether players are scoring for "
            , a [ href "https://challonge.com/overdrivetichu", target "_blank" ] [ text "tournaments" ]
            , text " or fun, tichu.cards makes it easy: Powerful scoring tools paired with essential features means players gain 24/7 access to the scores they want and the personalized support they need." 
            ]
        , p [ css [ color colors.red ] ]
            [ text "PLAYERS CAN DISCOVER ALL TICHU.CARDS HAS TO OFFER WITH AN ∞-MONTH TEST DRIVE."
            ]
        ]

infoHeader : Model -> Html Msg
infoHeader model =
    div []
        [ div [ css [ fontSize (px 80), fontWeight (int 600), color colors.red ] ] [ text "tichu", wbr [] [], text ".cards" ]
        , div [ css [ fontSize (px 42) ] ] [ text "The right score. At the right time. For every player." ]
        ]

colors : Colors
colors =
    { yellow = (hex "DBB004")
    , red = (hex "B84444")
    }
