import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_tree/modules/index.dart';
import 'package:plant_tree/styles/index.dart';

import 'models/trees_model.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  void initState() {
    super.initState();
    loadDataFromJson();
  }

  loadDataFromJson() async {
    //root bundle return the future so we need to wait
    final jsonData = await rootBundle.loadString("assets/files/trees.json");
    final decodeData = jsonDecode(jsonData);
    var treeData = decodeData["trees"];
    Trees.items =
        List.from(treeData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Library",
          style: TextStyles.body22,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: AppColors.appBarColor),
          ),
        ),
      ),
      body: Trees.items != null
          ? ListView.builder(
              itemCount: Trees.items?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibraryDetail(
                                  items: Trees.items![index],
                                )));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 30.0,
                            left: 15.0,
                            right: 15.0,
                            bottom: index == Trees.items!.length - 1.0
                                ? 30.0
                                : 0.0),
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(Trees.items![index].image!),
                          ),
                        ),
                      ),
                      Text(Trees.items![index].name!,
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              })
          : const Center(
            child: CircularProgressIndicator(
                color: Colors.black,
              ),
          ),
    );
  }
}
