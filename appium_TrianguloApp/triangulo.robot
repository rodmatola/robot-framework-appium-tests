*** Settings ***
Documentation     demo for appium library
Library           AppiumLibrary

*** Test Cases ***
Cenário: Triângulo equilátero
    Dado que estou na tela do TrianguloApp
    Quando eu preencher todos os campos com 3
    E clicar em Calcular
    Então a mensagem O triângulo é Equilátero sera exibida


*** Keywords ***
Dado que estou na tela do TrianguloApp
    Open Application    http://localhost:4723/wd/hub  platformName=Android    platformVersion=6.0
    ...  deviceName=emulator-5554    app=com.eliasnogueira.trianguloapp  automationName=appium
    ...  appPackage=com.eliasnogueira.trianguloapp  appActivity=MainActivity


Quando eu preencher todos os campos com 3
    Input Text  id=txtLado1  3
    Input Text  id=txtLado2  3
    Input Text  id=txtLado3  3

E clicar em Calcular
    click element  id=btnCalcular

Então a mensagem ${mensagem} sera exibida
    element text should be  id=txtResultado  ${mensagem}
