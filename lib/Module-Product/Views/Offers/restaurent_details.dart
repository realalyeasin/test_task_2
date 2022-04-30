import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_task_2/Module-Product/Views/Offers/text_wrapper.dart';
import '../../Controllers/product_controller.dart';

class RestaurantDetails extends StatelessWidget {
  final value;
  RestaurantDetails({Key? key, required this.value}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(productController.productList[value].image),
                  Positioned(
                      top: 33,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.circleArrowLeft,
                          size: 28,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productController.productList[value].businessname,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: .7),
                          ),
                          const Text("20% Cashback offers"),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_half,
                          color: Colors.black,
                        ),
                        Text(
                          productController.productList[value].reviews.toString(),
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: TextWrapper(
                    text:
                    "Maximum discount per box is \u00249. 16 Free Meals does not apply to orders fewer than 12 servings per week. New customers only. Once redeemed, full balance of offer expires 10 weeks after you sign up. No carry over permitted. May not be combined with other offers. May not be used for gift cards. Not redeemable for cash. Not eligible in all states. Click here for additional details. Void where prohibited."),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Row(
                  children: const [
                    Icon(
                      Icons.money_off,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("10% Cashback on their entire menu")
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                endIndent: 20,
                indent: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.qr_code,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Promo Code")
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                        ))
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                endIndent: 20,
                indent: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("Invite Friends & Get Cashback",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 215,
                        child: ListView.separated(
                            itemCount: 10,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                width: 2,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20, right: 10),
                                child: Container(
                                  height: 210,
                                  width: 180,
                                  color: const Color.fromRGBO(241, 239, 236, 1),
                                  child: Column(
                                    children: [
                                      Card(
                                        child: Image.network(
                                          productController
                                              .productList[index].image,
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 180,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                                productController.productList[index]
                                                    .businessname,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis),
                                            const Text("20% Cashback offers"),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Container(
                                              height: 23,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: const Color.fromRGBO(
                                                    220, 217, 213, 1),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: const [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(left: 10),
                                                    child: Text("P6F5765J#"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(right: 10),
                                                    child: Icon(
                                                      Icons.copy,
                                                      size: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}