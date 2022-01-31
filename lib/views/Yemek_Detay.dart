import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/entity/Yemekler.dart';
import 'package:bitirme_projesi/views/Sepet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Yemekdetay extends StatefulWidget {
 Yemekler yemek;
 String kullanici;


 Yemekdetay({required this.yemek,required this.kullanici});

  @override
  _YemekdetayState createState() => _YemekdetayState();
}

class _YemekdetayState extends State<Yemekdetay> {
  var tfcontroller=TextEditingController();

var adet=1;


  @override
void initState(){
    super.initState();

    tfcontroller.text="0";
  }


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
      body: Column(mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Text(widget.yemek.yemek_adi,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),),
          ),
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 30.0,bottom: 20.0),
               child: Container(height: 200,width: 200,
                 child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),),
             ),
           ],
         ),
          Padding(
            padding: const EdgeInsets.only(bottom:20.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${int.parse(widget.yemek.yemek_fiyat)*adet} ₺",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),)
            ],),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  if(adet==1){
                    adet=1;
                  }
                  if(adet>1){
                    adet--;
                  }
                });

              }, child: Text("-",style: TextStyle(fontSize: 30),)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Text(adet.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
                  width: 35,height: 35,color: Colors.white,
                ),
              ),

              ElevatedButton(onPressed: (){
                setState(() {
                  adet++;
                });
              }, child: Text("+",style: TextStyle(fontSize: 30),)),
            ],

          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                context.read<YemekDetayCubit>().sepetEkle(widget.yemek.yemek_id, widget.yemek.yemek_adi, widget.yemek.yemek_resim_adi, widget.yemek.yemek_fiyat, adet.toString(), widget.kullanici);
                Navigator.push(context,MaterialPageRoute(builder:(context)=>Sepet(kullanici: widget.kullanici,fiya: int.parse(widget.yemek.yemek_fiyat)*adet ,)));
                Navigator.pop(context);
                }, child: Text("SEPETE EKLE"))
            ],
          ),


          Spacer(),
          Container(width:600,height:50,color: Colors.green,child: TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>Sepet(kullanici: widget.kullanici,fiya: 0 ,)));
            //Navigator.push(context,MaterialPageRoute(builder:(context)=>Sepet(kullanici: widget.kullanici,fiya: int.parse(widget.yemek.yemek_fiyat)*adet ,)));
          }, child: Text("SEPETE GİT",style: TextStyle(color:Colors.white,fontSize:20 ),)))
        ],

      ),
    );
  }
}
