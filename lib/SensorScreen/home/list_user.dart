import 'package:api_example_app/controller/list_user_controller.dart';
import 'package:api_example_app/model/user_entity.dart';
import 'package:api_example_app/routes/routes_cons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_list_tile/simple_list_tile.dart';

class ListUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ListUserController());
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Danh sách user",
            style: TextStyle(color: Colors.black, fontSize: 25)),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white38,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => _controller.listUser.isEmpty
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: _controller.listUser.value
                        .map((e) => _UserComponent(
                              userEntity: e,
                            ))
                        .toList(),
                  ),
                ),
              ),
      ),
    );
  }
}

class _UserComponent extends StatelessWidget {
  _UserComponent({this.userEntity});

  UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SimpleListTile(
          onTap: () {
            Get.toNamed(RoutesCons.otherUserController, arguments: userEntity.userId);
          },
          title: Text(
            '${userEntity.surName} ${userEntity.name}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            userEntity.email,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          leading: Image.network(
            userEntity.image,
          ),
          borderRadius: BorderRadius.circular(20),
          tileColor: Colors.grey[300],
          circleColor: Colors.grey[100],
          circleDiameter: 200,
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
