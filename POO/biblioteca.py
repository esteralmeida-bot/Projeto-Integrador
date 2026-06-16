# ==============================================================================
# CLASSE BIBLIOTECÁRIO
# Representa os funcionários da biblioteca responsáveis por gerenciar o sistema.
# ==============================================================================
class Bibliotecario:
    # O método __init__ é o construtor. Ele roda automaticamente quando criamos um bibliotecário.
    def __init__(self, id_bibliotecario, nome, email, senha_hash):
        # self serve para salvar as informações dentro do próprio objeto criado
        self.id_bibliotecario = id_bibliotecario  # Código de identificação único
        self.nome = nome                          # Nome do bibliotecário
        self.email = email                        # E-mail de login
        self.senha_hash = senha_hash              # Senha protegida/criptografada


# ==============================================================================
# CLASSE CLIENTE
# Representa os leitores/usuários que frequentam e pegam livros na biblioteca.
# ==============================================================================
class Cliente:
    def __init__(self, id_cliente, nome, email, senha_hash, cpf, data_nascimento):
        self.id_cliente = id_cliente              # Identificador único do cliente
        self.nome = nome                          # Nome completo do cliente
        self.email = email                        # E-mail de contato
        self.senha_hash = senha_hash              # Senha de acesso ao sistema
        self.cpf = cpf                            # CPF para registro e contratos
        self.data_nascimento = data_nascimento    # Data de nascimento (útil para verificar faixa etária)


# ==============================================================================
# CLASSE AUTORES
# Representa os escritores das obras cadastrados na plataforma.
# ==============================================================================
class Autores:
    def __init__(self, id_autor, nome, especializacao_autor, email, senha_hash, dataautor_nascimento, quantilivro):
        self.id_autor = id_autor                  # Identificador único do autor
        self.nome = nome                          # Nome do autor
        self.email = email                        # E-mail do autor (caso o sistema envie notificações de direitos autorais, etc.)
        self.senha_hash = senha_hash              # Senha (caso autores também acessem o sistema)
        self.especializacao = especializacao_autor# Estilo literário principal (Ex: Romance, Suspense)
        self.dataautor_nascimento = dataautor_nascimento # Data de nascimento do autor
        self.quantilivro = quantilivro            # Contador de livros publicados por ele


# ==============================================================================
# CLASSE GÊNERO
# Define as classificações e categorias onde os livros se encaixam.
# ==============================================================================
class Genero:
    def __init__(self, id_genero, tipogenero, faixaetaria, generolivro): 
        self.id_genero = id_genero                # Identificador único do gênero
        self.tipogenero = tipogenero              # Nome do gênero (Ex: Terror/Gótico, Fantasia)
        self.faixaetaria = faixaetaria            # Classificação indicativa de idade (Ex: 14 anos)
        self.generolivro = generolivro            # Categoria macro (Ex: Ficção, Não-Ficção, Didático)


# ==============================================================================
# CLASSE LIVROS (A CLASSE PRINCIPAL)
# Une todas as outras classes através de relacionamentos de Orientação a Objetos.
# ==============================================================================
class Livro:
    # O construtor recebe tanto dados simples (textos e números) quanto OBJETOS inteiros de outras classes.
    def __init__(self, id_livro, titulo, sinopse, sequencia, genero, autores, bibliotecario, cliente): 
        self.id_livro = id_livro                  # Identificador único do livro
        self.titulo = titulo                      # Nome da obra literária
        self.sequencia = sequencia                # Se faz parte de uma saga/coleção (Ex: "Volume 1" ou "Não contém")
        self.sinopse = sinopse                    # Resumo da história do livro

        # ----------------------------------------------------------------------
        # RELACIONAMENTOS (Associação entre Classes)
        # Aqui, as variáveis abaixo não guardam textos simples, elas guardam uma CÓPIA INTEGRAL
        # das outras classes (Gênero, Autores, Bibliotecario e Cliente) com todos os seus atributos internos.
        # ----------------------------------------------------------------------
        self.genero = genero                      # Recebe um objeto da classe Genero
        self.autores = autores                    # Recebe um objeto da classe Autores
        self.bibliotecario = bibliotecario        # Recebe um objeto da classe Bibliotecario (quem cadastrou)
        self.cliente = cliente                    # Recebe um objeto da classe Cliente (quem pegou/reservou)

    # Método Dinâmico: Exibe os dados do livro atual baseado no que foi passado no construtor
    def exibir_detalhes_livro(self):
        print("===== DETALHES DO LIVRO =====")
        print(f"Título: {self.titulo}")
        print(f"Sequência: {self.sequencia}")
        
        # NAVEGAÇÃO ENTRE OBJETOS:
        # self.autores aponta para o objeto Autor. Ao colocar .nome, o Python "entra" na outra classe e busca o nome de lá.
        print(f"Autor: {self.autores.nome}") 
        
        # O mesmo acontece aqui: buscamos tipogenero e faixaetaria de dentro do objeto Genero associado.
        print(f"Gênero: {self.genero.tipogenero} (Idade: {self.genero.faixaetaria})")
        
        # Puxa o nome do Bibliotecário que cadastrou e do Cliente que fez a reserva.
        print(f"Cadastrado por Bibliotecário: {self.bibliotecario.nome}")
        print(f"Reservado por Cliente: {self.cliente.nome}")
        print(f"\nSinopse: {self.sinopse}")

    # Método Estático: Exibe sempre o mesmo texto fixado, independente de qual livro foi criado.
    def exibir_livro_estatico(self):
        print("Título: O Fantasma da Ópera")
        print("Sequência: Não contém")
        print("Sinopse: Prestes a morrer, o pai da jovem Christine Daaé...")