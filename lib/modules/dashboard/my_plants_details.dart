// import 'package:flutter/material.dart';
// import 'package:plant_tree/styles/index.dart';


// class MyPlantDetails extends StatelessWidget {
//   const MyPlantDetails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 end: Alignment.centerLeft,
//                 begin: Alignment.centerRight,
//                 colors: AppColors.appBarColor),
//           ),
//         ),
//         title: Text(
//           "My Plants",
//           style: TextStyles.body22,
//         ),
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(
//             top: 25.0, left: 25.0, right: 25.0, bottom: 0.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 200,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5.0),
//                     image: DecorationImage(
//                         image: NetworkImage(items!.image!), fit: BoxFit.cover)),
//               ),
//               const SizedBox(height: 20.0),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffF0F0F0),
//                   borderRadius: BorderRadius.circular(6.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 30.0, top: 25.0),
//                         child: Text(
//                           items!.name!,
//                           style: TextStyles.body22,
//                         ),
//                       ),
//                       const SizedBox(height: 40.0),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 30.0, right: 100.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text("Season"),
//                                 Text(items!.season!)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 1.0,
//                         indent: 20.0,
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 30.0, right: 100.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text("Temperature"),
//                                 Text(items!.temperature!)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 1.0,
//                         indent: 20.0,
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 30.0, right: 100.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text("Water"),
//                                 Text(items!.water!)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 1.0,
//                         indent: 20.0,
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 30.0, right: 100.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text("Humidity"),
//                                 Text(items!.humidity!)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Divider(
//                         thickness: 1.0,
//                         indent: 20.0,
//                       ),
//                       const SizedBox(height: 45.0),
                      
//                       const SizedBox(height: 45.0),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0, right: 15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
                            
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
