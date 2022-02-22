import 'package:api_example_app/controller/house_controller.dart';
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:get/get.dart';

class ChooseHouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _houseController = Get.put(HouseController());
    return Obx(() => Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(color : Colors.white,shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],),
                  titles: _houseController.listHouse.value.map((e) => e.name).toList(),
                  images: _houseController.images,
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {
                    _houseController.showDialogInput(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
