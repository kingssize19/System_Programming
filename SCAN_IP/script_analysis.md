```bash
#!/bin/bash
```
* Bu satır **shebang** (hashbang) olarak adlandırılır ve bu script'in bash kabuğu ile çalıştırılması gerektiğini belirtir.

```bash
trap "echo -e '\nScript terminated by user.'; exit 1" SIGINT
```
* Bu satır bir **sinayl yakalayıcı (signal trap)** tanımlar. **SIGINT**, genellikle kullanıcı Ctrl+C ile scripti durdurmaya çalıştığında gönderilir.
* trap komutu, bu sinyal geldiğinde çalıştırılacak komutu tnaımlar.
* Burada yapılacak şey: ekrana **Script terminated by user.** mesajını bastıktan sonra **exit 1** ile scripti sonlandırmak.


```bash
for ip in $(seq 100 200); do
```
* Bu bir for döngüsüdür. **seq 100 200** komutu, 100'den 200'e kadar olan sayıları üretir.
* Bu sayılar **ip** adlı değişkene sırayla atanır.

```cmd
    if ping -c1 -W1 10.62.2.$ip > /dev/null; then
```
* Bu satırda her bir IP adresi için ping gönderilir:
  * **-c1 :** Sadece 1 paket gönder.
  * **-W1 :** 1 saniye bekle, cevap gelmezse timeout.
  * **> /dev/null :** stdout'u gizle (ekrana yazma).
ping başarılı olursa then bloğu çalışır (yani IP kullanılıyorsa).


```bash
    echo "In use    : 10.62.2.$ip"
```
* Eğer IP'ye ping cevabı geldiyse, IP'nin kullanımda olduğunu belirtir.

```cmd
	else
		echo "Available : 10.62.2.$ip"
```
* Eğer ping cevabı gelmezse, IP'nin boş (mevcut) olduğunu varsayar.


## Genl Özet : 

* Bu script, 10.62.2.100 ila 10.62.2.200 IP adresleri arasında bir ping taraması yapar ve her IP'nin:
  * Kullanımda mı (In use) yoksa
  * Uygun mu (Avaliable) olduğunu ekrana yazar.


































