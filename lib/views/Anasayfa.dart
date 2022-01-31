import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_projesi/entity/Yemekler.dart';
import 'package:bitirme_projesi/views/Sepet.dart';
import 'package:bitirme_projesi/views/Yemek_Detay.dart';
import 'package:bitirme_projesi/views/giris_sayfasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Anasayfa extends StatefulWidget {

  String kullanici;

  Anasayfa({required this.kullanici});

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(left:50.0),
    child: Text("Lezzet Show Evi",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Satisfy' )),
    ),
    Padding(
    padding: const EdgeInsets.only(left:10.0),
    child: Icon(Icons.home,size: 30,),
    ),
    ],),),
      body: BlocBuilder<AnasayfaCubit,List<Yemekler>>(
        builder: (context,yemeklerListesi){
          if(yemeklerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yemeklerListesi.length,
              itemBuilder: (context,indeks){
                var yemek = yemeklerListesi[indeks];

                return GestureDetector(
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Yemekdetay(yemek: yemek,kullanici: widget.kullanici,)))
                        .then((_){context.read<AnasayfaCubit>().yemekleriYukle();});
                  },

                  child: Card(
                    child: SizedBox(height: 150,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(width:125,height: 125,child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}")),
                          Padding(
                            padding: const EdgeInsets.only(left:16.0,top: 30.0),
                            child: Column(
                              children: [
                                Icon(Icons.timer,color: Colors.red,size: 30,),
                                Text("30 dk içinde\n kapınızda!",style: TextStyle(color:Colors.green,fontSize: 15),)
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                              Text(" ${yemek.yemek_adi} ",style: TextStyle(color:Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Kaushan' ),),
                            Text("${yemek.yemek_fiyat} TL",style: TextStyle(color:Colors.green,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'Kaushan'), ),

                            ]
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa(kullanici: widget.kullanici)));
          },child: Icon(Icons.list)),
              label:"Ana Sayfa"
          ),
          BottomNavigationBarItem(icon: GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet(kullanici: widget.kullanici,fiya: 0,)));
          },child: Icon(Icons.shop)),
              label:"Sepet"
          ),
          BottomNavigationBarItem(icon: GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GirisSayfasi()));
          },child: Icon(Icons.person)),
              label:"Giriş Sayfası"
          ),
        ],
      ),
    );
  }
}
