import 'package:flutter/material.dart';
import 'package:plant_tree/styles/index.dart';

import 'models/trees_model.dart';

class LibraryDetail extends StatelessWidget {
  final Item? items;
  const LibraryDetail({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        title: Text(
          items!.name!,
          style: TextStyles.primaryHeading,
        ),
        backgroundColor: AppColors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0, bottom: 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: NetworkImage(items!.image!), fit: BoxFit.cover)),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(items!.name!),
                    ),
                    const SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 100.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text("Season"), Text(items!.season!)],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      indent: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 100.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text("Temperature"), Text(items!.temperature!)],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      indent: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 100.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text("Water"), Text(items!.water!)],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      indent: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 100.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text("Humidity"), Text(items!.humidity!)],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      indent: 20.0,
                    ),
                    const SizedBox(height: 45.0),
                    Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: double.infinity,
                      child: const Text(
                        "Plant Care Requirements",
                      ),
                      color: const Color(0xffB7E797).withOpacity(.3),
                    ),
                    const SizedBox(height: 45.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Climate: "),
                          const SizedBox(height: 10.0),
                          Text(items!.climateForGrowth!),
                          const SizedBox(height: 10.0),
                          const Text("Ideal Soil: "),
                          const SizedBox(height: 10.0),
                          Text(items!.idealSoil!),
                          const SizedBox(height: 10.0),
                          const Text("Water In Take: "),
                          const SizedBox(height: 10.0),
                          Text(items!.waterInTake!),
                          const SizedBox(height: 10.0),
                          const Text("Time To Maturity: "),
                          const SizedBox(height: 10.0),
                          Text(items!.timeToMaturity!),
                          const SizedBox(height: 10.0),
                          const Text("LifeSpan: "),
                          const SizedBox(height: 10.0),
                          Text(items!.lifeSpan!),
                          const SizedBox(height: 50.0),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25.0,)
            ],
          ),
        ),
      ),
    );
  }
}
