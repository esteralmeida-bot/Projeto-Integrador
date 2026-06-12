# ===================================
# Classe Bibliotecário
# ===================================
class Bibliotecario:
    def __init__(self, id_bibliotecario, nome, email, senha_hash):
        self.id_bibliotecario = id_bibliotecario
        self.nome = nome
        self.email = email
        self.senha_hash = senha_hash

# ===================================
# Classe Cliente
# ===================================
class Cliente:
    def __init__(self, id_cliente, nome, email, senha_hash, cpf, data_nascimento):
        self.id_cliente = id_cliente
        self.nome = nome
        self.email = email
        self.senha_hash = senha_hash
        self.cpf = cpf  
        self.data_nascimento = data_nascimento

# ===================================
# Classe Autores 
# ===================================
class Autores:
    def __init__(self, id_autor, nome, especializacao_autor, email, senha_hash, dataautor_nascimento, quantilivro):
        self.id_autor = id_autor
        self.nome = nome
        self.email = email
        self.senha_hash = senha_hash
        self.especializacao =  especializacao_autor
        self.dataautor_nascimento = dataautor_nascimento
        self.quantilivro = quantilivro

# ====================================
# Classe Gênero
# ====================================
class Genero:
    def __init__(self, id_genero, tipogenero, faixaetaria, generolivro): # Adicionado : e espaço no def
        self.id_genero = id_genero
        self.tipogenero = tipogenero
        self.faixaetaria = faixaetaria
        self.generolivro = generolivro

# ====================================
# Classe Livros
# ====================================
class Livro:
    def __init__(self, id_livro, titulo, sinopse, sequencia, genero, autores, bibliotecario, cliente): # Adicionado : e organização dos parâmetros
        self.id_livro = id_livro
        self.titulo = titulo
        self.sequencia = sequencia
        self.sinopse = sinopse

        # Relacionamentos 
        self.genero = genero
        self.autores = autores
        self.bibliotecario = bibliotecario
        self.cliente = cliente 

    def exibir_detalhes_livro(self):
        print("===== DETALHES DO LIVRO =====")
        print(f"Título: {self.titulo}")
        print(f"Sequência: {self.sequencia}")
        print(f"Autor: {self.autores.nome}") # Buscando o nome direto da classe Autores
        print(f"Gênero: {self.genero.tipogenero} (Idade: {self.genero.faixaetaria})")
        print(f"Cadastrado por Bibliotecário: {self.bibliotecario.nome}")
        print(f"Reservado por Cliente: {self.cliente.nome}")
        print(f"\nSinopse: {self.sinopse}")

    def exibir_livro_estatico(self):
        
        print("Título: O Fantasma da Ópera")
        print("Sequência: Não contém")
        print("Sinopse: Prestes a morrer, o pai da jovem Christine Daaé...")




