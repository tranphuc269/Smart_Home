import 'package:api_example_app/SensorScreen/components/custom_card.dart';
import 'package:api_example_app/radar.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class HomeDetailScreen extends StatefulWidget {
  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: kDarkGreyColor,
                ), onPressed: Navigator.of(context).pop,),
                Text(
                  'Phòng khách',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: size.height * 0.045,
                  width: size.width * 0.095,
                  decoration: BoxDecoration(
                    color: kBgColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: kDarkGreyColor,
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Chào mừng bạn đến \nphòng khách',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: size.height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.ac_unit,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Điều hoà",
                  statusOn: "Bật",
                  statusOff: "Tắt",
                ),
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.lightbulb_outline,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Bóng đèn",
                  statusOn: "Bật",
                  statusOff: "Tắt",
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.opacity,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Vòi nước",
                  statusOn: "DETECTED",
                  statusOff: "Không rõ",
                ),
                CustomCard(
                  size: size,
                  icon: Icon(
                    Icons.library_music,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Radio",
                  statusOn: "Bật",
                  statusOff: "Tắt",
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            Container(
              height: 75,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kBgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(3, 3),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    offset: Offset(-3, -3),
                  ),
                ],
              ),
              child: GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Thêm",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Thiết bị mới",
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                    ),
                    builder: (BuildContext context) {
                      return Padding(
                          padding: MediaQuery.of(context).viewInsets.copyWith(top: 50),
                          child: Container(
                            height: 250,
                              child: Wrap(
                                children: <Widget>[
                                  RadarView(),
                                  const SizedBox(height: 25,),
                                ],
                              )));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}