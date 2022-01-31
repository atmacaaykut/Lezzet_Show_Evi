import 'package:bitirme_projesi/views/Anasayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  var tfControllerKullanici=TextEditingController();
  var tfControllerSifre=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Kullanıcı Girişi")),
      body: Center(

       child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(width: 150,height: 150,child:
            Column(
              children: [
                Icon(Icons.home,color: Colors.lightGreen,size: 50,),
                Text("Lezzet Show \n      Evi",style: TextStyle(color:Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Satisfy'),),


              ],
            )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width:300,child: TextField(controller:tfControllerKullanici,decoration: InputDecoration(hintText: "Kullanıcı Adı"), )),
              ],
            ),
            SizedBox(width:300,child: TextField(controller:tfControllerSifre,obscureText: true, decoration: InputDecoration(hintText: "Şifre"), )),
            
            TextButton(onPressed: (){
              if(tfControllerKullanici.text=="aykutatmaca" && tfControllerSifre.text=="123"){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Anasayfa(kullanici:tfControllerKullanici.text)));
              }
              else{
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("HATA"),
                    content: Text("Kullanıcı Adı ve/veya Şifre Hatalı"),
                    actions: [
                      TextButton(onPressed: (){Navigator.pop(context);},
                          child: Text("Tamam"),
                      ),
                    ],
                  );

                });
                tfControllerKullanici.text="";
                tfControllerSifre.text="";
              }
            }, child: Text("GİRİŞ YAP"))
          ],
        ),
      ),

    );
  }
}
