import time
import serial
import requests
import json

sleep = 5 # Time to wait between pushes (seconds)
serial_port = "/dev/cu.wchusbserial1410" # serial port of MD407
ser = serial.Serial(
    port=serial_port,
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    startbits=serial.STARTBITS_ONE,
    bytesize=serial.EIGHTBITS
)

ser.isOpen()

lastStr = "0";

while 1:
    r = requests.get('http://localhost:8888/message_request.php')
    s = r.content
    print(s)
    if s == lastStr:

    else:
        ser.write(s)
        input = input(">> ")
        if input == 'exit':
            ser.close()
            exit()
    time.sleep(sleep)
