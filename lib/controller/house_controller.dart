import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:api_example_app/SensorScreen/components/sensor_screen.dart';
import 'package:api_example_app/global_data/global_data.dart';
import 'package:api_example_app/model/house_entity.dart';
import 'package:api_example_app/repository/base_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HouseController extends GetxController {
  final _repo = BaseRepository(collectionName: 'houses');
  final listHouse = List<HouseEntity>.empty(growable: true).obs;
  var images = List<Widget>.empty(growable: true).obs;
  String passwordHouse = '';

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    listHouse(await _repo.getAll((e) => HouseEntity.fromJson(e)));
    images.value = listHouse
        .map((element) => Hero(
              tag: element.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  element.image,
                  fit: BoxFit.cover,
                ),
              ),
            ))
        .toList();
    super.onInit();
  }

  void showDialogInput(BuildContext context, int index) async {
    passwordHouse = (await showTextInputDialog(
      context: context,
      title: 'Nhập mật khẩu để vào nhà',
      textFields: const [
        DialogTextField(
          hintText: 'Mật khẩu nhà',
        ),
      ],
      cancelLabel: 'Huỷ',
      okLabel: 'Truy cập'
    )).first;
    if(listHouse.value[index].password == passwordHouse){
      GlobalData.houseId = listHouse.value[index].id;
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => SensorScreen(),
        ),
      );
    }
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
