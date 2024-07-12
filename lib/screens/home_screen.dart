import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final List<String> _trendingMenuItems = ['Today', 'This Week'];
  late String _trendingMenu;

  @override
  void initState() {
    _trendingMenu = "Today";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(0.0, 0.0),
        child: Container(
          color: Colors.blue[900],
        ),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(color: Colors.blue[900]),
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
              ),
              Stack(
                alignment: Alignment.center,
                children: const [
                  Icon(Icons.tv_rounded, size: 35, color: Colors.white),
                  Icon(Icons.play_arrow_rounded, size: 20, color: Colors.white)
                ],
              ),
              const Icon(Icons.person_rounded, color: Colors.white)
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/home_view.png',
                        height: size.width - 100, width: size.width, fit: BoxFit.fill),
                    Container(
                      width: size.width,
                      height: size.width - 100,
                      color: Colors.blue[700]?.withOpacity(0.8),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Welcome",
                              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600, color: Colors.white)),
                          const SizedBox(height: 30),
                          const Text(
                            "Wide range of movies and series to explore.",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            width: size.width - 40,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.64,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: "Search...",
                                      contentPadding: EdgeInsets.only(top: 10.0, bottom: 14.0, left: 10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      elevation: 0,
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: const [
                                        Text("Search"),
                                        Icon(Icons.search_rounded),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: [
                          const Text("Trending", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 120,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue[900],
                            ),
                            child: DropdownButton<String>(
                                isExpanded: true,
                                alignment: Alignment.center,
                                focusColor: Colors.transparent,
                                dropdownColor: Colors.greenAccent,
                                items: _trendingMenuItems.map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(fontSize: 12.0),
                                      ));
                                }).toList(),
                                underline: const SizedBox(),
                                hint: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _trendingMenu,
                                      style: const TextStyle(color: Colors.greenAccent),
                                    ),
                                  ],
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.greenAccent,
                                  size: 20,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    _trendingMenu = val!;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 310,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Set horizontal scrolling
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(left: 10, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
                                      height: 230,
                                      width: 150,
                                      child: const Center(
                                          child: Icon(Icons.image_outlined, color: Colors.white60, size: 100)),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white.withOpacity(0.5)),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.more_horiz_rounded, color: Colors.grey),
                                          iconSize: 20,
                                          padding: const EdgeInsets.only(right: 10),
                                          splashRadius: 10,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 215, left: 15),
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20), color: Colors.blue[900]),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_border_outlined, color: Colors.white),
                                        iconSize: 20,
                                        padding: const EdgeInsets.all(5),
                                        splashRadius: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Movie Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      Text("Date", style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
