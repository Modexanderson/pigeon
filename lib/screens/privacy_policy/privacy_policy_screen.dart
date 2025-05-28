import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/constants.dart';
import '../../widgets/title_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TitleText(),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(),
                  ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text(
                      'Gizlilik Sözleşmesi',
                      style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric( horizontal: 20.w),
                    child: Text(
                      '''
Bu gizlilik sözleşmesi, Pigeon Haber Sitesi'nin kullanıcılarının gizliliğini koruma taahhüdünü açıklamaktadır. Lütfen bu metni dikkatlice okuyunuz.

1. Bilgi Toplama ve Kullanma
Pigeon Haber Sitesi, kullanıcıların kişisel bilgilerini (ad, e-posta adresi, konum bilgisi vb.) kaydedebilir. Bu bilgiler, kullanıcıların sitemizi kullanımını kolaylaştırmak, kişiselleştirilmiş deneyimler sunmak, iletişim kurmak veya istatistiksel analizler yapmak amacıyla kullanılabilir. Kullanıcı bilgileri, yalnızca hizmet sunumu amacıyla veya yasal gereklilikler doğrultusunda üçüncü taraflarla paylaşılabilir.

1. Çerezler
Pigeon Haber Sitesi, çerezleri kullanabilir. Çerezler, kullanıcıların tercihlerini hatırlamamıza ve siteyi daha verimli bir şekilde çalıştırmamıza yardımcı olur. Kullanıcılar, tarayıcı ayarlarını değiştirerek çerezleri reddedebilir veya çerez bildirimlerini alabilir. Ancak, çerezlerin devre dışı bırakılması bazı site özelliklerinin düzgün çalışmasını engelleyebilir.

1. Bağlantılar
Pigeon Haber Sitesi, diğer web sitelerine bağlantılar içerebilir. Bu bağlantılar üzerindeki gizlilik uygulamaları ve içeriklerden sorumlu değiliz. Diğer web sitelerini ziyaret ettiğinizde, kendi gizlilik politikalarını okumanızı öneririz.

1. Güvenlik
Pigeon Haber Sitesi, kullanıcı bilgilerini korumak için uygun güvenlik önlemlerini alır. Ancak, internet üzerinden veri iletiminin tamamen güvenli olmadığını unutmayınız. Bilgilerinizi gönderirken dikkatli olmanızı ve güvenli olmayan unsurlara karşı tedbirli davranmanızı öneririz.

1. Gizlilik Politikasının Güncellenmesi
Pigeon Haber Sitesi, gizlilik politikasını zaman zaman güncelleyebilir. Herhangi bir güncelleme olduğunda, kullanıcılarımızı bilgilendirmek için uygun yöntemleri kullanacağız. Güncellenmiş gizlilik politikasını kabul etmemeniz halinde, siteyi kullanmayı tercih etmeme hakkınız bulunmaktadır.

                                ''',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
