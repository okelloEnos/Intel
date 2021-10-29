import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intel_test/provider/navigation_provider.dart';
import 'package:intel_test/screens/design.dart';
import 'package:intel_test/screens/dictionary.dart';
import 'package:intel_test/screens/info.dart';
import 'package:intel_test/screens/response.dart';

class ScreenBottomController extends StatelessWidget {
  final screenOptions = [Info(), Design(), Response(), Dictionary()];

  @override
  Widget build(BuildContext context) {

    return Consumer(builder: (context, watch, child){

      final currentTab = watch(bottomNavigationStateProvider).state;

      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (int index) {
              watch(bottomNavigationStateProvider).state = index;
              // watch(previousNavigationStateProvider).state = index;
              print('change 4$index');
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline, color: currentTab == 0 ? Colors.blue : Colors.grey,),
                  // ignore: deprecated_member_use
                  title: Text('Info',
                      style:  TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey)
                  )),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined, color: currentTab == 1 ? Colors.blue : Colors.grey),
                // ignore: deprecated_member_use
                title: Text('Design', style:  TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey),),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.drive_file_rename_outline, color: currentTab == 2 ? Colors.blue : Colors.grey),
                // ignore: deprecated_member_use
                title: Text('Response', style: TextStyle(color: currentTab == 2 ? Colors.blue : Colors.grey),),),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long, color: currentTab == 3 ? Colors.blue : Colors.grey),
                // ignore: deprecated_member_use
                title: Text('Dictionary', style: TextStyle(color: currentTab == 3 ? Colors.blue : Colors.grey),),)
            ]),
        body: Stack(
          children: [screenOptions[currentTab]],
        ),
      );
    });
  }
}
