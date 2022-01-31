import 'package:bitirme_projesi/entity/Yemekler.dart';
import 'package:bitirme_projesi/repo/yemek_repository.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit():super(<Yemekler>[]);

var yrepo=YemekRepository();


  Future<void> yemekleriYukle() async{
    var liste=await yrepo.tumYemekleriAl();
    emit(liste);
  }

}