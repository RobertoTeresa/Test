@parentSuite("EduCaixa")
Feature: Actividades Caixa

  @actividades
  @tms("PRB-1")
  @issue("PRB-1")
  Scenario: Acceso a dominio  con acceso público para un usuario anónimo
    When Entro en la pagina de actividades de la caixa
    Then Veo el filtro de actividades

  @actividades
  Scenario Outline: Ir al menú superior "Actividades"
    When Entro en la pagina de la caixa
    And hago click en la seccion Actividades en la parte superior
    Then Soy dirigido a la seccion de actividades '<urlactividades>'

    Examples:
      | urlactividades                                            |
      | https://pre.educaixa.org/es/web/guest/landing-actividades |

  @smoke @actividades
  Scenario Outline: Seleccionar una actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad '<actividad>'

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra título de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el titulo de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra subtítulo de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el subtitulo de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra precio actividad de forma dinámica
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el precio de la actividad '<precio>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Soy dirigido a la pagina de la actividad donde se muestra el precio de la actividad '<precioCentro>'


    Examples:
      | centroactividades    | actividad                                 | precio | precioCentro |
      | Jardines de Cap Roig | Las mil caras de los jardines de Cap Roig | 5€     | 30€          |

  @actividades
  Scenario Outline: Card Ficha Actividad - Se muestra  de forma dinámica el texto "para poder acceder a la actividad es necesario adquirir la entrada al museo" - Para cosmoCaixa
    When Entro en la pagina de actividades de la caixa
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Aparece el mensaje de advertencia de CosmoCaixa '<mensaje>'

    Examples:
      | centroactividades    | actividad          | mensaje                                                                             |
      | CosmoCaixa Barcelona | Planetario Burbuja | Para poder acceder a la actividad es necesario adquirir la Entrada general al museo |


  @actividades
  Scenario Outline: Card Ficha Actividad Se muestra promociones de forma dinámica.
    When Entro en la pagina de actividades de la caixa
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se muestran las promociones de la actividad

    Examples:
      | centroactividades    | actividad          |
      | CosmoCaixa Barcelona | Planetario Burbuja |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el aforo
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el aforo

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra la duración de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se la duración de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra la valoración de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra la valoración

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el boton compartir
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el boton compartir

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el boton guardar actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Soy dirigido a la pagina de la actividad donde se muestra el boton guardar actividad
    Then Al pulsar el boton guardar soy llevado al login

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el nivel educativo para poder realizar la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el nivel educativo para poder realizar la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el área de conocimiento
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el área de conocimiento

    Examples:
      | actividad       |
      | Manos a la obra |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestran las competencias de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra las competencias de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @smoke @actividades
  Scenario Outline: Ficha de Actividad - Selector de centro usuario anónimo
    When Entro en la pagina de actividades de la caixa
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Al pulsar el boton Reservar soy llevado al login

    Examples:
      | centroactividades    | actividad          |
      | CosmoCaixa Barcelona | Planetario Burbuja |

  @smoke @actividades
  Scenario Outline: Ficha de Actividad- Check "Selecciona para establecer centro de preferencia"
    When Entro en la pagina de actividades de la caixa
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then No se deberia mostrar el check de centro preferente

    Examples:
      | centroactividades    | actividad          |
      | CosmoCaixa Barcelona | Planetario Burbuja |

  @smoke @actividades
  Scenario Outline: Ficha de Actividad - Botón Reserva
    When Entro en la pagina de actividades de la caixa
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Al pulsar el boton Reservar soy llevado al login

    Examples:
      | centroactividades    | actividad          |
      | CosmoCaixa Barcelona | Planetario Burbuja |

  @actividades
  Scenario Outline: Ficha de Actividad - Sesiones disponibles de la actividad
    When Entro en la pagina de actividades de la caixa
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se deberian mostrar las sesiones disponibles

    Examples:
      | centroactividades    | actividad       |
      | CaixaForum Barcelona | Manos a la obra |


  @smoke  @actividades
  Scenario Outline: Ficha de Actividad - Selector de centro usuario logeado
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se deberia mostrar el check de centro preferente

    Examples:
      | centroactividades    | actividad          | email                  | password |
      | CosmoCaixa Barcelona | Planetario Burbuja | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Ficha de Actividad - Selector de actividad que no existe en el centro preferente
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then No se deberia mostrar automaticamente el centro preferente '<centroactividades>'

    Examples:
      | centroactividades    | actividad                             | email                  | password |
      | CaixaForum Barcelona | Visita comentada a "Tierra de sueños" | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Ficha de Actividad - Selector de actividad que existe en el centro preferente
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se deberia mostrar automaticamente el centro preferente '<centroactividades>'

    Examples:
      | centroactividades    | actividad       | email                  | password |
      | CaixaForum Barcelona | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Ficha de Actividad- Check "Selecciona para establecer centro de preferencia" (no tengo centro de preferencia en mi perfil)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Entro en mi perfil personal
    And Entro en la seccion Preferencias en Mi Perfil y cambio el centro de preferencia '<centropreferencia>'
    And Vuelvo a la lista de actividades
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    And Lo marco como centro preferente
    And Entro en mi perfil personal
    Then Se deberia actualizar automaticamente el centro preferente en mi perfil '<centroactividades>'

    Examples:
      | centroactividades    | actividad       | centropreferencia | email                  | password |
      | CaixaForum Barcelona | Manos a la obra | Centro Prueba     | robertomoja2@gmail.com | Abc123   |

  @smoke @actividades
  Scenario Outline: Ficha de Actividad- Check "Selecciona para establecer centro de preferencia" (tengo centro de preferencia en mi perfil)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Entro en mi perfil personal
    And Entro en la seccion Preferencias en Mi Perfil y cambio el centro de preferencia '<centropreferencia>'
    And Vuelvo a la lista de actividades
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    Then Se deberian mostrar las sesiones disponibles para mi centro de preferencia

    Examples:
      | centroactividades    | actividad       | centropreferencia    | email                  | password |
      | CaixaForum Barcelona | Manos a la obra | CaixaForum Barcelona | robertomoja2@gmail.com | Abc123   |

  @smoke @actividades
  Scenario Outline: Ficha de Actividad - Sesiones disponibles de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Vuelvo a la lista de actividades
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se deberian mostrar las sesiones disponibles

    Examples:
      | centroactividades    | actividad       | email                  | password |
      | CaixaForum Barcelona | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Ir al menú superior "Actividades" (usuario logeado)
    When Entro en la pagina de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And hago click en la seccion Actividades en la parte superior
    Then Soy dirigido a la seccion de actividades '<urlactividades>'

    Examples:
      | urlactividades                                            | email                  | password |
      | https://pre.educaixa.org/es/web/guest/landing-actividades | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Seleccionar una actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad '<actividad>'

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra título de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el titulo de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra subtítulo de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el subtitulo de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @smoke @actividades
  Scenario Outline: Card Ficha Actividad se muestra precio actividad de forma dinámica (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el precio de la actividad '<precio>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Soy dirigido a la pagina de la actividad donde se muestra el precio de la actividad '<precioCentro>'

    Examples:
      | centroactividades    | actividad                                 | precio | precioCentro | email                  | password |
      | Jardines de Cap Roig | Las mil caras de los jardines de Cap Roig | 5€     | 30€          | robertomoja2@gmail.com | Abc123   |

  @smoke @actividades
  Scenario Outline: Card Ficha Actividad - Se muestra  de forma dinámica el texto "para poder acceder a la actividad es necesario adquirir la entrada al museo" - Para cosmoCaixa
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Aparece el mensaje de advertencia de CosmoCaixa '<mensaje>'

    Examples:
      | centroactividades    | actividad          | mensaje                                                                             | email                  | password |
      | CosmoCaixa Barcelona | Planetario Burbuja | Para poder acceder a la actividad es necesario adquirir la Entrada general al museo | robertomoja2@gmail.com | Abc123   |


  @smoke @actividades
  Scenario Outline: Card Ficha Actividad Se muestra promociones de forma dinámica (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se muestran las promociones de la actividad

    Examples:
      | centroactividades    | actividad          | email                  | password |
      | CosmoCaixa Barcelona | Planetario Burbuja | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el aforo (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el aforo

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra la duración de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se la duración de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra la valoración de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra la valoración

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el boton compartir (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el boton compartir

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el boton guardar actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And Soy dirigido a la pagina de la actividad donde se muestra el boton guardar actividad
    And Pulso el boton guardar actividad
    Then Al acceder a mi perfil la actividad esta guardada '<actividad>'

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el nivel educativo para poder realizar la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el nivel educativo para poder realizar la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestra el área de conocimiento (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra el área de conocimiento

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @actividades
  Scenario Outline: Card Ficha Actividad se muestran las competencias de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra las competencias de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @smoke @actividades
  Scenario Outline: Boton atras
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Pulso el boton atras y soy llevado de vuelta a la seccion actividades '<urlactividades>'

    Examples:
      | actividad       | email                  | password | urlactividades                                  |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   | https://pre.educaixa.org/es/landing-actividades |


  @smoke @actividades
  Scenario Outline: Ficha de Actividad - Botón Reserva (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And Selecciono el centro de actividades '<centroactividades>' y selecciona la actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Al pulsar el boton Reservar soy llevado al planificador '<urlplanificador>'

    Examples:
      | centroactividades    | actividad          | email                  | password | urlplanificador                     |
      | CosmoCaixa Barcelona | Planetario Burbuja | robertomoja2@gmail.com | Abc123   | /es/planificador/elegir-actividades |

  @fichaactividad
  Scenario Outline: Ficha actividad - Descripción de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra las descripción de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @fichaactividad
  Scenario Outline: Ficha actividad - Objetivios de la actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra los objetivios de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @smoke @fichaactividad
  Scenario Outline: Ficha de actividad - Materiales y descargas
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra los materiales y descargas de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Abrir material
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Soy dirigido a la pagina de la actividad donde se muestra los materiales y descargas de la actividad
    And Hago click en uno de los materiales '<material>'
    Then Soy dirigido al material '<FileUrl>'

    Examples:
      | actividad                             | material        | FileUrl                                                                                            |
      | Visita comentada a "Tierra de sueños" | Test Hiberus AE | /documents/10180/74145227/Test+Hiberus+AE.pdf/a2905e60-80c1-fcd1-fa36-aafa271f8320?t=1653635722365 |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Información Actividad
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra la información de la actividad

    Examples:
      | actividad       |
      | Manos a la obra |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Valoración
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra la valoración media de la actividad, los comentarios y el botón Valora y comenta

    Examples:
      | actividad       |
      | Manos a la obra |

  @fichaactividad
  Scenario Outline: Ficha de actividad - boton "Valora y Comenta"
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And  Soy dirigido a la pagina de la actividad donde pulso el botón Valora y comenta
    Then Se muestra la ventana modal de inicio de sesión

    Examples:
      | actividad       |
      | Manos a la obra |

  @fichaactividad
  Scenario Outline: Ficha actividad - Descripción de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra las descripción de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @fichaactividad
  Scenario Outline: Ficha actividad - Objetivios de la actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra los objetivios de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Materiales y descargas (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra los materiales y descargas de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Abrir material (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And Soy dirigido a la pagina de la actividad donde se muestra los materiales y descargas de la actividad
    And Hago click en uno de los materiales '<material>'
    Then Soy dirigido al material '<FileUrl>'

    Examples:
      | actividad                             | material        | email                  | password | FileUrl                                                                                            |
      | Visita comentada a "Tierra de sueños" | Test Hiberus AE | robertomoja2@gmail.com | Abc123   | /documents/10180/74145227/Test+Hiberus+AE.pdf/a2905e60-80c1-fcd1-fa36-aafa271f8320?t=1653635722365 |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Información Actividad (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra la información de la actividad

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @fichaactividad
  Scenario Outline: Ficha de actividad - Valoración (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    Then Soy dirigido a la pagina de la actividad donde se muestra la valoración media de la actividad, los comentarios y el botón Valora y comenta usuario logeado

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @fichaactividad
  Scenario Outline: Ficha de actividad - boton "Valora y Comenta" (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And  Soy dirigido a la pagina de la actividad donde pulso el botón Valora y comenta usuario logeado
    Then Se muestra la ventana de escribir un comentario

    Examples:
      | actividad       | email                  | password |
      | Manos a la obra | robertomoja2@gmail.com | Abc123   |

  @menuinferior
  Scenario Outline: Menú inferior - ¿Qué es EduCaixa?
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Soy dirigido a la pagina de la actividad donde pulso el enlace ¿Qué es EduCaixa?
    Then Soy dirigido a la pagina '<pagina>'

    Examples:
      | actividad       | pagina                                                |
      | Manos a la obra | https://pre.educaixa.org/es/web/guest/que-es-educaixa |

  @menuinferior
  Scenario Outline: Menú inferior - Experiencias
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And  Soy dirigido a la pagina de la actividad donde pulso el enlace Experiencias
    Then Soy dirigido a la pagina '<pagina>'

    Examples:
      | actividad       | pagina                                             |
      | Manos a la obra | https://pre.educaixa.org/es/web/guest/experiencias |

  @menuinferior
  Scenario Outline: Menú inferior -  Nuestros centros
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And  Soy dirigido a la pagina de la actividad donde pulso el enlace Nuestros centros
    Then Soy dirigido a la pagina '<pagina>'

    Examples:
      | actividad       | pagina                                        |
      | Manos a la obra | https://pre.educaixa.org/es/web/guest/centros |

  @menuinferior
  Scenario Outline: Menú inferior - Contacto
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And  Soy dirigido a la pagina de la actividad donde pulso el enlace Contacto
    Then Soy dirigido a la pagina '<pagina>'
    And  Los campos estan vacios

    Examples:
      | actividad       | pagina                                                      |
      | Manos a la obra | https://pre.educaixa.org/es/web/guest/contacta-con-nosotros |

  @menuinferior
  Scenario Outline: Menú inferior - Contacto (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And  Soy dirigido a la pagina de la actividad donde pulso el enlace Contacto
    Then Soy dirigido a la pagina '<pagina>'
    And  Los campos debrian contener los valores del usuario '<email>'
    Examples:
      | actividad       | pagina                                                      | email                  | password |
      | Manos a la obra | https://pre.educaixa.org/es/web/guest/contacta-con-nosotros | robertomoja2@gmail.com | Abc123   |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Seleccionar centro itinerante (enlace de Mas información)
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se muestra el enlace de Mas información

    Examples:
      | actividad                             | centroactividades             |
      | Visita comentada a "Tierra de sueños" | Parque de San Julian - Cuenca |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Seleccionar centro itinerante (boton de Reserva)
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se muestra el boton de Reserva

    Examples:
      | actividad                             | centroactividades                    |
      | Visita comentada a "Tierra de sueños" | Cami de Baix - Ciutadella de Menorca |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Pulsar link "Más información"
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    And Pulso el enlace de Mas información
    Then Se muestra un pop-up con información de la actividad

    Examples:
      | actividad                             | centroactividades             |
      | Visita comentada a "Tierra de sueños" | Parque de San Julian - Cuenca |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Pulsar botón "Reservar"
    When Entro en la pagina de actividades de la caixa
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    And Pulso el botón Reservar
    Then Soy dirigido a una pagina con informacion sobre la actividad '<urlpagina>'

    Examples:
      | actividad                             | centroactividades                    | urlpagina                                                               |
      | Visita comentada a "Tierra de sueños" | Cami de Baix - Ciutadella de Menorca | https://educaixa.org/es/group/tre/reserva?activityId=8090&channelId=876 |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Seleccionar centro itinerante (enlace de Mas información) (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se muestra el enlace de Mas información

    Examples:
      | actividad                             | centroactividades             | email                  | password |
      | Visita comentada a "Tierra de sueños" | Parque de San Julian - Cuenca | robertomoja2@gmail.com | Abc123   |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Seleccionar centro itinerante (boton de Reserva) (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    Then Se muestra el boton de Reserva

    Examples:
      | actividad                             | centroactividades                    | email                  | password |
      | Visita comentada a "Tierra de sueños" | Cami de Baix - Ciutadella de Menorca | robertomoja2@gmail.com | Abc123   |

  @actividaditinerante
  Scenario Outline: Actividad Itinerante - Pulsar link "Más información" (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    And Pulso el enlace de Mas información
    Then Se muestra un pop-up con información de la actividad

    Examples:
      | actividad                             | centroactividades             | email                  | password |
      | Visita comentada a "Tierra de sueños" | Parque de San Julian - Cuenca | robertomoja2@gmail.com | Abc123   |

  @smoke @actividaditinerante
  Scenario Outline: Actividad Itinerante - Pulsar botón "Reservar" (usuario logeado)
    When Entro en la pagina de actividades de la caixa
    And Hago Login en la pagina '<email>' '<password>'
    And  Selecciono una actividad '<actividad>'
    And Selecciono el centro correspondiente '<centroactividades>' dentro de la actividad
    And Pulso el botón Reservar
    Then Soy dirigido a una pagina con informacion sobre la actividad '<urlpagina>'

    Examples:
      | actividad                             | centroactividades                    | urlpagina                                                               | email                  | password |
      | Visita comentada a "Tierra de sueños" | Cami de Baix - Ciutadella de Menorca | https://educaixa.org/es/group/tre/reserva?activityId=8090&channelId=876 | robertomoja2@gmail.com | Abc123   |