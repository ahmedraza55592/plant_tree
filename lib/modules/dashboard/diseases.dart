import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_tree/modules/dashboard/models/disease_model.dart';
import 'package:plant_tree/styles/index.dart';

import '../index.dart';



class Disease extends StatefulWidget {
  const Disease({Key? key}) : super(key: key);

  @override
  State<Disease> createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  void initState() {
    super.initState();
    loadDataFromJson();
  }

  loadDataFromJson() async {
    //root bundle return the future so we need to wait
    final jsonData = await rootBundle.loadString("assets/files/diseases.json");
    final decodeData = jsonDecode(jsonData);
    var diseaseData = decodeData["diseases"];
    DiseaseModel.diseaseItems =
        List.from(diseaseData).map<DiseaseItem>((item) => DiseaseItem.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Diseases",
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
      body: DiseaseModel.diseaseItems != null
          ? ListView.builder(
              itemCount: DiseaseModel.diseaseItems?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiseaseDetail(
                                  diseaseItems: DiseaseModel.diseaseItems![index],
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
                            bottom: index == DiseaseModel.diseaseItems!.length - 1.0
                                ? 30.0
                                : 0.0),
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(DiseaseModel.diseaseItems![index].image!),
                          ),
                        ),
                      ),
                      Text(DiseaseModel.diseaseItems![index].name!,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
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
