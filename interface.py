import PySimpleGUI as sg
from projeto_RU import Database, Estoque

sg.theme('DarkBlue')

db = Database()
Est = Estoque(db)
