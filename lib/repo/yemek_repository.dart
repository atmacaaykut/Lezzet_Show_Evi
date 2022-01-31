import 'dart:convert';
import 'package:bitirme_projesi/entity/Sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/Yemekler.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler_cevap.dart';
import 'package:bitirme_projesi/entity/yemekler_cevap.dart';
import 'package:http/http.dart' as http;

class YemekRepository{

  List<Yemekler> parseYemeklerCevap(String cevap){
    return YemeklerCevap.fromJson(json.decode(cevap)).yemeklerListesi;
  }
  List<Sepet_yemekler> parseSYemeklerCevap(String scevap){
    return SepetYemeklerCevap.fromJson(json.decode(scevap)).sepetYemekler;
  }

  Future<List<Yemekler>> tumYemekleriAl() async{
    var url=Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var cevap=await http.get(url);
    return parseYemeklerCevap(cevap.body);   //Cevabın içeriğini getirir.

  }
Future<void> sepeteEkle(String sepet_yemek_id,String yemek_adi,String yemek_resim_adi,
    String yemek_fiyat,String yemek_siparis_adet, String kullanici_adi) async{
    var url=Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri={"sepet_yemek_id":sepet_yemek_id,"yemek_adi":yemek_adi, "yemek_resim_adi":yemek_resim_adi,
      "yemek_fiyat":(int.parse(yemek_fiyat)*int.parse(yemek_siparis_adet)).toString(),
      "yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi};
    var cevap=await http.post(url,body: veri);
    print("Sepete Ekle ${cevap.body}");
}

Future<void> sepettenSil(String sepet_yemek_id,String kullanici_adi)async{
    var url=Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri={"sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi};
    var cevap=await http.post(url,body: veri);
    print("Sepetten Silindi : ${cevap.body}");
}

  Future<List<Sepet_yemekler>> sepettenAl(String kullanici_adi) async{

    var url=Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri={"kullanici_adi":kullanici_adi};
    var cevap=await http.post(url,body: veri);
    return parseSYemeklerCevap(cevap.body);   //Cevabın içeriğini getirir.

  }
}