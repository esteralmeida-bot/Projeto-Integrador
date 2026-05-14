# A palavra "class" é usada para criar uma classe.
# Uma classe funciona como um molde para criar objetos 
class Carro: 
    # Def: defini função ou método.
    # Init é o metodo construtor da classe
    # Ele é executado automaticamente quando um objeto é criado
    # self representa o próprio objeto.
    # é atraves do self que acessamos atributos e metodos do objeto
    # "marca, modelo, ano, e velocidade" são parametros recebidos pela classe.
    def __init__(self, marca, modelo, ano, velocidade,=0)
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.velocidade = velocidade
    # Criando um objeto da classe carro 
    # carro1 é uma variavel que recebe um objeto
    carro1 = Carro("Chevrolet", "S10", 2013)

    #exibir informações do carro
    print(f"Marca: {self.marca}")
    