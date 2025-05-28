
String firebaseErrorMessage(String code) {
  switch (code) {
    case "invalid-email":
      return "Geçersiz e-posta";
    case "user-disabled":
      return "Kullanıcı engellendi";
    case "user-not-found":
      return "Kullanıcı bulunamadı";
    case "account-exists-with-different-credential":
      return "Farklı kimlik bilgileriyle hesap zaten var";
    case "wrong-password":
      return "Yanlış şifre";
    case "operation-not-allowed":
      return "İşleme izin verilmiyor";
    case "email-already-in-use":
      return "E-posta zaten kullanımda";
    case "weak-password":
      return "Zayıf şifre";
    case "network-request-failed":
      return "Ağ isteği başarısız oldu";
    case "too-many-requests":
      return "Çok fazla istek yapıldı";
    case "phone-number-already-exists":
      return "Telefon numarası zaten var";
    case "unknown":
      return "Bilinmeyen hata";
    case "invalid-credential":
      return "Geçersiz kimlik bilgisi";
    default:
      return "Bir hata oluştu: $code";
  }
}
