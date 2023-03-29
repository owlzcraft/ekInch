import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/skills_options.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../custom_widget/color.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/math_utils.dart';
import '../../../../dashboard/widgets/navigation.dart';
import '../../../../notication/view/notification_view.dart';
import '../../../../settings/views/settings_view.dart';

class AddSkillView extends StatefulWidget {
  AddSkillView({super.key});

  @override
  State<AddSkillView> createState() => _AddSkillViewState();
}

class _AddSkillViewState extends State<AddSkillView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
 List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');
  List<String> _selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Selection ListView Example'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];

          return CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                if (value!) {
                  _selectedItems.add(item);
                } else {
                  _selectedItems.remove(item);
                }
              });
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ElevatedButton(
            onPressed: _selectedItems.isEmpty
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Selected Items'),
                          content: Text(_selectedItems.join(', ')),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
            child: const Text('Show Selected Items'),
          ),
        ),
      ),
    );
  }
}
