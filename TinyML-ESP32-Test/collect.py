import serial

ser = serial.Serial('/dev/cu.usbserial-0001', 9600, timeout=1)

print("Collecting sensor data.")
print("Keep STILL for 10 seconds.")
print("Then MOVE for 10 seconds.")
print("Press Ctrl-C when finished.")

with open("sensor_data.txt", "w") as f:
    try:
        while True:
            line = ser.readline().decode(errors="ignore")
            if line:
                print(line, end="")
                f.write(line)
    except KeyboardInterrupt:
        print("\nSaved to sensor_data.txt")
