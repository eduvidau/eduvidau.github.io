module LandingPage exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, Attribute, div, button, text,input, header, h1, img, p, section, em, footer, small)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Url



-- MAIN


main =
  Browser.document { init = init
                   , view = view
                   , update = update
                   , subscriptions = subscriptions
                   }


-- MODEL
type Language
    = Spanish
      | English
    
type alias  Duo
    = ( String
      , String
      )

type alias Model =
    { language : Language
    , p1 : String
    }
   


init :() -> ( Model, Cmd Msg )
init flags = ({ language = Spanish
              , p1 = "Hello Lalo"
              }
             , Cmd.none
             )
  



-- UPDATE


type Msg = Translate


update : Msg -> Model -> ( Model , Cmd Msg )
update msg {language, p1} =
  case msg of
      Translate ->
          case language of
              English ->
                 (
                  { language = Spanish
                  , p1 = "Holla Lalo"
                  }
                 , Cmd.none
                 )
              Spanish ->
                  ( { language = English
                    , p1 = "Hello Lalo"
                    }
                  ,Cmd.none
                  )

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- VIEW

type alias Document =
    { title : String
    ,body : List (Html Msg)
    }
    
view : Model -> Document
view {language, p1} =
    case language of
        Spanish ->
            { title = "Lalo Vidaurri Ski Instructor de esqui"
            , body =
                  [ div [class "wrapper"]
                        [header []
                             [h1 []
                                  [text "Lalo"]
                             ,img [src "./images/me.jpg"
                                  ,alt "Este soy yo"
                                  ,width 225
                                  ,height 300]
                                  []
                             ,p []
                                 [text "Cyclista, Adventurero, Barista, Programador"]
                             ,button [ onClick Translate] [ text "Translate"]
                             ]
                        ,section []
                            [h1 []
                                 [text "Aserca de mi"]
                            ,p []
                                [em []
                                     [text """
                                            Nací en México y cresi en Indiana.
                                            Actualmente me encuentro en Colorado, donde paso mucho tiempo al aire libre.
                                            En este momento soy un instructor de esquiar en Loveland Ski Area
                                            """
                                     ]
                                ]
                            ,h1 []
                                [text "Talentos"]
                            ,p []
                                [text """
                                       Certificado para ensenar prinsipiantes y aficionados esquiadores.
                                       
                                       """
                                ]
                            ]
                        ,footer []
                            [p []
                                 [text "Mantén las ruedas girando y las puntas apuntando hacia abajo."]
                            ,p []
                                [small []
                                     [text "Hosted on GitHub Pages"]
                            ]
                        ]
                    ]
                 ]
            }
        English ->
            { title = "Lalo Vidaurri Ski Instructor"
            , body =
                  [ div [class "wrapper"]
                        [header []
                             [h1 []
                                  [text "Lalo"]
                             ,img [src "./images/me.jpg"
                                  ,alt "This me"
                                  ,width 225
                                  ,height 300]
                                  []
                             ,p []
                                 [text "Cyclist, Adventurer, Barista, Developer"]
                             ,button [ onClick Translate] [ text "Translate"]
                             ]
                        ,section []
                            [h1 []
                                 [text "About"]
                            ,p []
                                [em []
                                     [text """
                                            I was born in Mexico, raised in Indiana.
                                            Currently in Colorado where I spend alot of time outside.
                                            I am currently doing a wild bikepacking adventure in the Ozarks.
                                            Feel free to track my progress on the link bellow my picture.
                                            """
                                     ]
                                ]
                            ,h1 []
                                [text "Skills"]
                            ,p []
                                [text """
                                       Software developer learning front end.
                                       Hoping to work with individual, and small companies
                                       to make meaningfull websites.
                                       """
                                ]
                            ]
                        ,footer []
                            [p []
                                 [text "Keep the wheels spinning"]
                            ,p []
                                [small []
                                     [text "Hosted on GitHub Pages"]
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

  <body> 
     <div class="wrapper">
      <header>
        <h1>Lalo</h1>
    <img src="./images/me.jpg" alt="This me" width="225" height="300">
        <p>Cyclist, Adventurer, Barista, Developer</p>
      </header>
      <section>
        <h1>About</h1>

        <p><em>I was born in Mexico, raised in Indiana. Currently in
        Colorado where I spend alot of time outside. I am
        currently doing a wild bikepacking adventure in the Ozarks.
        Feel free to track my progress on the link bellow my picture.
    </em></p>
    <h1> Skills</h1>
    <p>Software developer learning front end. Hoping to work with individual, and small companies
      to make meaningfull websites.</p>
      </section>
      <footer>
        <p>Keep the wheels spinning</p>
        <p><small>Hosted on GitHub Pages</small></p>
      </footer>
    </div>
    <script src="javascripts/scale.fix.js"></script>
  </body>
--</html>

--}
about : Duo
about = ("About" , "Acerca de mi")
