import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meditation/nav_bar.dart';
import 'package:meditation/player_screen.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  final Stream<QuerySnapshot> popular =
      FirebaseFirestore.instance.collection('popular').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Popular",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: popular,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Loading');
            }
            final data = snapshot.requireData;
            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) => ListTile(
                leading: Container(
                  width: 90,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff2d31ac),
                  ),
                ),
                title: Text(
                  data.docs[index]['label'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  _intToTime(data.docs[index]['duration']),
                  style: const TextStyle(
                    color: Color(0xb2000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                trailing: const Icon(Icons.favorite_border_outlined),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayerScreen()),
                ),
              ),
            );
          }),
      bottomNavigationBar: navbar(),
    );
  }

  _intToTime(int value) {
    int m;
    int s;

    m = (value) ~/ 60;

    s = value - (m * 60);

    String minute = m.toString();

    String seconds =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$minute min $seconds sec";

    return result;
  }
}
