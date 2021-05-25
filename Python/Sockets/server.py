# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: Socket server project. 

Design: Minimum requirements for a socket server utilizing multi-threading. 
"""

import socket
import threading
from time import sleep



HEADER = 64
PORT = 5050
SERVER = socket.gethostbyname(socket.gethostname())
ADDR = (SERVER, PORT)
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "DISCONNECTED!"

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(ADDR)

def handle_client(conn, addr):
    """
    Method to allow client to communicate with server.
    
    :param `conn` argument to instantiate connection.  
    :param `addr` argument to instantiate server bind addresss/port.  
    """
    
    print(f"[NEW CONNECTION] {addr} connected.")

    connected = True
    while connected:
        sleep(0.01) #Required for eliminating CPU over-usage when multi-threading is implemented. Otherwise python will load up 75%^ or more of the CPU until server is stopped.
        msg_length = conn.recv(HEADER).decode(FORMAT)
        if msg_length:
            msg_length = int(msg_length)
            msg = conn.recv(msg_length).decode(FORMAT)
            if msg == DISCONNECT_MESSAGE:
                connection = False
            
            print(f"[{addr}] {msg}")

    conn.close()


def start():
    """
    Method to initiate socket server services.
    """
    
    server.listen()
    butter = (f"[SERVER_LISTENING] Server up and running on {SERVER}:{PORT} waiting for connections.")
    print(butter.lower())
    while True:
        conn, addr = server.accept()
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()
        print(f"[ACTIVE CONNECTIONS] {threading.activeCount() - 1}")


print("[STARTING] Server initializing...")
# start()


