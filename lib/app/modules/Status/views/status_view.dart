import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';

import 'package:get/get.dart';

import '../controllers/status_controller.dart';

class StatusView extends GetView<StatusController> {
  const StatusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var arr=["Surendra","rahul","Amit","Saurabh","kumar","sharma","jha"];
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,

          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Refer and Earn",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)
                  )
                ),
        leading: Icon(Icons.menu_sharp),
        // Image.asset("assets/images.menu.png"),
        actions: [
          Container(
              margin:const EdgeInsets.only(right: 10), 
              child:Row(children: [
                Icon(Icons.share_outlined),
                Icon(Icons.notification_add_outlined)
              ],)
              )
        ],

         backgroundColor: Colors.black,
      ),
      body:   Stack(
        children: [
          ListView.separated(
            padding:EdgeInsets.symmetric(vertical: 40),
            
            itemBuilder: ((context, index) {
            return ListTile(
              
              leading:CircleAvatar(
                              // child: Image.asset("./assets/images/profile.jpg"),
                              backgroundColor: Colors.red,
                            ) ,
            title: Text(arr[index]),
            subtitle: 
            // Column(
              // children: [
                Text("arr[index]"),
                //  Text("arr[index]"),
              // ],
            // ),
             
            trailing: Text("data"),
            );
          }), 
          
          
          
          separatorBuilder: ((context, index) =>
          Divider(height: 20,thickness: 10,)), 
          itemCount: arr.length
          ),
           TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.search),
    hintText: 'Search...',
  ),
  onChanged: (text) {
    // Update search results based on text input
  },
),
        ],
      ),
       bottomNavigationBar: MyNavigator(),
    );
  }
}
