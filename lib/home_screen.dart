import 'package:flutter/material.dart';
import 'package:travel_app_ui_flutter/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final placesImageList = ["assets/mountain 1.png", "assets/mountain 1.png"];
final categoriesList = ["Most viewed", "Near by", "Latest"];
int selectedIndex = -1;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initstate() {
    super.initState();

    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, David 👋",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Explore the world",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        height: 60,
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                            'assets/pexels-andrea-piacquadio-3777946 2.png'),
                      ),
                    ),
                  )
                ],
              ),

              // adding the search box here
              SizedBox(height: 50),
              Container(
                height: 65,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(22)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: false,
                              hintText: "Search places",
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 20),
                      ImageIcon(AssetImage('assets/icon setting.png'))
                    ],
                  ),
                ),
              ),

              // adding the pouplar places heading here
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Popular places",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // adding the categories here
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width / 12,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedIndex == index) {
                            selectedIndex = -1;
                          } else {
                            selectedIndex = index;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.black
                              : const Color.fromARGB(255, 248, 244, 244),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            categoriesList[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),

              SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width / 14,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: placesImageList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(),
                            ));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 248, 244, 244),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(children: [
                          Image(
                            image: AssetImage(placesImageList[index]),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 15,
                            top: 15,
                            left: 200,
                            bottom: 335,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image(
                                image: AssetImage('assets/heart icon.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 25,
                            top: 280,
                            left: 15,
                            bottom: 30,
                            child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 7, 35, 95),
                                          Color.fromARGB(255, 2, 90, 141),
                                        ]),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15),
                                      Row(
                                        children: [
                                          Text(
                                            "Mount Fuji,",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Tokyo",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ImageIcon(
                                                  color: Colors.white,
                                                  AssetImage(
                                                      'assets/location icon.png')),
                                              SizedBox(width: 5),
                                              Text(
                                                "Tokyo, Japan",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              ImageIcon(
                                                  color: Colors.white,
                                                  AssetImage(
                                                      'assets/Vector.png')),
                                              Text(
                                                "4.8",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
