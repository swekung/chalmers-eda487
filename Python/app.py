import time
import serial
import requests
import json

sleep = 5 # Time to wait between pushes (seconds)
serial_port = u'/dev/cu.usbserial-DA00BTUT' # serial port of MD407
ser = serial.Serial(
    port=serial_port,
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS
)

ser.isOpen()

lastStr = "0";
str = "0";

while 1:
    r = requests.get('http://localhost:8888/message_request.php')
    s = r.content
    s="".join(s)
    jdata = json.loads(s)
    if s == lastStr:
        pass
    else:
        for d in jdata:
            for key, value in d.iteritems():
                pass
        print value
        for c in value:
            cBytes = c.encode('utf-8')
            ser.write(cBytes)
            time.sleep(0.1)
        d = '/'
        dBytes = d.encode('utf-8')
        ser.write(dBytes)
        print(d)
        lastStr = s
    time.sleep(sleep)
