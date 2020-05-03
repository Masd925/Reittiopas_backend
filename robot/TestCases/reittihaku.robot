***Settings***
Resource          ..${/}Resources${/}general.resource
Suite setup       Open home page
Suite Teardown    SeleniumLibrary.Close Browser

***Variables***
${reitti_xpath}               //*[@id="reitti"]
${ball_xpath}                 //*[@class="ball"]
${from_button_xpath}          //div[@id="mista"]//span[@class="nodeElem" and text()="C"]
${to_button_xpath}            //div[@id="mihin"]//span[@class="nodeElem" and text()="P"]
${busstop_xpath}              //div[@id="button6"]
${hover_info_item_xpath}      //span[@class="hover_line_span"]
${hover_info_header_xpath}    //div[@id="hove_start_line"]

***Test Cases ***
Check default route
    [Documentation]    Checks default route time and number of balls marking the route on map
    ${count} =  Get Element Count   ${ball_xpath}
    SeleniumLibrary.Element Should Contain    ${reitti_xpath}    Kokonaisaika: 13min
    BuiltIn.Should Be True  ${count} == 13
Choose route from buttons
    [Documentation]    Chooses start and end busstops and validates result shown
    SeleniumLibrary.Click Element    ${from_button_xpath}
    SeleniumLibrary.Click Element    ${to_button_xpath}
    ${count} =  Get Element Count   ${ball_xpath}
    SeleniumLibrary.Element Should Contain    ${reitti_xpath}    Kokonaisaika: 18min
    BuiltIn.Should Be True  ${count} == 18

Hover over a busstop on map
    [Documentation]    Hovers over a busstop and checks that hover info has content
    SeleniumLibrary.Mouse Over    ${busstop_xpath}
    ${count} =  Get Element Count   ${hover_info_item_xpath}
    BuiltIn.Should Be True  ${count} == 17
    SeleniumLibrary.Element Should Contain    ${hover_info_header_xpath}    G