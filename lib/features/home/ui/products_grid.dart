// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:myecommercewebapp/features/home/ui/product_details.dart';
// import 'package:myecommercewebapp/screens/product_detail.dart';

// class ProductsScreen extends StatefulWidget {
//   const ProductsScreen({super.key});

//   @override
//   State<ProductsScreen> createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends State<ProductsScreen> {
//   double scrollPosition = 0;
//   double opacity = 0;
//   final List<String> assets = [
//     'assets/GardenPergola.jpg',
//     'assets/furniture.jpg',
//     'assets/AluminiumWorks.jpg',
//     'assets/Shutter.jpg',
//     'assets/sheds.jpg',
//   ];

//   final List<String> title = [
//     'Garden Pergola',
//     'Metal/Sheet Furniture',
//     'Aluminium Works',
//     'Shutter',
//     'Sheds',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     opacity = scrollPosition < screenSize.height * 0.40
//         ? scrollPosition / (screenSize.height * 0.40)
//         : 1;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: screenSize.width / 35),
//           child: Text(
//             'Items',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.w400,
//               letterSpacing: 3,
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         GridView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: screenSize.height / 40,
//                 crossAxisSpacing: screenSize.width / 40,
//                 mainAxisExtent: screenSize.width / 2.5),
//             itemCount: assets.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (BuildContext context) {
//                       return ProductDetails(productDataList: [],);
//                     }));
//                   },
//                   child: Card(
//                     elevation: 5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                             width: screenSize.width / 0.5,
//                             height: screenSize.width / 6.0,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(5.0),
//                                   topRight: Radius.circular(5)),
//                               child: Image.asset(
//                                 assets[index],
//                                 fit: BoxFit.fitWidth,
//                               ),
//                             )),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Name',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.w400,
//                                     letterSpacing: 2,
//                                   )),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 'Details About The Product',
//                                 style: TextStyle(
//                                   color: Colors.blueGrey[900],
//                                   fontSize: 10,
//                                   fontFamily: 'Montserrat',
//                                   fontWeight: FontWeight.w400,
//                                   letterSpacing: 2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//         SizedBox(height: 15),
//       ],
//     );
//   }
// }
