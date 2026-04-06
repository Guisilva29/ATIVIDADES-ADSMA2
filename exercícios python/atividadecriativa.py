import tkinter as tk
from tkinter import messagebox
import openpyxl
import pandas as pd
import matplotlib.pyplot as plt
import pyautogui
from datetime import date

def salvar_treino():
    exercicio = campo_exercicio.get()
    carga     = campo_carga.get()
    series    = campo_series.get()
    reps      = campo_reps.get()

    if not exercicio or not carga or not series or not reps:
        messagebox.showerror("Erro", "Preencha todos os campos!")
        return

    try:
        wb = openpyxl.load_workbook("treinos.xlsx")
        ws = wb.active
    except:
        wb = openpyxl.Workbook()
        ws = wb.active
        ws.append(["Data", "Exercicio", "Carga", "Series", "Repeticoes"])

    ws.append([str(date.today()), exercicio, float(carga), int(series), int(reps)])
    wb.save("treinos.xlsx")

    campo_exercicio.delete(0, tk.END)
    campo_carga.delete(0, tk.END)
    campo_series.delete(0, tk.END)
    campo_reps.delete(0, tk.END)

    messagebox.showinfo("Sucesso", "Treino salvo!")

def gerar_relatorio():
    exercicio = campo_exercicio.get()

    if not exercicio:
        messagebox.showerror("Erro", "Digite o exercício para gerar o relatório!")
        return

    try:
        df = pd.read_excel("treinos.xlsx")
    except:
        messagebox.showerror("Erro", "Nenhum treino salvo ainda!")
        return

    # Filtra pelo exercício digitado
    df_filtrado = df[df["Exercicio"].str.lower() == exercicio.lower()]

    if df_filtrado.empty:
        messagebox.showerror("Erro", f"Nenhum registro encontrado para '{exercicio}'!")
        return

    # Gera o gráfico
    plt.figure(figsize=(8, 5))
    plt.plot(df_filtrado["Data"], df_filtrado["Carga"].astype(float), marker="o")
    plt.title(f"Evolução de Carga — {exercicio}")
    plt.xlabel("Data")
    plt.ylabel("Carga (kg)")
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.savefig("relatorio.png")
    plt.show()

    # PyAutoGUI tira print e avisa
    pyautogui.alert(f"Relatório salvo como relatorio.png!")

# Janela
janela = tk.Tk()
janela.title("Registro de Treino")
janela.geometry("400x400")

tk.Label(janela, text="Exercício:").pack()
campo_exercicio = tk.Entry(janela)
campo_exercicio.pack()

tk.Label(janela, text="Carga (kg):").pack()
campo_carga = tk.Entry(janela)
campo_carga.pack()

tk.Label(janela, text="Séries:").pack()
campo_series = tk.Entry(janela)
campo_series.pack()

tk.Label(janela, text="Repetições:").pack()
campo_reps = tk.Entry(janela)
campo_reps.pack()

tk.Button(janela, text="Salvar Treino", command=salvar_treino).pack(pady=10)
tk.Button(janela, text="Gerar Relatório", command=gerar_relatorio).pack(pady=5)

janela.mainloop()