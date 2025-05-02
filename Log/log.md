<pre><font color="#A2734C"><b># Log (Kayıt) Nedir? </b></font>

Log, bir sistemde, uygulamada veya serviste meydana gelen olayların zaman damgası ile birlikte kaydedildiği metin dosyalarıdır.

Bu kayıtlar sayesinde sistem yöneticileri veya geliştiriciler :

<font color="#A347BA"><b>* </b></font>Sorunları tespit edebilir.
<font color="#A347BA"><b>* </b></font>Güvenlik ihlallerini fark edebilir.
<font color="#A347BA"><b>* </b></font>Performans analizlerini yapabilir.
<font color="#A347BA"><b>* </b></font>Sistem davranışlarını izleyebilir.

<font color="#A2734C"><b>---------------------------------------------------------------------------------------------------------------------------------------------------------------</b></font>

<font color="#A2734C"><b>## Log Dosyaları Nerede Bulunur?</b></font>

<font color="#A347BA"><b>* </b></font>Linux sistemlerde log&apos;lar genellikle şu dizinlerde bulunur :

<font color="#2AA1B3"><b>```cmd </b></font>
<font color="#2AA1B3"><b>/var/log</b></font>
<font color="#2AA1B3"><b>```</b></font>
<font color="#A347BA"><b>* </b></font>Bu dizin altındaki önemli log dosyalarından bazıları :


| Dosya Adı | Açıklama |
|--|--|
| /var/log/syslog | Sistem genel olayları (Debian/Ubuntu) |
| /var/log/messages | Sistem genel olayları (RedHat/CentOS) |
| /var/log/dmesg | Kernel boot mesajları |
| /var/log/auth.log | Yetkilendirme, login, sudo kayıtları |
| /var/log/kern.log | Kernel mesajları |
| /var/log/Xorg.0.log | Grafik arayüzleri logları |
| /var/log/apt/history.log | APT ile yapılan paket kurulumları |
| /var/log/journal | systemd&apos;nin binary log arşivi |

<font color="#A2734C"><b>---------------------------------------------------------------------------------------------------------------------------------------------------------------</b></font>

<font color="#A2734C"><b>## Loglar Ne İşe Yarar?</b></font>

Sistem programlamada ve yönetiminde log dosyaları şu işlevlerde kullanılır :
<font color="#A347BA"><b>* </b></font><font color="#26A269"><b>**Hata tespiti :**</b></font> Program neden çöktü?
<font color="#A347BA"><b>* </b></font><font color="#26A269"><b>**Güvenlik incelemesi :**</b></font> Kim sisteme girmeye çalıştı?
<font color="#A347BA"><b>* </b></font><font color="#26A269"><b>**Test ve izleme :**</b></font> Uygulama nasıl çalıştı?
<font color="#A347BA"><b>* </b></font><font color="#26A269"><b>**Performans analizi :**</b></font> Ne zaman yavaşladı?

<font color="#A2734C"><b>---------------------------------------------------------------------------------------------------------------------------------------------------------------</b></font>

<font color="#A2734C"><b>## Log Nasıl İncelenir?</b></font>

<font color="#A2734C"><b>### a) Temel Komutlar : </b></font>

<font color="#A347BA"><b>* </b></font><font color="#26A269"><b>**cat**</b></font> - Log dosyasının tamamını göster :

<font color="#2AA1B3"><b>```cmd</b></font>
<font color="#2AA1B3"><b>cat /var/log/syslog</b></font>
<font color="#2AA1B3"><b>```</b></font>

<font color="#A2734C"><b>--------------------------------------------------------------------------</b></font>

<font color="#A347BA"><b>* </b></font><font color="#26A269"><b>**less**</b></font> - Sayfa sayfa gezinme :

<font color="#2AA1B3"><b>```cmd</b></font>
<font color="#2AA1B3"><b>less /var/log/syslog</b></font>
<font color="#2AA1B3"><b>```</b></font>

<font color="#A2734C"><b>------------------------------------------------------------------------</b></font>
</pre>
