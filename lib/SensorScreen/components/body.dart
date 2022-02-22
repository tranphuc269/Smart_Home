import 'package:api_example_app/controller/body_controller.dart';
import 'package:api_example_app/routes/routes_cons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final _bodyController = Get.put(BodyController());
    return SafeArea(
      child: Obx(() => _bodyController.listRoom.isEmpty
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
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
                              'Ngày ${DateTime.now().day} tháng ${DateTime.now().month} năm ${DateTime.now().year}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Good Morning\n${_bodyController.user.value == null ? '' : _bodyController.user.value.name}',
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
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Text(
                                '16°',
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
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
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
                          des: _bodyController.listRoom.value[0].description,
                          icon: Image.network(
                            _bodyController.listRoom.value[0].image,
                            width: 60,
                            height: 60,
                          ),
                          title: _bodyController.listRoom.value[0].name,
                        ),
                        CustomCardRoom(
                          size: size,
                          des: _bodyController.listRoom.value[1].description,
                          icon: Image.network(
                            _bodyController.listRoom.value[1].image,
                            width: 60,
                            height: 60,
                          ),
                          title: _bodyController.listRoom.value[1].name,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomCardRoom(
                          size: size,
                          des: _bodyController.listRoom.value[2].description,
                          icon: Image.network(
                            _bodyController.listRoom.value[2].image,
                            width: 60,
                            height: 60,
                          ),
                          title: _bodyController.listRoom.value[2].name,
                        ),
                        CustomCardRoom(
                          size: size,
                          des: _bodyController.listRoom.value[3].description,
                          icon: Image.network(
                            _bodyController.listRoom.value[3].image,
                            width: 60,
                            height: 60,
                          ),
                          title: _bodyController.listRoom.value[3].name,
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
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 30),
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 96),
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
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
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
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Obx(() => Text(
                          '${Get.find<BodyController>().user.value.surName} ${Get.find<BodyController>().user.value.name}')),
                      accountEmail: Text('phuc26@gmail.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnS0qx-1oLsnydsekAckQS_uIFCWWSWwxDL2FL7wLRp_YHPRiwWfaNdsPrsuWdIBJ8EiI&usqp=CAU'),
                      ),
                      onDetailsPressed: () {},
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/fundo.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    ListTile(
                      title: Text('Thông tin tài khoản'),
                      leading: Icon(Icons.person),
                      onTap: () {
                        Get.toNamed(RoutesCons.profilePage);
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Các thành viên trong nhà'),
                      leading: Icon(Icons.group_add),
                      onTap: () {
                        Get.toNamed(RoutesCons.listUser);
                      },
                    ),
                    ListTile(
                      title: Text('Tin nhắn'),
                      leading: Icon(Icons.chat),
                      onLongPress: () {},
                    ),
                    ListTile(
                      title: Text('Gọi điện'),
                      leading: Icon(Icons.call),
                      onLongPress: () {},
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Cấu hình'),
                      leading: Icon(Icons.settings),
                      onLongPress: () {},
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Hỗ trợ'),
                      leading: Icon(Icons.report_problem),
                      onLongPress: () {},
                    ),
                    ListTile(
                        title: Text('Đóng'),
                        leading: Icon(Icons.close),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
                actions: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  )
                ],
              ),
            )),
    );
  }
}
