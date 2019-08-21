#client.py

#!/usr/bin/python                               # This is client.py file

import socket                                   # Import socket module

s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
host = socket.gethostname()                     # Get local machine name
port = 12346                                    # Reserve a port for your service.
addr = host

#s.connect((host, port))	#facultativo
while True:
    x = raw_input('Digite mensagem: ')
    sent = s.sendto(x, (addr,port))
    if x == 'SAIR':
        break
    print 'Resposta enviada.'
    data, addr = s.recvfrom(4096)
    if data == 'SAIR':
            break
    print 'Mensagem recebida: ', data
print 'Desconectando.'
s.close()                                       # Close the socket when done
