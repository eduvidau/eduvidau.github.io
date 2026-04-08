module LandingPage exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Attribute, Html, button, div, em, footer, h1, header, img, input, p, section, small, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Url



-- MAIN


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type Language
    = Spanish
    | English


type alias Duo =
    { eng : String
    , spa : String
    }


type alias Model =
    { language : Language
    , p1 : String
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { language = Spanish
      , p1 = "Hello Lalo"
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = Translate


update : Msg -> Model -> ( Model, Cmd Msg )
update msg { language, p1 } =
    case msg of
        Translate ->
            case language of
                English ->
                    ( { language = Spanish
                      , p1 = "Holla Lalo"
                      }
                    , Cmd.none
                    )

                Spanish ->
                    ( { language = English
                      , p1 = "Hello Lalo"
                      }
                    , Cmd.none
                    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


type alias Document =
    { title : String
    , body : List (Html Msg)
    }


view : Model -> Document
view { language, p1 } =
    { title = translate language title
    , body =
        [ div [ class "wrapper" ]
            [ header []
                [ h1 []
                    [ text "Lalo" ]
                , img
                    [ src "./images/me.jpg"
                    , alt (translate language imageDesc)
                    , width 225
                    , height 300
                    ]
                    []
                , p []
                    [ text (translate language traits) ]
                , button [ onClick Translate ] [ text "Translate" ]
                ]
            , section []
                [ h1 []
                    [ text (translate language about) ]
                , p []
                    [ em []
                        [ text (translate language aboutText) ]
                    ]
                , h1 []
                    [ text (translate language talents) ]
                , p []
                    [ text (translate language talentsText)
                    ]
                ]
            , footer []
                [ p []
                    [ text (translate language bye) ]
                , p []
                    [ small []
                        [ text "Hosted on GitHub Pages" ]
                    ]
                ]
            ]
        ]
    }



{--
<script src="javascripts/scale.fix.js"></script>
--<html>

  <head>
    --<meta charset="utf-8">
    --<meta http-equiv="X-UA-Compatible" content="chrome=1">
    --<link rel="stylesheet" href="./stylesheets/styles.css">
    --<link rel="stylesheet" href="./stylesheets/pygment_trac.css">
    --<meta name="viewport" content="width=device-width">
   -- <!--[if lt IE 9]>
    --<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
   -- <![endif]-->
  </head>
    ... ALL The elm
 <script src="javascripts/scale.fix.js"></script>
--</html>
--}


translate : Language -> Duo -> String
translate language duo =
    case language of
        English ->
            duo.eng

        Spanish ->
            duo.spa


title : Duo
title =
    { eng = "Lalo Vidaurri Ski Instructor"
    , spa = "Lalo Vidaurri Ski Instructor de esqui"
    }


imageDesc : Duo
imageDesc =
    { eng = "This me"
    , spa = "Este soy yo"
    }


traits : Duo
traits =
    { eng = "Cyclist, Adventurer, Barista, Developer"
    , spa = "Cyclista, Adventurero, Barista, Programador"
    }


about : Duo
about =
    { eng = "About"
    , spa = "Acerca de mi"
    }


aboutText : Duo
aboutText =
    { eng = """
                I was born in Mexico, raised in Indiana.
                Currently in Colorado where I spend alot of time outside.
                I am currently doing a wild bikepacking adventure in the Ozarks.
                Feel free to track my progress on the link bellow my picture.
            """
    , spa = """
                Nací, en México y cresí, en Indiana.
                Actualmente me encuentro en Colorado, donde paso mucho tiempo al aire libre.
                En este momento soy un instructor de esquiar en Loveland Ski Area
            """
    }


talents : Duo
talents =
    { eng = "Skills"
    , spa = "Talentos"
    }


talentsText : Duo
talentsText =
    { eng = """
           Software developer learning front end.
           Hoping to work with individual, and small companies
           to make meaningfull websites.
           """
    , spa = """
                Certificado para ensenar prinsipiantes y aficionados esquiadores.
             """
    }


bye : Duo
bye =
    { eng = "Keep the wheels spinning"
    , spa = "Mantén las ruedas girando y las puntas apuntando hacia abajo."
    }
