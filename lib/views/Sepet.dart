import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/entity/Sepet_yemekler.dart';
import 'package:bitirme_projesi/views/Anasayfa.dart';
import 'package:bitirme_projesi/views/Yemek_Detay.dart';
import 'package:bitirme_projesi/views/giris_sayfasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sepet extends StatefulWidget {
 String kullanici;
int fiya;

 Sepet({required this.kullanici,required this.fiya}); // Sepet({required this.kullanici});

  @override

  _SepetState createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  var tfController=TextEditingController();

int sayi=0;
String metin="";
  var topFiy=<int>[];
  int toplam=0;


  @override
void initState() {
  super.initState();
  context.read<SepetCubit>().sepetiGetir(widget.kullanici);
  topFiy.add(widget.fiya);
//sayi=widget.fiya;
//tfController.text=sayi.toString() ;

}

  @override

  Widget build(BuildContext context) {
    return Scaffold(floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

      
      body: BlocBuilder<SepetCubit,List<Sepet_yemekler>>(
            builder: (context,syemeklerListesi){
              if(syemeklerListesi.isNotEmpty){

                return ListView.builder(
                  itemCount: syemeklerListesi.length,
                  itemBuilder: (context,indeks){
                    var syemek = syemeklerListesi[indeks];




                    return Card(
                      child: SizedBox(height: 50,
                        child: Row(
                          children: [
                            SizedBox(width: 50,height: 50,child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${syemek.yemek_resim_adi}"),),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("${syemek.yemek_adi}        Adet:${syemek.yemek_siparis_adet}           Fiyat: ${syemek.yemek_fiyat}₺"),
                            ),
                            Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${syemek.yemek_adi} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      setState(() {

                                        context.read<SepetCubit>().sepettenYemekSil(syemek.sepet_yemek_id.toString(),syemek.kullanici_adi);
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet(kullanici: widget.kullanici,fiya: 0,)));


                                      });
                                    },
                                  ),
                                ),
                              );
                            }, icon: Icon(Icons.cancel,color: Colors.green,)),

                          ],
                        ),
                      ),
                    );


                  },

                );

              }else{
                return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sepetinizde Ürün Yok",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ],
                );
              }
            },
          ),



      floatingActionButton: FloatingActionButton.extended(onPressed: (){



      },
        label: Text("TOPLAM: 361 ₺",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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




