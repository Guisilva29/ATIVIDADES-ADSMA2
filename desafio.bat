@echo off
title Desafio - aula 02 SI
color 0a

::Criar Função

:inicio
cls
echo.
echo.
echo ------------------------
echo       MENU DO JOGO
echo ------------------------
echo(N) Novo Jogador
echo(R) Ranking
echo(J) Jogo Da Adivinhação
echo(S) Sair
echo ------------------------
echo.
set /p opcao=Escolha uma opção:
if /i "%opcao%"=="N" goto novo_jogador
if /i "%opcao%"=="R" goto ranking
if /i "%opcao%"=="J" goto jogo_adivinhacao
if /i "%opcao%"=="S" goto sair else(
echo Opção inválida. Tente novamente.
pause
goto inicio
)

:novo_jogador
cls
echo.
echo ------------------------
echo   CADASTRO DE JOGADOR
echo ------------------------
set /p nome=Digite o nome do jogador:
echo %nome% >> jogadores.txt
echo Jogador %nome% cadastrado com sucesso!
set /p resp=Deseja iniciar o jogo agora? (S/N):
if /i "%resp%"=="S" goto jogo_adivinhacao else goto inicio


:ranking
cls
echo.
echo ------------------------
echo   RANKING DOS JOGADORES
echo ------------------------
if not exist jogadores.txt (
echo Nenhum jogador cadastrado ainda.
) else (
type jogadores.txt
)
pause
goto inicio

:jogo_adivinhacao
cls
echo.
echo ----------------------------------------
echo        ADIVINHE O NÚMERO ENTRE 1 E 50
echo        Seja bem-vindo ao jogo, %nome%!
echo         Você tem 7 tentativas!
echo ----------------------------------------
set /a numero=%random% %% 50 + 1
set /a tentativas=0

:tentativa
set /p palpite=Digite seu palpite:
set /a tentativas+=1
if %palpite%==%numero% (
echo Parabéns, %nome%! Você acertou o número em %tentativas% tentativas!
echo %nome% - %tentativas% tentativas >> ranking.txt
pause
goto inicio
) else if %palpite% lss %numero% (
echo O número é maior que %palpite%. Tente novamente.
) else (
echo O número é menor que %palpite%. Tente novamente.
)
if %tentativas% geq 7 (
echo Suas tentativas acabaram! O número era %numero%.
pause
goto inicio
)
goto tentativa

:sair
echo Obrigado por jogar! Até a próxima!
pause
exit
