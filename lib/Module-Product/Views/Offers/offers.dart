import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_task_2/Module-Product/Views/Offers/restaurent_details.dart';
import 'package:test_task_2/Module-Product/Views/Offers/skeleton.dart';
import '../../Controllers/product_controller.dart';

class Offers extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    List item = (productController.productList);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Offers",
          style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
              letterSpacing: .8),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.searchPlus,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.circleArrowLeft,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Skeleton();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 18),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.gifts,
                        color: Color.fromRGBO(183, 28, 28, 1),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "Discount on the all food",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                _restaurents(item),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 18),
                  child: Row(
                    children: const [
                      Text(
                        "Exclusive cashback offer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                _restaurents(item),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 18),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.gifts,
                        color: Color.fromRGBO(183, 28, 28, 1),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "Discount on some selected items",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                _restaurents(item),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        }
      }),
    );
  }
  Widget _restaurents(List item) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
          key: Key("listView"),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                width: 2,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 187,
                      width: 270,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 245, 240, 1),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20)),
                          border: Border.all(
                              width: 2.5,
                              color: const Color.fromRGBO(45, 47, 45, 1))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 14,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(() => RestaurantDetails(value: index));
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                  child: Image.network(
                                    item[index].image,
                                    fit: BoxFit.fill,
                                    height: 120,
                                    width: 270,
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                          item[index].businessname
                                              .toString(),
                                          style: const TextStyle(fontSize: 17),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis)),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_half,
                                        color: Colors.black,
                                      ),
                                      Text(item[index].reviews
                                          .toString())
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 22,
                      left: 22,
                      child: Container(
                        height: 26,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(1)),
                        child: const Center(
                            child: Text(
                          "20% Cashback",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontStyle: FontStyle.italic),
                        )),
                      ),
                    ),
                    Positioned(
                      top: 22,
                      left: 140,
                      child: index%3==0 ? Container(
                          height: 27,
                          width: 27,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Icon(
                            FontAwesomeIcons.box,
                            color: Colors.red,
                            size: 16,
                          )) : Container(),
                    ),
                    const Positioned(
                      top: 162,
                      left: 16,
                      child: Text(
                        "20% Cashback offers, extra 10%",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ));
          })
    );
  }
}


