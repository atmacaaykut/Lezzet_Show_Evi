import 'package:bitirme_projesi/entity/Sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/Yemekler.dart';
import 'package:bitirme_projesi/repo/yemek_repository.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetCubit extends Cubit<List<Sepet_yemekler>> {
  SepetCubit():super(<Sepet_yemekler>[]);

  var yrepo=YemekRepository();


  Future<void> sepettenYemekSil(String sepet_yemek_id,String kullanici_adi) async{
    var liste=await yrepo.sepettenSil(sepet_yemek_id, kullanici_adi);
    await sepetiGetir(kullanici_adi);

  }
  Future<void> sepetiGetir(String kullanici_adi) async{
    var sliste=await yrepo.sepettenAl(kullanici_adi);
    emit(sliste);

  }

}