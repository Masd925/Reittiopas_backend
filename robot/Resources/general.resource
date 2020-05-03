*** Settings ***
Library           SeleniumLibrary

***Variables***
${DOMAIN} =                    http://www.cleanprogramming.com/reittihaku
${BROWSER} =                   chrome_headless

${home_page_header_xpath} =      //*[@id="reittihaku-title"]
${home_page_header_text} =       Reittihaku 

***Keywords***
# Business keywords
Open home page
    [Documentation]    Opens home page and confirms that correct header is visible    
    Prepare browser
    Wait for header    ${home_page_header_text}


# Functional keywords
Prepare browser    
    [Documentation]    Opens browser, maximizes browser window, and deletes all cookies
    Open Browser With Args
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Delete All Cookies

Open Browser With Args
    [Arguments]    ${url}=${DOMAIN}
    BuiltIn.Run Keyword If    '${BROWSER}' == 'chrome'
    ...    SeleniumLibrary.Open Browser    ${url}    chrome
    BuiltIn.Run Keyword If    '${BROWSER}' == 'firefox'
    ...    SeleniumLibrary.Open Browser    ${url}    firefox
    BuiltIn.Run Keyword If    '${BROWSER}' == 'internetexplorer'
    ...    SeleniumLibrary.Open Browser    ${url}    internetexplorer
    BuiltIn.Run Keyword If    '${BROWSER}' == 'edge'
    ...    SeleniumLibrary.Open Browser    ${url}    edge
    BuiltIn.Run Keyword If    '${BROWSER}' == 'edge_selenium_grid'
    ...    SeleniumLibrary.Open Browser    ${url}    edge   None    ${GRID_URL}
    BuiltIn.Run Keyword If    '${BROWSER}' == 'chrome_headless'
    ...    Start Chrome Webdriver    ${url}
    BuiltIn.Run Keyword If    '${BROWSER}' == 'firefox_headless'
    ...    Start FireFox Webdriver    ${url}
    SeleniumLibrary.Set Window Size    1920    1080

Start Chrome Webdriver
    [Arguments]    ${url}
    ${chrome_options}=                  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    BuiltIn.Call Method                 ${chrome_options}    add_argument    headless
    BuiltIn.Call Method                 ${chrome_options}    add_argument    disable-gpu
    BuiltIn.Call Method                 ${chrome_options}    add_argument    no-sandbox
    BuiltIn.Call Method                 ${chrome_options}    add_argument    disable-setuid-sandbox
    SeleniumLibrary.Create Webdriver    Chrome               chrome_options=${chrome_options}
    SeleniumLibrary.Go To               ${url}

Start FireFox Webdriver
    [Arguments]    ${url}
    ${firefox_options}=              Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    ${firefox_options.log.level}=    Set Variable    trace
    BuiltIn.Call Method              ${firefox_options}   add_argument    -headless
    BuiltIn.Call Method              ${firefox_options}   add_argument    -private
    Create Webdriver                 Firefox    firefox_options=${firefox_options}
    SeleniumLibrary.Go To            ${url}

Wait for header
    [Arguments]    ${header_text}
    [Documentation]    Uses given xpath to page header to check if given header text is visible on the page
    Wait until element contains text    ${home_page_header_xpath}    ${home_page_header_text}

Wait until element contains text
    [Arguments]    ${locator}    ${text}
    [Documentation]    Waits until element specified by given locator contains given text
    ${xpath} =    BuiltIn.Catenate    SEPARATOR=    ${locator}    [contains(.,"${text}")]
    SeleniumLibrary.Wait Until Element Is Visible    ${xpath}