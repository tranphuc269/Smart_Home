import 'package:flutter/material.dart';
import '../../constants.dart';
import 'custom_card.dart';
import 'custom_card_room.dart';

class SensorScreenBody extends StatefulWidget {
  @override
  _SensorScreenBodyState createState() => _SensorScreenBodyState();
}

class _SensorScreenBodyState extends State<SensorScreenBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: kDarkGreyColor,
                ),
                Text(
                  'Home',
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
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/gi1.gif',
                      scale: 1.5,
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ngày 4 tháng 1 năm 2021',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Good Morning,\nnhóm 12',
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
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nhiệt độ',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '40°',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Độ ẩm',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '59%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCardRoom(
                  size: size,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Phòng Khách",
                ),
                CustomCardRoom(
                  size: size,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Phòng ngủ",
                ),
              ],
            ),
            SizedBox(height: size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCardRoom(
                  size: size,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Nhà vệ sinh",
                ),
                CustomCardRoom(
                  size: size,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 55,
                    color: Colors.grey.shade400,
                  ),
                  title: "Phòng học",
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
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
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
                            "Phòng mới",
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
                  onTap: () {
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
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(top: 20, left: 30),
                                child: Wrap(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Nhập tên phòng'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(horizontal: 96),
                                      child: GestureDetector(
                                        child: Text(
                                          'Thêm phòng',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.black,
                                          border:
                                              Border.all(color: Colors.black)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                )));
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
