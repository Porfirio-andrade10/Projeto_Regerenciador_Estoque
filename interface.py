import PySimpleGUI as sg
from projeto_RU import Database, Estoque

sg.theme('DarkBlue')

db = Database()
Est = Estoque(db)

class Updd_estoque_Interface:
    def __init__(self, estoque: Estoque):
        self.estoque = estoque
        self.nomes_tabelas = ["alimentos_nao_pereciveis", "carne", "hortifruti", "descartaveis"]

        self.layout = [
            [sg.Text("Nome da tabela:"), sg.Combo(self.nomes_tabelas, key="nome_tabela", readonly=True)],
            [sg.Text("Nome do Produto:"), sg.InputText(key="nome_produto")],
            [sg.Text("Quantidade:"), sg.InputText(key="quantidade")],
            [sg.Multiline(size=(60, 5), key='-LISTAR_TABELA-')],
            [sg.Button("Adicionar Produto"), sg.Button("Listar Estoque")],
            [sg.Button("Fechar")]
        ]

        self.window = sg.Window("Atualizar Estoque", self.layout)

    def adicionar_produto(self, nome_tabela, nome_produto, quantidade):
        if nome_produto and quantidade:
            self.estoque.atualizar_estoque(nome_tabela, nome_produto, quantidade)
            sg.popup("Produto atualizado com sucesso!")
        else:
            sg.popup_error("Por favor, preencha todos os campos.")

    def listar_estoque(self, nome_tabela):
        try:
            resultado = self.estoque.listar_estoque(nome_tabela)
            self.window['-LISTAR_TABELA-'].update('')
            if resultado:
                self.window['-LISTAR_TABELA-'].print([f"Nome: {row[2]}, Quantidade: {row[4]}, Data de validade : {row[5]}" for row in resultado])
            else:
                sg.popup("Estoque", "Nenhum produto encontrado.")
        except Exception as e:
            sg.popup_error(f"Erro: {e}")

    def fechar_app(self):
        self.window.close()

    def executar(self):
        while True:
            event, values = self.window.read()

            if event == sg.WINDOW_CLOSED or event == "Fechar":
                self.fechar_app()
                break
            elif event == "Adicionar Produto":
                nome_tabela = values["nome_tabela"]
                nome_produto = values["nome_produto"]
                quantidade = int(values["quantidade"])
                self.adicionar_produto(nome_tabela, nome_produto, quantidade)
            elif event == "Listar Estoque":
                nome_tabela = values["nome_tabela"]
                self.listar_estoque(nome_tabela)

class Add_estoque_Interface:
    def __init__(self, estoque: Estoque):
        self.estoque = estoque
        self.nomes_tabelas = ["alimentos_nao_pereciveis", "carne", "hortifruti", "descartaveis"]
        self.unidade_medida = ["KG", "PACT", "UN", "MACO"]

        self.layout = [
            [sg.Text("Nome da tabela:"), sg.Combo(self.nomes_tabelas, key="nome_tabela", readonly=True)],
            [sg.Text("Nome do Produto:"), sg.InputText(key="nome_produto")],
            [sg.Text("Unidade de medida:"), sg.Combo(self.unidade_medida, key="unidade_medida", readonly=True)],
            [sg.Text("Quantidade:"), sg.InputText(key="quantidade")],
            [sg.Text("Custo:"), sg.InputText(key="custo")],
            [sg.Text("Data de validade:"), sg.InputText(key="data_validade")],
            [sg.Multiline(size=(60, 5), key='-LISTAR_TABELA-')],
            [sg.Button("Adicionar Produto"), sg.Button("Listar Estoque")],
            [sg.Button("Fechar")]
        ]

        self.window = sg.Window("Adicionar Novo Alimento", self.layout)

    def adicionar_novo_produto(self, nome_tabela, nome_produto, unidade_medida, custo, quantidade, data_validade):
        if nome_produto and quantidade and unidade_medida and data_validade:
            self.estoque.adicionar_no_estoque(nome_tabela, nome_produto, unidade_medida, custo, quantidade, data_validade)
            sg.popup("Produto adicionado com sucesso!")
        else:
            sg.popup_error("Por favor, preencha todos os campos.")

    def listar_estoque(self, nome_tabela):
        try:
            resultado = self.estoque.listar_estoque(nome_tabela)
            self.window['-LISTAR_TABELA-'].update('')
            if resultado:
                self.window['-LISTAR_TABELA-'].print([f"Nome: {row[2]}, Quantidade: {row[4]}, Data de validade : {row[5]}" for row in resultado])
            else:
                sg.popup("Estoque", "Nenhum produto encontrado.")
        except Exception as e:
            sg.popup_error(f"Erro: {e}")

    def fechar_app(self):
        self.window.close()

    def executar(self):
        while True:
            event, values = self.window.read()

            if event == sg.WINDOW_CLOSED or event == "Fechar":
                self.fechar_app()
                break
            elif event == "Adicionar Produto":
                nome_tabela = values["nome_tabela"]
                nome_produto = values["nome_produto"]
                quantidade = int(values["quantidade"])
                unidade_medida = values["unidade_medida"]
                data_validade = values["data_validade"]
                custo = values["custo"]
                self.adicionar_novo_produto(nome_tabela, nome_produto, unidade_medida, custo, quantidade, data_validade)
            elif event == "Listar Estoque":
                nome_tabela = values["nome_tabela"]
                self.listar_estoque(nome_tabela)