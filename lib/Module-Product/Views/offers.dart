import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/product_controller.dart';

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
          return const Center(
            child: CircularProgressIndicator(),
          );
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
              key: Key("Padding"),
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

class TextWrapper extends StatefulWidget {
  const TextWrapper({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  _TextWrapperState createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(238, 236, 234, 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 70),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.text,
                  style: const TextStyle(fontSize: 15),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ),
          isExpanded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'Show Less',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => setState(() => isExpanded = false),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => setState(() => isExpanded = true),
                        child: const Text('Show More',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ],
                )
        ]),
      ),
    );
  }
}
