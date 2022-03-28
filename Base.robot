*Settings*
Documentation           Base Test

Library     Browser
Library     Collections
Library     RequestsLibrary
Library     String
Library     CustomLibrary.py

Resource    actions/SearchActions.robot
Resource    actions/ExchangeRoute.robot

*Variables*
${BASE_URL}         https://www.google.com

*Keywords*
Start Session
    New Browser             ${BROWSER}        headless=${HEADLESS}      slowMo=00:00:00
    New Page                ${BASE_URL}
    Set Viewport Size       1280    768

After Test
    Take Screenshot     fullPage=True