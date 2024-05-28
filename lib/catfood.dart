import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageConvert extends StatefulWidget {
  const PageConvert({Key? key}) : super(key: key);

  @override
  _PageConvertState createState() => _PageConvertState();
}

class _PageConvertState extends State<PageConvert> {
  TextEditingController input_unit = TextEditingController();
  TextEditingController input_discount = TextEditingController();
  TextEditingController input_distance = TextEditingController();

  double total = 0.00;
  String display_cost = "0.00";
  String display_total = "0.00";

  Widget ImageLogo() {
    return Container(
      width: 100,
      height: 150,
      child: Center(
        child: Image.asset("images/food.png"),
      ),
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
    );
  }

  Widget AppName() {
    return Container(
      child: Center(
        child: Text(
          "อาหารแมว",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(219, 112, 147, 1)),
        ),
      ),
    );
  }

  Widget price() {
    return Container(
      child: Center(
        child: Text(
          "ถุงละ150บาท",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(255, 105, 180, 0.8)),
        ),
      ),
    );
  }

  Widget foodUnit() {
    return Container(
      child: TextFormField( //สร้างช่อง
        controller: input_unit,
        decoration: InputDecoration(
            labelText: "จำนวน", //หัวข้อ
            hintText: "ระบุจำนวนที่ต้องการสั่ง", //คำที่อยู่ในช่อง
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      margin: EdgeInsets.fromLTRB(50, 20, 20, 0),
    );
  }

  Widget distance() {
    return Container(
      child: TextFormField(
        controller: input_distance,
        decoration: InputDecoration(
            labelText: "ค่าส่งตามระยะทาง",
            hintText: "กิโลเมตรละ5บาท",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      margin: EdgeInsets.fromLTRB(50, 20, 20, 0),
    );
  }

  Widget discount() {
    return Container(
      child: TextFormField(
        controller: input_discount,
        decoration: InputDecoration(
            labelText: "ส่วนลด",
            hintText: "กรอกส่วนลด %",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      margin: EdgeInsets.fromLTRB(50, 20, 20, 0),
    );
  }

  Widget ButtonConvert() {
    return Container(
      child: Center(
        child: RaisedButton(
          color: Colors.pink[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          child: Text(
            "คำนวน",
            style: TextStyle(
                fontSize: 18, color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
          onPressed: () {
            setState(() {
              var cost = (int.parse(input_unit.text) * 150) +
                  (double.parse(input_distance.text) * 5);
              total = cost - (cost*(double.parse(input_discount.text) / 100));
              display_cost = NumberFormat("#,###,000.00").format(cost);
              display_total = NumberFormat("#,###,000.00").format(total);
            });
          },
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
    );
  }

  Widget ResultConvert() {
    return Container(
      child: Center(
        child: Text(
          "ราคารวม " +display_cost + " บาท "+"ราคาหลังหักส่วนลด " + display_total + " บาท",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ร้านอันอัน"),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(children: [
            ImageLogo(),
            AppName(),
            price(),
            foodUnit(),
            distance(),
            discount(),
            ButtonConvert(),
            ResultConvert()
          ]),
        ),
      ),
    );
  }
}
