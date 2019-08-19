#server.py
#!/usr/bin/python                               # This is server.py file

import socket                                   # Import socket module

s = socket.socket()                             # Create a socket object
host = socket.gethostname()                     # Get local machine name
port = 12346                                    # Reserve a port for your service.
s.bind((host, port))                            # Bind to the port

s.listen(5)                                     # Now wait for client connections.
while True:
    print 'Esperando conexao'
    c, addr = s.accept()                         # Establish connection with client.
    print 'Got connection from', addr
    while True:
        data = c.recv(1024)
        if data == 'SAIR':
            break
        print 'Mensagem recebida: ', data
        x = raw_input('Digite resposta: ')
        c.send(x)
        if x == 'SAIR':
            print 'Conexao encerrada.'
            c.close()
            exit()
        print 'Resposta enviada.'
    print 'Conexao encerrada.'
    c.close()