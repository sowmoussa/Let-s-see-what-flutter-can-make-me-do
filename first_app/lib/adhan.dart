import 'package:flutter/material.dart';

class Adhan extends StatelessWidget {
  // const Adhan({Key key}) : super(key: key);

  final Color color1 = Color(0xFF92E3B4);
  final Color color2 = Color(0xFF044E23);
  final Color color3 = Color(0xFF3A684E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Waxtū Jüli",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              "Yeçal Waxtū bi",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            _iconText(
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 15,
                ),
                "Teungueth",
                "Colobane, Gouye Mouride"),
            SizedBox(
              height: 20,
            ),
            _iconText(
                Icon(
                  Icons.compass_calibration,
                  color: Colors.white,
                  size: 15,
                ),
                "Qibla",
                "Pencú"),
            SizedBox(
              height: 20,
            ),
            _iconText(
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 15,
                ),
                "29 Ramadhan 1442 AH",
                "wëru koor"),
            SizedBox(
              height: 40,
            ),
            _wakhtouJouli("Fadjr", "05:26"),
            SizedBox(height: 10),
            _wakhtouJouli("Subh", "06:42"),
            SizedBox(height: 10),
            _wakhtouJouli("TIsbar", "13:05"),
            SizedBox(height: 10),
            _wakhtouJouli("Takküsan", "16:20"),
            SizedBox(height: 10),
            _wakhtouJouli("Timis", "19:29"),
            SizedBox(height: 10),
            _wakhtouJouli("Guëwé", "20:40"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "Gëstu si khassidas yi",
                  style: TextStyle(color: color2, fontWeight: FontWeight.bold),
                )),
                /*ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "Test",
                  style: TextStyle(color: color2, fontWeight: FontWeight.bold),
                ))*/
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _iconText(Icon icon, String title, String subtitle) {
    double h = 30;
    double w = 30;
    Container left = Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          color: color3, borderRadius: BorderRadius.circular(w / 2)),
      child: icon,
    );

    Column right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          subtitle,
          style: TextStyle(color: Colors.white, fontSize: 10),
        )
      ],
    );

    return Row(
      children: [
        left,
        SizedBox(
          width: 10,
        ),
        right
      ],
    );
  }

  Widget _wakhtouJouli(String name, String hour) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: color3, borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              hour,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.alarm, color: Colors.white,)
          ],
        )
      ]),
    );
  }
}
