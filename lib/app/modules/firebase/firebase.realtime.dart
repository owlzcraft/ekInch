import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class MyDatabaseListener {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  late StreamSubscription<DatabaseEvent> _subscription;

  void startListening(String collection, String child_id) {
    _subscription = databaseReference
        .child(collection)
        .child(child_id)
        .onValue
        .listen((event) {
      // Handle the event here
      // `event.snapshot` contains the latest data from the database
    });
  }

  void stopListening() {
      // _subscription = const Stream.empty();
      //  StreamSubscription<DatabaseEvent> subscription = StreamSubscription();
      // subscription.cancel();

  }
}
