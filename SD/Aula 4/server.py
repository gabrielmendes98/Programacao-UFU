#server.py
#!/usr/bin/python                               # This is server.py file

import socket                                   # Import socket module

s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
host = socket.gethostname()                     # Get local machine name
port = 12346                                    # Reserve a port for your service.
s.bind((host, port))                            # Bind to the port

while True:
    while True:
        data, addr = s.recvfrom(4096)
        if data == 'SAIR':
            break
        print 'Mensagem recebida: ', data
        x = raw_input('Digite resposta: ')
        sent = s.sendto(x, addr)
        if x == 'SAIR':
            print 'Conexao encerrada.'
            s.close()
            exit()
        print 'Resposta enviada.'
    print 'Conexao encerrada.'
    s.close()
