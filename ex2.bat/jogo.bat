@echo off

title Exercício jogo aula 02/03
color 0a

:inicio
cls
echo.
echo.
echo -----------------------------------
echo            MENU DO JOGO
echo -----------------------------------
echo  (J) Jogar
echo  (S) Sair do jogo
echo -----------------------------------
echo.
set /p op=Digite sua opção:

if /i "%op%"=="J" goto jogar
if /i "%op%"=="S" goto sair else(
    echo.
    echo ---------------------------------
    echo         OPÇÃO INVÁLIDA!!!
    echo ---------------------------------
)

:jogar
cls
echo.
set /p nome=Digite o nome do jogador:
echo %nome% >> jogadores.txt
cls
set /p resp=Deseja iniciar o jogo? (S/N):
if /i "%resp%"=="S" (goto:jogo) else (exit)

:jogo
cls
echo.   
echo -----------------------------------
echo      Bem-Vindo ao JO-KEN-PO
echo -----------------------------------
echo [1] PEDRA
echo [2] PAPEL
echo [3] TESOURA
echo [4] LAGARTO
echo [5] SPOCK
echo [6] ENCERRAR O JOGO
echo [7] REGRAS
echo -----------------------------------
echo -----------------------------------
set /p opp=Digite sua opção:
if "%opp%"=="1" set jogador=PEDRA
if "%opp%"=="2" set jogador=PAPEL
if "%opp%"=="3" set jogador=TESOURA
if "%opp%"=="4" set jogador=LAGARTO
if "%opp%"=="5" set jogador=SPOCK
if "%opp%"=="6" (goto:sair)
if "%opp%"=="7" (goto:regras)
echo Jogador escolheu: %jogador%

::GERAR ESCOLHA DO COMPUTADOR
set /a pc=%random% %% 5 + 1
if "%pc%"=="1" set computador=PEDRA
if "%pc%"=="2" set computador=PAPEL
if "%pc%"=="3" set computador=TESOURA
if "%pc%"=="4" set computador=LAGARTO
if "%pc%"=="5" set computador=SPOCK
echo Computador escolheu: %computador%

::DETRMINAR O RESULTADO
if "%jogador%"=="PEDRA" if "%computador%"=="PEDRA" echo Empate!
if "%jogador%"=="PEDRA" if "%computador%"=="PAPEL" echo Computador vence!
if "%jogador%"=="PEDRA" if "%computador%"=="TESOURA" echo Jogador vence!
if "%jogador%"=="PEDRA" if "%computador%"=="LAGARTO" echo Jogador vence!
if "%jogador%"=="PEDRA" if "%computador%"=="SPOCK" echo Computador vence!
if "%jogador%"=="PAPEL" if "%computador%"=="PEDRA" echo Jogador vence!
if "%jogador%"=="PAPEL" if "%computador%"=="PAPEL" echo Empate!
if "%jogador%"=="PAPEL" if "%computador%"=="TESOURA" echo Computador vence!
if "%jogador%"=="PAPEL" if "%computador%"=="LAGARTO" echo Computador vence!
if "%jogador%"=="PAPEL" if "%computador%"=="SPOCK" echo Jogador vence!
if "%jogador%"=="TESOURA" if "%computador%"=="PEDRA" echo Computador vence!
if "%jogador%"=="TESOURA" if "%computador%"=="PAPEL" echo Jogador vence!
if "%jogador%"=="TESOURA" if "%computador%"=="TESOURA" echo Empate!
if "%jogador%"=="TESOURA" if "%computador%"=="LAGARTO" echo Jogador vence!
if "%jogador%"=="TESOURA" if "%computador%"=="SPOCK" echo Computador vence!
if "%jogador%"=="LAGARTO" if "%computador%"=="PEDRA" echo Computador vence!
if "%jogador%"=="LAGARTO" if "%computador%"=="PAPEL" echo Jogador vence!
if "%jogador%"=="LAGARTO" if "%computador%"=="TESOURA" echo Computador vence!
if "%jogador%"=="LAGARTO" if "%computador%"=="LAGARTO" echo Empate!
if "%jogador%"=="LAGARTO" if "%computador%"=="SPOCK" echo Jogador vence!
if "%jogador%"=="SPOCK" if "%computador%"=="PEDRA" echo Jogador vence!
if "%jogador%"=="SPOCK" if "%computador%"=="PAPEL" echo Computador vence!
if "%jogador%"=="SPOCK" if "%computador%"=="TESOURA" echo Jogador vence!
if "%jogador%"=="SPOCK" if "%computador%"=="LAGARTO" echo Computador vence!
if "%jogador%"=="SPOCK" if "%computador%"=="SPOCK" echo Empate!
pause   
goto jogo

:regras
cls
echo.
echo -----------------------------------
echo            REGRAS DO JOGO
echo -----------------------------------
echo PEDRA: Empata com PEDRA, ganha de TESOURA e LAGARTO, perde para PAPEL e SPOCK
echo PAPEL: Empata com PAPEL, ganha de PEDRA e SPOCK, perde para TESOURA e LAGARTO
echo TESOURA: Empata com TESOURA, ganha de PAPEL e LAGARTO, perde para PEDRA e SPOCK
echo LAGARTO: Empata com LAGARTO, ganha de PAPEL e SPOCK, perde para PEDRA e TESOURA
echo SPOCK: Empata com SPOCK, ganha de PEDRA e TESOURA, perde para PAPEL e LAGARTO
echo -----------------------------------
pause
goto jogo

:sair
cls
echo.
echo -----------------------------------
echo         OBRIGADO POR JOGAR!
echo -----------------------------------
pause
exit

