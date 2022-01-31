import 'package:bitirme_projesi/entity/Sepet_yemekler.dart';

class SepetYemeklerCevap{

  List<Sepet_yemekler> sepetYemekler;
  int success;

  SepetYemeklerCevap(this.sepetYemekler, this.success);

  factory SepetYemeklerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray=json["sepet_yemekler"] as List;
    List<Sepet_yemekler> sepetYemekler=jsonArray.map((jsonArrayNesnesi)
    => Sepet_yemekler.fromJson(jsonArrayNesnesi)).toList();
    return SepetYemeklerCevap(sepetYemekler,json["success"] as int);
  }
}