import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard/widgets/navigation.dart';
import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var arr = [
      "Surendra",
      "rahul",
      "Amit",
      "Saurabh",
      "kumar",
      "sharma",
      "jha"
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Refer and Earn",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
        leading: IconButton(
          icon: Image.asset('assets/images/burger.png', width: 36, height: 36),
          onPressed: () {
            // Add your onPressed code here
          },
        ),
        // Image.asset("assets/images.menu.png"),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10, top: 14, bottom: 14),
              height: 22,
              padding: const EdgeInsets.all(5),

              // color: Colors.white,
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: [
                  const Text(
                    "1500",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  Image.asset("assets/images/taj.png")
                ],
              )),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: Column(children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: 200,
                  decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFFEBA0F))),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Invite",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  //  width: 200,
                  child: const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      "Status",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCDCDCD)))),
                onChanged: (text) {
                  // Update search results based on text input
                },
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(22),
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 40),
            itemBuilder: ((context, index) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image.asset("./assets/images/heroProfile.png"),
                    // backgroundColor: Colors.red,
                  ),
                  title: Container(
                    // color: Colors.red,
                    width: 200,
                    margin: const EdgeInsets.only(right: 110),
                    child: Column(children: [
                      Text(
                        arr[index],
                        style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        "Sent on 22 july 2022",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        "Code : YDH351",
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ),
                  trailing: const Text(
                    "Waiting",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) => const Divider(
                  height: 20,
                  thickness: 10,
                )),
            itemCount: arr.length),
      ),

      bottomNavigationBar: const BottomTabView(9),

      //  bottomNavigationBar: MyNavigator(),
    );
  }
}
