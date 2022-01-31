import 'package:bitirme_projesi/entity/Sepet_yemekler.dart';
import 'package:bitirme_projesi/repo/yemek_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<List<Sepet_yemekler>> {
  YemekDetayCubit():super(<Sepet_yemekler>[]);

  var yrepo=YemekRepository();



  Future<void> sepetEkle(String sepet_yemek_id,String yemek_adi,String yemek_resim_adi,String yemek_fiyat,String yemek_siparis_adet,String kullanici_adi) async{
    await yrepo.sepeteEkle(sepet_yemek_id, yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);

  }
}