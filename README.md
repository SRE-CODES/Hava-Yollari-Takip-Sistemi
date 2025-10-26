# ✈️ HAVA YOLLARI TAKİP SİSTEMİ (SQL SERVER)

## 📖 Proje Hakkında
Bu proje, **Hava Yolları Takip Sistemi** için bir veritabanı tasarımıdır.  
Amaç; uçuşlar, yolcular, biletler, mürettebat, havaalanları ve diğer bileşenleri ilişkisel olarak modellemektir.

Projede **arayüz zorunlu değildir**, ancak veritabanı ilişkilerinin eksiksiz şekilde kurulması hedeflenmiştir.  
Veritabanı **Microsoft SQL Server** üzerinde çalışacak biçimde yazılmıştır.

---

## 🧩 Veritabanı Tabloları
| Tablo Adı | Açıklama |
|------------|-----------|
| Airlines | Havayolu şirketi bilgileri |
| Airports | Kalkış/varış havaalanları |
| Airplanes | Şirkete ait uçak bilgileri |
| Flights | Uçuş (sefer) bilgileri |
| Passengers | Yolcu bilgileri |
| Tickets | Satılan biletler |
| Crew | Mürettebat bilgileri |
| Flight_Crew | Uçuş–Mürettebat çoktan çoğa ilişkisi |
| Seats | Uçak koltuk düzenleri |
| Reservations | Yolcu rezervasyon bilgileri |
| Payments | Ödeme bilgileri |
| Baggage | Yolcu bagaj bilgileri |
| Flight_Status | Uçuşun anlık durumu |
| Maintenance | Uçak bakım kayıtları |

---

## 🔗 Tablolar Arası İlişkiler
| İlişki | Türü | Açıklama |
|--------|------|-----------|
| Airline → Airplane | 1 → N | Her havayolunun birden fazla uçağı olabilir |
| Airplane → Flight | 1 → N | Bir uçak birçok sefere çıkabilir |
| Flight → Ticket | 1 → N | Her uçuşta birden fazla bilet olabilir |
| Passenger → Ticket | 1 → N | Bir yolcu birden fazla bilet alabilir |
| Airline → Crew | 1 → N | Havayolunun birçok mürettebatı vardır |
| Flight ↔ Crew | N ↔ N | Flight_Crew tablosu üzerinden bağlanır |
| Airplane → Seat | 1 → N | Her uçakta birçok koltuk bulunur |
| Passenger → Reservation | 1 → N | Bir yolcu birçok rezervasyon yapabilir |
| Flight → Reservation | 1 → N | Bir uçuşta birden fazla rezervasyon olabilir |
| Ticket → Payment | 1 → 1 | Her biletin bir ödeme kaydı vardır |
| Ticket → Baggage | 1 → N | Her bilette birden fazla bagaj olabilir |
| Flight → Flight_Status | 1 → 1 | Her uçuşun bir durumu vardır |
| Airplane → Maintenance | 1 → N | Uçakların birçok bakım kaydı olabilir |

---

## 🧠 Teknolojiler
- **Veritabanı:** SQL Server  
- **Diyagram Aracı:** [dbdiagram.io](https://dbdiagram.io)  
- **Notasyon:** Chen Notasyonu (aşağıda)

---

## 🧱 Dosya Yapısı
HavaYollariTakipSistemi/
│
├── TabloOlusturmaHYTS.sql # CREATE TABLE komutları
├── TabloEkleme.sql # Ek CREATE TABLE komutları
├── DegerEkleme.sql # Örnek INSERT verileri
├── test_queries.sql # Örnek SELECT sorguları
├── diagram.dbml # dbdiagram.io diyagram kodu
└── README.md # Bu dosya


---
## UML Diyagramı
<img width="2166" height="1166" alt="Hava Yolları Takip Sistemi UML E-R Diagram" src="https://github.com/user-attachments/assets/09fb4cac-e9cc-4ce0-b151-04843552f685" />

## 🔶 Chen Notasyonu ile E-R Diyagramı

Chen notasyonu ilişkileri **şematik metin** olarak gösterir:  
(A = Entity, ◉ = Relationship, → = Cardinality)

