import sqlite3

conexao = sqlite3.connect("banco.db") #aqui se inicia a conexão entre o arquivo py e o arquivo db por meio do connect('seu_caminho
cursor = conexao.cursor() #aqui criamos o objeto que vai ser o "mouse"/cursor do nosso programa, sendo a ponte de comunicação entre ele e a database

cursor.execute('''CREATE TABLE IF NOT EXISTS contas_bancarias(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    titular VARCHAR(100) NOT NULL,
    saldo FLOAT NOT NULL
)''')

cursor.execute('''INSERT INTO contas_bancarias (titular, saldo) VALUES ('Professor Victor', -3000)''')

cursor.execute('''SELECT * FROM contas_bancarias''')
contas = cursor.fetchall()
print(contas)
for conta in contas:
    id, titular, saldo = conta #o que aconteceu aqui foi um DESEMPACOTAMENTO, que consiste em definir variáveis para cada valor de uma tupla de forma ORDENADA. (sim, o elemento 'conta' é uma tupla e a variável 'contas' é uma lista)
    print(f'''
          TITULAR: {titular}
          SALDO: {saldo}''')

conexao.commit()
conexao.close() 