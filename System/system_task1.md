# 1) Jetson Xavier NX'te GPIO Nasıl Kontrol Edilir?

* Jetson modüllerindeki GPIO pinleri, Linux sisteminde /sys/class/gpio/ veya libgpiod (yeni yöntem) üzerinden kontrol edilir. GPIO pinleri doğrudan işlemci üzerindedir ama pin numaraları SoC içindeki GPIO controller'lara göre belirlenmiştir - bu nedenle GPIO numarasını bulmak önemlidir.


## GPIO Kontrol Adımları (Yeni Yöntem : libgpiod)

* Jetpack 4.5+ sürümlerinde /sys/class/gpio artık deprecated (eski), yerine gpiod komutları kullanılır.

### Örnek : GPIO kontrol (Jetson Xavier NX)

#### 1) GPIO pinlerini bulup konfigüre etmek : 

```cmd
sudo jetson-io.py
```
* Yukarıdaki komutu çalıştırarak pinleri konfigüre edebiliriz.

#### 2) Pin numarasını öğrenmek : 

* Örneğin Pin 7 GPIO216 olarak çalışır. Bu değer gpiochip0 üzerinde olabilir.

#### 3) GPIO çıkışı yapmak : 

```cmd
sudo apt install gpiod
gpioset gpiochip0 216=1  # GPIO216 HIGH yapar
gpioset gpiochip0 216=0  # GPIO216 LOW yapar
```

#### 4) GPIO giriş okumak : 

```cmd
gpioget gpiochip0 216
```

# 2) UART, I2C, R232, RS485, CAN Nedir?

* Jetson modüllerinde bu arabirimler 40-pin GPIO header üzerinden kullanılabilir ama bazıları DTB (Device Tree Blob) üzerinden etkinleştirilmeli. 

### UART (Universal Asynchronous Receiver Transmitter)

* Jetson üzerinde /dev/ttyTHSx veya /dev/ttySx olarak görünür.
* **ttyTHSx :** Tegra High-Speed UART (Jetson SoC UART)
* **ttySx :** Standart serial UART

**UART portlarını Jetson'da kullanmak için : 

* Pinleri etkinleştir (jetson-io.py)
* UART üzerinden veri gönder/al (örneğin Python'da pyserial ile)

```python
import serial
ser = serial.Serial('/dev/ttyTHS1', 115200)
ser.write(b'Hello UART\n')
print(ser.readline())
```
* Jetson Xavier NX üzerinde UART1 (ttyTHS0) genellikle debug için ayrılmıştır.

### RS232 ve RS485

* Jetson üzerinde RS232/RS485 yoktur, ama UART üzerinden dönüştürücü kullanarak yapılabilir.

### I2C (Inter-Integrated Curcuit)

* Jetson Xavier NX'te birden fazla I2C bus bulunur. (I2C0, I2C1...)
* Cihaz dosyaları : /dev/i2c-0, /dev/i2c-1 vs.
* I2C üzerinden sensör, EEPROM, IMU gibi cihazlar bağlanabilir.

#### I2C ile cihaz taramak için : 

```cmd
sudo apt install i2c-tools
sudo i2cdetect -y 1  # 1 numaralı I2C bus'taki cihazları gösterir.
```

### CAN (Controller Area Network)

* Jetson Xavier NX'te yerleşik CAN yoktur, ama **MCP2515 SPI CAN** modülü ile CAN eklenebilir.
* SPI üzerinden bağlanır, DTB dosyasında CAN yapılandırılır.
* Kullanım için **can-utils** paketi kullanılır.

```cmd
sudo apt install can-util
sudo ip link set can0 up type can bitrate 500000
candump can0
```











