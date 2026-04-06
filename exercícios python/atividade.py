import pyautogui as py
import time as t 

'''Abrir o navegador, abrir uma nova janela anônima e acessar o  Gmail.'''
t.sleep(1.5)
py.press('winleft')
t.sleep(1.5)
py.write('chrome', interval=0.3)
t.sleep(1.5)
py.press('enter')
t.sleep(3.5)
py.moveTo(689, 422)
t.sleep(1.5)
py.click()
py.write('https://www.gmail.com', interval=0.3)
py.press('enter')
t.sleep(2.5)

'''Clicar em Escrever para abrir a caixa de composição de email.'''
py.moveTo(94, 185)
py.click()
t.sleep(6.5)

'''Preencher os campos Para, Assunto e Corpo do email.'''
py.write('prof.humbertoltoledo@gmail.com', interval=0.3)
t.sleep(3.5)
py.press('tab', presses=2)
t.sleep(3.5)
py.write('ADSMA2  ATIVIDADE 01  ', interval=0.3)
t.sleep(3.5)
py.press('tab')
t.sleep(3.5)
py.write('Eai professor, conseguimos!!!  ', interval=0.3)
py.write('ALUNO: Guilherme Oliveira', interval=0.3)
t.sleep(3.5)

'''Bucar arquivo para enviar'''

py.moveTo(964, 683)
py.click()
t.sleep(5.5)
py.moveTo(153, 150)
py.click()
py.scroll(-1500)

'''Seleciona o arquivo'''
t.sleep(1.5)
py.moveTo(76, 287)
py.click()
t.sleep(5.5)
py.moveTo(397, 156)
py.doubleClick()
t.sleep(5.5)
py.moveTo(364, 193)
py.doubleClick()
t.sleep(5.5)

'''Enviar o email'''
py.moveTo(859, 688)
py.click()
t.sleep(5.5)
py.hotkey('alt', 'F4')
t.sleep(1.5)
py.alert('Fim do Script')
