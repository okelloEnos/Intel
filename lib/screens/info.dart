import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intel_test/provider/navigation_provider.dart';
import 'package:intel_test/provider/user_provider.dart';

class Info extends StatelessWidget {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Row(
          children: [
            Consumer(builder: (context, watch, child) {
              final previousTab = watch(previousNavigationStateProvider).state;
              return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    watch(bottomNavigationStateProvider).state = previousTab;
                  });
            }),
            SizedBox(
              width: 10,
            ),
            Text(
              'Info',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
          child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: TextField(
                      controller: mailController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: 'E - Mail',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call_end_outlined),
                          labelText: 'Phone NUmber',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Builder(builder: (BuildContext context) {
                  return Consumer(builder: (context, watch, child) {
                    return RaisedButton(
                      onPressed: () async {
                        watch(userProvider).saveUser(
                            name: nameController.text,
                            mail: mailController.text,
                            phone: phoneController.text);
                        watch(bottomNavigationStateProvider).state = 1;
                        Fluttertoast.showToast(
                            msg: 'User Information Successfully Submitted ...');
                      },
                      color: Colors.orange,
                      child: Text(
                        'Submit Info',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  });
                })
              ],
            ),
          ),
        ),
      )),
    );
  }
}
