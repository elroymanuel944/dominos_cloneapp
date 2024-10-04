import 'package:dominos_cloneapp/controller/Offers_for_you_section.dart';
import 'package:dominos_cloneapp/controller/location_page.dart';
import 'package:dominos_cloneapp/controller/profile_section.dart';
import 'package:dominos_cloneapp/gobalScreen/Custom_craving.dart';
import 'package:dominos_cloneapp/gobalScreen/custom_containerSection.dart';
import 'package:dominos_cloneapp/view/home_Screen/dummy_db.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4, // Number of tabs
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _BuildAppBarSection(context), // AppBar
            // body
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TabBar
                    _buildTabbarSection(), //TabBar
                    // TabBarView
                    // Expanded(
                    //   child: TabBarView(
                    //     children: [
                    //       Center(child: Text("Delivery content here")),
                    //       Center(child: Text("Takeaway content here")),
                    //       Center(child: Text("Dine-in content here")),
                    //       Center(child: Text("Deliver to train content here")),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildOfferyouSection(context), //offers for you
                    SizedBox(
                      height: 10,
                    ),
                    _buildCravingSection(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: containerSection(),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _buildCravingSection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What are you craving for?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 150,
              childAspectRatio: 0.6,
            ),
            itemCount: DummyDb.gridList.length,
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Prevent scrolling in GridView
            itemBuilder: (context, index) {
              return CravingSection(
                imageurl: DummyDb.gridList[index]["imageurl"],
                title: DummyDb.gridList[index]["title"],
              );
            },
          ),
        ],
      ),
    );
  }

  _BuildAppBarSection(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Color.fromARGB(255, 211, 40, 28),
                  size: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPage(),
                        ));
                  },
                  child: Text(
                    "COCHIN",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 211, 40, 28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Color.fromARGB(255, 211, 40, 28),
                  size: 15,
                ),
              ],
            ),
            Text(
              "KERALA",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  // Implement offer section navigation
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OffersForYouSection(),
                        ));
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 1,
                          color: Colors.grey.shade400,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            child: Image.asset("assets/image/pizza.png"),
                          ),
                          Flexible(
                            child: Text(
                              "CHEESY \nREWARDS",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 107, 105, 105),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Colors.grey.shade400,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSection(),
                          ));
                    },
                    child: Icon(
                      Icons.person_rounded,
                      color: const Color.fromARGB(255, 78, 77, 77),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOfferyouSection(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Offers for you",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OffersForYouSection(),
                  ));
            },
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 151, 101),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              child:
                                  Image.asset("assets/image/discount (3).png"),
                            ),
                            Text(
                              "   Get ₹50 OFF",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Get ₹50 off on orders of ₹200 or more",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Container(
                      height: 38,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.5, color: Colors.white),
                        color: Color.fromARGB(255, 0, 151, 101),
                      ),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabbarSection() {
    return TabBar(
      padding: EdgeInsets.symmetric(horizontal: 30),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicator: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 2),
      ),
      tabs: [
        Tab(
          child: Text(
            "Delivery \n 30Mins",
            style: TextStyle(fontSize: 10),
          ),
        ),
        Tab(
          child: Text(
            "Takeaway\nSelect Store",
            style: TextStyle(fontSize: 10),
          ),
        ),
        Tab(
          child: Text(
            "Dine-in\nSelect Store",
            style: TextStyle(fontSize: 10),
          ),
        ),
        Tab(
          child: Text(
            "Deliver to train \n next station",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
