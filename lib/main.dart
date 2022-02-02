import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meditation/nav_bar.dart';
import 'package:meditation/seeall_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(0),
                ),
                color: Color(0xff2d31ac),
              ),
              padding: const EdgeInsets.fromLTRB(10, 40, 80, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "DAY 7",
                    style: TextStyle(
                      color: Color(0x7fffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Love and Accept Yourself",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Popular",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                )),
                            TextButton(
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SeeAllScreen()),
                                    ),
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Color(0xff4a80f0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 300,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: const Color(0xff2d73d5),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 110, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Anxiety",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                  Text(
                                    "Turn down the stress volume",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Spacer(flex: 4),
                                  Text(
                                    "7 steps | 5-11 min",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("New",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Color(0xff4a80f0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 300,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: const Color(0xffffbda2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Happines",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Spacer(flex: 1),
                                  Text(
                                    "Daliy Calm",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Spacer(flex: 4),
                                  Text(
                                    "7 steps | 3-5 min",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: navbar());
  }
}
