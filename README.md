# Mini Katalog Uygulaması

Flutter Eğitim Projesi - Basit bir ürün katalog uygulaması.

## Proje Hakkında

Bu proje, Flutter ile mobil uygulama geliştirme eğitimi kapsamında geliştirilmiş temel seviye bir katalog uygulamasıdır. Uygulama, ürün listeleme, detay görüntüleme ve sepet yönetimi fonksiyonlarını içerir.

## Özellikler

- **Ürün Listeleme**: GridView ile ürün kartları
- **Kategori Filtreleme**: Ürünleri kategoriye göre filtreleme
- **Arama**: Ürün adı ve açıklamasına göre arama
- **Ürün Detayı**: Ürün detay sayfası
- **Sepet Simülasyonu**: Basit sepet yönetimi
- **Sayfa Geçişleri**: Navigator kullanımı

## Kullanılan Teknolojiler

- Flutter SDK (3.47)
- Dart (3.13)
- Material Design

## Proje Yapısı

```
lib/
├── main.dart                    # Uygulama giriş noktası
├── models/
│   └── product.dart            # Ürün veri modeli
├── pages/
│   ├── home_page.dart          # Ana sayfa
│   ├── product_detail_page.dart # Ürün detay sayfası
│   └── cart_page.dart          # Sepet sayfası
└── widgets/
    └── product_card.dart        # Ürün kartı widget'ı
```

## Gereksinimler

- Flutter SDK 3.0.0 veya üzeri
- Dart SDK 3.0.0 veya üzeri
- Android Studio / VS Code
- Android Emulator veya fiziksel cihaz

## Kurulum

1. Depoyu klonlayın:
```bash
git clone <https://github.com/yusufuznn/catalog-app.git>
cd mini_katalog
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## Flutter Sürümü

Flutter 3.x+ ile uyumludur.
