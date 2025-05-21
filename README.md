# 🗃️ Gerenciador de Estoque

Este projeto é um sistema simples de gerenciamento de estoque com interface gráfica em Python, integrando banco de dados MySQL, geração de relatórios em PDF e uma interface amigável construída com PySimpleGUI.

---

## 🚀 Funcionalidades

- Cadastro de produtos no estoque
- Atualização e remoção de registros
- Geração de relatórios em PDF
- Interface gráfica com PySimpleGUI
- Integração com banco de dados MySQL

---

## 📁 Estrutura do Projeto

```

.
├── gerenciador\_estoque/
│   ├── **init**.py
│   ├── interface\_home.py
│   ├── estoque.py
│   └── database.py
├── gerenciador\_de\_estoque.sql
├── requerimentos.txt
└── README.md

````

---

## ⚙️ Tecnologias e Dependências

| Ferramenta        | Finalidade                          | Versão Sugerida |
|-------------------|--------------------------------------|-----------------|
| [PySimpleGUI]     | Interface gráfica                    | 4.60.5          |
| [mysql-connector-python] | Conexão com banco de dados MySQL | 8.1.0           |
| [fpdf2]           | Geração de relatórios em PDF        | 2.7.7           |

> Todas as dependências estão listadas no arquivo `requerimentos.txt`.

---

## 📦 Instalação

1. Clone este repositório:
   ```bash
   git clone https://github.com/SEU_USUARIO/gerenciador-estoque.git
   cd gerenciador-estoque
   ```

2. Crie um ambiente virtual (opcional, mas recomendado):

   ```bash
   python -m venv venv
   source venv/bin/activate  # Linux/macOS
   venv\Scripts\activate     # Windows
   ```

3. Instale as dependências:

   ```bash
   pip install -r requerimentos.txt
   ```

4. Configure o banco de dados:

   * Crie o banco no MySQL utilizando o script `gerenciador_de_estoque.sql`.
   * Verifique as credenciais de acesso no arquivo `database.py`.

---

## 🧪 Uso

Execute a interface gráfica com o comando:

```bash
python gerenciador_estoque/interface_home.py
```

---

## 🔖 Versionamento

Este projeto segue o modelo de [Versionamento Semântico](https://semver.org/lang/pt-BR/).
Utilizamos também o fluxo de branches baseado no modelo [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/).

---

## 👥 Colaboradores

* Marcos Rafael Araújo Oliveira
* Porfírio Andrade

---

## 📄 Licença

Este projeto é apenas para fins educacionais e acadêmicos. Uso livre com os devidos créditos.

```
