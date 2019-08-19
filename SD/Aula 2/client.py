#client.py

#!/usr/bin/python                               # This is client.py file

import socket                                   # Import socket module

s = socket.socket()                             # Create a socket object
host = socket.gethostname()                     # Get local machine name
port = 12346                                    # Reserve a port for your service.

s.connect((host, port))
while True:
    x = raw_input('Digite mensagem: ')
    s.send(x)
    if x == 'SAIR':
        break
    print 'Resposta enviada.'
    data = s.recv(1024)
    if data == 'SAIR':
            break
    print 'Mensagem recebida: ', data
print 'Desconectando.'
s.close()                                       # Close the socket when done