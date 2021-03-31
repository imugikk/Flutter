import 'dart:ui';

import 'package:coba_flutter/model/gojek_model.dart';
import 'package:coba_flutter/utils/size_config.dart';
import 'package:coba_flutter/widgets/custom_text.dart';
import 'package:coba_flutter/widgets/gopay_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  PanelController controller = new PanelController();
  double _panehHeightClosed;
  double _panelHeightOpen;
  List<Promo> listTp = [];
  List<Category> listCat = [];

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _panelHeightOpen = SizeConfig.screenHeight / 1.11;
    _panehHeightClosed = SizeConfig.screenHeight / 2;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SlidingUpPanel(
          maxHeight: _panelHeightOpen,
          minHeight: _panehHeightClosed,
          parallaxEnabled: true,
          parallaxOffset: .5,
          controller: controller,
          defaultPanelState: PanelState.CLOSED,
          body: _body(),
          panelBuilder: (sc){
            return _panel(sc);
          },
          borderRadius: BorderRadius.only(
            topLeft : Radius.circular(28.0),
            topRight : Radius.circular(28.0)
          ),
            onPanelSlide: (double pos) => setState((){}),
        )
      ],
    );
  }

  Widget _panel(ScrollController sc){
    return ListView(
      controller: sc,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ],
        ),
        SizedBox(height: 18.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: SizeConfig.screenHeight /12,
                padding: EdgeInsets.only(left: 20, top:10, bottom: 10),
                child: TextFormField(
                  enabled: false,
                  cursorColor: Colors.orange[200],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search, color: Colors.black, size: 30,),
                    hintText: "Cari ...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.black)
                    )
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Image.asset("assets/img/usr2.png",
                color: Colors.green,
                width: 40, height: 40,
              ),
            ),
            SizedBox(width: 10,)
          ],
        ),
        Container(
          height: 120,
          margin: EdgeInsets.all(8),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Color(0xff176ba3),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/img/gopay.png",
                          height: 25,
                          fit: BoxFit.cover,
                            width: 70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text('Payment made easy \n with GoPay'),
                        ),
                        SizedBox(height: 4,)
                      ],
                    ),
                  ),
                  GopayCard(Icons.upload_outlined, "Pay"),
                  GopayCard(Icons.add, "Top Up"),
                  GopayCard(Icons.explore, "Explore"),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 18.0,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: customText("Top picks for you", SizeConfig.blockVertical*3),
        ),
        SizedBox(height: 18.0,),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) => Container(
              child: Center(
                child: Card(
                  color: listCat[i].isActive == true
                      ? Colors.green
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 8, top: 8, bottom: 8),
                    child: Text(listCat[i].name, style: TextStyle(
                      color: listCat[i].isActive == true
                          ? Colors.white
                          : Colors.grey,
                    ),),
                  ),
                ),
              ),
            ), itemCount: listCat.length,
          )
        ),
        SizedBox(height: 18.0,),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: customText("Info Terbaru", SizeConfig.blockVertical*3),
        ),
        SizedBox(height: 4.0,),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listTp.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int i){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              child: Container(
                child: Column(
                  children: [
                    Image.asset(listTp[i].img,
                    fit: BoxFit.cover,
                      width: SizeConfig.screenWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(listTp[i].name),
                    )
                  ],
                ),
              ),
              ),
            );
        }),
      ],
    );
  }

  Widget _body(){
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(child: Center(child: Image.asset("assets/img/home.jpg"))),
          ),
          Flexible(
            flex: 1,
            child: Container(child: Center(child: Text(''))),
          ),
        ],
      ),
    );
  }

  void setData() {
    setState(() {
      //set data top pick for u
      listCat.add(new Category(name: "all", isActive: true));
      listCat.add(new Category(name: "Covid-19", isActive: false));
      listCat.add(new Category(name: "Donation", isActive: false));
      listCat.add(new Category(name: "Entertaiment", isActive: false));
      listCat.add(new Category(name: "Food", isActive: false));

      //set data promo
      listTp.add(new Promo(
        name: 'Promo Giant Express: Harga Spesial Mama Lime',
        img: "assets/img/gojek1.webp"
      ));

      listTp.add(new Promo(
          name: '#JajanDariRumah Teru di GoFood',
          img: "assets/img/gojek2.webp"
      ));

    });
  }
}