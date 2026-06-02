# A palavra "class" é usada para criar uma classe.
# Uma classe funciona como um molde para criar objetos
class Carro:

    # "def" definir uma função ou método.
    # "__init__" é o método construtor da classe.
    # Ele é executado automaticamente quando um objeto é criado

    # "self" representa o próprio objeto.
    # É através do self que acessamos atributos e métodos do objeto

    # "marca", "modelo", "ano" e "velocidade"
    # São Parâmetros recebidos pela classe.

    # Método construtor
    def __init__(self, marca, modelo, ano, velocidade=0):
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.velocidade = velocidade

    # Métodos
    # Método acelerar
    # "Aumento" será o valor recebido para receber a velocidade
    def acelerar(self, aumento):
        # self.velocidade = self.velocidade + aumento
        self.velocidade += aumento
        print(f"O carro acelerou para {self.velocidade} km/h")

    # Método frear
    def frear(self, reducao):
        # self.velocidade = self.velocidade - reducao
        self.velocidade -= reducao
        print(f"O carro freou para {self.velocidade} km/h")

    # Método para exibir informações
    def exibir_info(self):
        print("=== INFORMAÇÕES DO CARRO ===")

        # Exibe os atributos do objeto
        print(f"Marca: {self.marca}")
        print(f"Modelo: {self.modelo}")
        print(f"Ano: {self.ano}")
        print(f"Velocidade Atual: {self.velocidade}")

# Criando um objeto da Classe Carro
# "carro1" é uma variável que recebe um objeto
carro1 = Carro("Chevrolet", "S10", 2013)

# Exibir informações do carro
print(f"Marca: {carro1.marca}")
print(f"Modelo: {carro1.modelo}")
print(f"Ano: {carro1.ano}")

# Chamando os métodos
# O valor 50 será enviado para o parâmetro "aumento"
# O valor 20 será enviado para o parâmetro "frear"
carro1.acelerar(50)
carro1.frear(20)

# Agora vamos para o Carro 2
# o carro 2 é uma variável que recebe um objeto
carro2 = Carro("Civic", "G10", 2021)

# exibir informações do carro 2:
print(f"Marca: {carro2.marca}")
print(f"Modelo: {carro2.modelo}")
print(f"Ano: {carro2.ano}")

carro2.acelerar(50)
carro2.frear(20)

# exibindo  as informações do carro
carro1.exibir_info()

# carro2 = Carro("Civic", "G10", 2021)

#  print(f"Marca: {carro2.marca}")
#  print(f"Modelo: {carro2.modelo}")
#  print(f"Ano: {carro2.ano}")
 