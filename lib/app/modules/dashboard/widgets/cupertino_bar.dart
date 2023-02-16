import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_application_00/app/modules/job/form/views/jobs_landing.dart';
import 'package:flutter_application_00/app/modules/profile/views/profile_view.dart';
import 'package:flutter_application_00/app/modules/records/views/records_view.dart';
import 'package:flutter_application_00/app/modules/reels/views/reels_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              border: Border(top: BorderSide(style: BorderStyle.solid,strokeAlign: BorderSide.strokeAlignInside)),
              iconSize: 50.0,
              // height: (MediaQuery.of(context).size.height / 40.1518987342).sp,
              activeColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Color.fromARGB(0, 250, 249, 249),
                  activeIcon: Image.asset(
                    Assets.home,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  icon: Image.asset(
                    Assets.home,
                    color: KColors.greyIcon,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  label: ("Home"),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    Assets.lib_icon,
                    color: Colors.black,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  icon: Image.asset(
                    Assets.lib_icon,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  label: ("Library"),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    color: Colors.black,
                    Assets.job,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  icon: Image.asset(
                    Assets.job,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  label: ("Job"),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    Assets.records,
                    color: Colors.black,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  icon: Image.asset(
                    Assets.records,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  label: ("Records"),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    Assets.profile,
                    color: Colors.black,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  icon: Image.asset(
                    Assets.profile,
                    width:
                        (MediaQuery.of(context).size.width / 19.8879551821).sp,
                    height:
                        (MediaQuery.of(context).size.height / 42.1792618629).sp,
                  ),
                  label: ("Profile"),
                ),
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              switch (index) {
                case 0:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(child: DashboardView());
                    },
                  );
                  case 1:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(child: ReelsView());
                    },
                  );
                case 2:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(child: JobLanding());
                    },
                  );
                   case 3:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(child: RecordsView());
                    },
                  );
                   case 4:
                  return CupertinoTabView(
                    builder: (context) {
                      return CupertinoPageScaffold(child: ProfileView());
                    },
                  );
              }
              return Container();
            }),
      
    );
  }
}
