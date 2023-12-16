import 'package:cached_network_image/cached_network_image.dart';
import 'package:dbhiveecom/model/beds_model.dart';
import 'package:dbhiveecom/services/helper.dart';
import 'package:dbhiveecom/views/reusables/new_furnitures.dart';
import 'package:dbhiveecom/views/reusables/productcard.dart';
import 'package:dbhiveecom/views/reusables/styles.dart';
import 'package:flutter/material.dart';
import 'package:antdesign_icons/antdesign_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 5, vsync: this);
  //retrieve data from the api
  late Future<List<Furnitures>> _bed;
  late Future<List<Furnitures>> _chair;

  void getBed() {
    _bed = Helper().getBeds();
  }

  void getChair() {
    _chair = Helper().getChairs();
  }

  //add all others

  @override
  void initState() {
    super.initState();
    getBed();
    getChair();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/tophive.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 8, bottom: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Classy Furniture",
                        style: appStyleHeight(
                            40, Colors.white, FontWeight.bold, 1.2),
                      ),
                      Text(
                        "collections",
                        style: appStyleHeight(
                            42, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appStyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.6),
                          tabs: const [
                            Tab(
                              text: "Beds",
                            ),
                            Tab(
                              text: "Sofas",
                            ),
                            Tab(
                              text: "Tables",
                            ),
                            Tab(
                              text: "Chairs",
                            ),
                            Tab(
                              text: "Services",
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.265),
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: FutureBuilder<List<Furnitures>>(
                              future: _bed,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("Error ${snapshot.error}");
                                } else {
                                  final bed = snapshot.data;
                                  return ListView.builder(
                                      itemCount: bed!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final furniture = snapshot.data![index];
                                        return ProductCard(
                                            price:
                                                "\$${furniture.price}", // node the\ to add te dollar sign infron fo price
                                            category: furniture.category,
                                            id: furniture.id,
                                            name: furniture.name,
                                            image: furniture.imageUrl[0]);
                                      });
                                }
                              },
                            )),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 20, 12, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "New Beds",
                                    style: appStyle(
                                        24, Colors.black, FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Show All",
                                        style: appStyle(
                                            22, Colors.black, FontWeight.w500),
                                      ),
                                      Icon(AntIcons.caretRightFilled),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: FutureBuilder<List<Furnitures>>(
                              future: _bed,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text("Error ${snapshot.error}");
                                } else {
                                  final bed = snapshot.data;
                                  return ListView.builder(
                                      itemCount: bed!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final furniture = snapshot.data![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: NewBeds(
                                              imageUrl: furniture.imageUrl[0]),
                                        );
                                      });
                                }
                              },
                            )),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
