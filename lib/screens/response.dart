import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intel_test/provider/navigation_provider.dart';
import 'package:intel_test/provider/todo_provider.dart';

class Response extends StatelessWidget {
  const Response({Key key}) : super(key: key);

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
          Text('Response'),
        ],
      ),),
      body: Consumer(builder: (context, watch, child){
        final todosAsync = watch(todoProvider);

        return todosAsync.when(
            data: (todos){
              return ListView.builder(
                itemCount: todos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                  final todoItem = todos[index];

                return Column(
                  children: [
                    ListTile(
                      leading: Checkbox(value: todoItem.isCompleted, onChanged: null),
                      title: Text('${todoItem.title}'),
                    ),
                    Divider(thickness: 1,)
                  ],
                );
              });
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(child: Text('An Error Occurred')));
      }),
    );
  }
}
