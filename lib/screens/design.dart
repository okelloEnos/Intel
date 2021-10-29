import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intel_test/provider/navigation_provider.dart';
import 'package:intel_test/provider/user_provider.dart';

class Design extends StatelessWidget {
  const Design({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          Consumer(builder: (context, watch, child){
            final previousTab = watch(previousNavigationStateProvider).state;
            return   IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
              watch(bottomNavigationStateProvider).state = previousTab;
            });
          }),
          SizedBox(width: 10,),
          Text('Design'),
        ],
      ),),
      body: Center(child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Icon(Icons.person_outline, size: 100, color: Colors.blue,),
            Text('User Profile', style: TextStyle(color: Colors.blue, fontSize: 20),),
            Consumer(builder: (context, watch, child){
              final user = watch(userProvider.state);

              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Card(
                  elevation: 6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('User Name : '),
                            Text('${user.name}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email Address : '),
                            Text('${user.email}')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone Number : '),
                            Text('${user.phoneNo}')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      )),
    );
  }
}
