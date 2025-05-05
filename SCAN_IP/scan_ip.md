# AĞ'a Bağlı Olan/Olmayan Cihazları GÖrüntülemek 

### Yöntem 1 : fping ile boş IP taraması

```cmd
fping -a -g 10.62.2.1 10.62.2.254 2>/dev/null
```
* Bu komut, 10.62.2.1 - 10.62.2.254 aralığında yanıt veren IP'leri listeler.
* Yanıt vermeyen IP'ler boş olabilir.
* Daha sonra -u parametresi ile yanıt vermeyen (boş) IP'leri gösterebiliriz.

```cmd
fping -u -g 10.62.2.1 10.62.2.254 2> /dev/null
```

### Yöntem 2 : arp-scan yerel ağ taraması

```cmd
arp-scan --localnet yada arp-scan --interface=eth0 --localnet
```
* Bu komut, ARP üzerinden aktif cihazları listeler.

### Yöntem 3 : fping ile ilgili IP adresine ping atmak

* fping ile ilgili IP adresine ping atarız cevap gelirse o IP adresi ayakta anlamını taşır.

```cmd
root@hayati-pc:/home/hayati/Desktop# fping 10.62.2.71
10.62.2.71 is alive
```

```cmd
root@hayati-pc:/home/hayati/Desktop# fping 10.62.2.86
ICMP Host Unreachable from 10.62.2.120 for ICMP Echo sent to 10.62.2.86
ICMP Host Unreachable from 10.62.2.120 for ICMP Echo sent to 10.62.2.86
ICMP Host Unreachable from 10.62.2.120 for ICMP Echo sent to 10.62.2.86
ICMP Host Unreachable from 10.62.2.120 for ICMP Echo sent to 10.62.2.86
10.62.2.86 is unreachable
```
