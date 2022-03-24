import 'package:flutter/material.dart';
import 'package:plant_tree/modules/authentication/provider/user_provider.dart';
import 'package:plant_tree/modules/dashboard/models/plants_model.dart';
import 'package:provider/provider.dart';

class MyPlants extends StatelessWidget {
  const MyPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Something"),
      ),
      body: StreamBuilder<List<Plants>>(
          stream: userInfo.getUserPlantInfo,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {








                return Column(
                  children: [
                    Text("Lenght : ${snapshot.data?.length}"),
                    Text("Address is: ${snapshot.data?[index].latitude} && ${snapshot.data?[index].latitude}"),
                    Text("Address is ${userInfo.address}"),

                    Text("Plants Name by ${snapshot.data?[index].userName} and Plant Name ${snapshot.data?[index].plantName}"),
                    
                  ],
                );
              },
            );
          }),
    );
  }
}
