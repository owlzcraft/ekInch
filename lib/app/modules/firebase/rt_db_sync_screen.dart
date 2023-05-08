import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RtDbSyncPage extends StatefulWidget {
  const RtDbSyncPage({super.key});

  @override
  State<RtDbSyncPage> createState() => RtDbSyncPageState();
}

class RtDbSyncPageState extends State<RtDbSyncPage> {
  var textValue = "Hello everyone!";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseDatabase.instance
            .ref()
            .child("reservations + ")
            .child("B0AYFvukeSHz4A11jAXe")
            .child("Mon, Mar 20")
            .child("data")
            .child("-NR--LZ8q215X2tnGtDb")
            .onValue,
        builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
          print("snapshot..........");
          print(snapshot.data!.snapshot.exists);
          if (snapshot.hasData) {
            String data = snapshot.data!.snapshot.value.toString();
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Change of data sync"),
                ),
                body: Center(child: Text(data)));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
