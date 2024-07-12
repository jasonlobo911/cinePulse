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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu_rounded, color: Colors.white),
              ),
              Stack(alignment: Alignment.center, children: const [
                Icon(Icons.tv_rounded, size: 35, color: Colors.white),
                Icon(Icons.play_arrow_rounded, size: 20, color: Colors.white)
              ]),
              Row(
                children: const [
                  Icon(Icons.person_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.search_rounded, color: Colors.white),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/home_view.png'),
                    Container(
                      width: size.width,
                      height: size.width,
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
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Trending", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 10),
                          Container(
                            height: 40,
                            width: size.width * 0.3,
                            padding: const EdgeInsets.all(10),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
