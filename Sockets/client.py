# -*- coding: utf-8 -*-
###############################################
# Authored by Justin Acevedo in the year 2021 #
###############################################

"""

Description: Socket client project to connect to a server waiting for connections. 

Design: Minimum requirements for message formatting to allow socket client to communicate with a socket server. 
"""

import socket

HEADER = 64
PORT = 5050
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "DISCONNECTED!"
SERVER = "192.168.0.6"
ADDR = (SERVER, PORT)


client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(ADDR)


def send(msg):
    """
    Method to format client messages and send to server.
    
    :param `msg` argument to instantiate the encoding format for actual client messages.
    """
    
    message = msg.encode(FORMAT)
    msg_length = len(message)
    send_length = str(msg_length).encode(FORMAT)
    send_length += b' ' * (HEADER - len(send_length))
    client.send(send_length)
    client.send(message)

send("Did you know...this message is being sent to you by BBS...haha!")


    