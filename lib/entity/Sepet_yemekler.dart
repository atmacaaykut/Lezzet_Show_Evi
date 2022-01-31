class Sepet_yemekler{
  String sepet_yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  String yemek_siparis_adet;
  String kullanici_adi;

  Sepet_yemekler(this.sepet_yemek_id, this.yemek_adi, this.yemek_resim_adi,
      this.yemek_fiyat, this.yemek_siparis_adet, this.kullanici_adi);

  factory Sepet_yemekler.fromJson(Map<String,dynamic> json){
    return Sepet_yemekler(json["sepet_yemek_id"] as String,
        json["yemek_adi"] as String,
        json["yemek_resim_adi"] as String,
        json["yemek_fiyat"] as String,
        json["yemek_siparis_adet"] as String,
        json["kullanici_adi"] as String);

  }
}