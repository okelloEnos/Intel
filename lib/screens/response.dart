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
      backgroundColor: Colors.orange[100],
      appBar: AppBar(title: Row(
        children: [
          Consumer(builder: (context, watch, child){
            final previousTab = watch(previousNavigationStateProvider).state;
            return   IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
              watch(bottomNavigationStateProvider).state = previousTab;
            });
          }),
          SizedBox(width: 10,),
          Text('Response', style: TextStyle(color: Colors.white),),
        ],
      ),),
      body: Consumer(builder: (context, watch, child){
        final todosAsync = watch(todoProvider);

        return todosAsync.when(
            data: (todos){
              return ListView.separated(
                separatorBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(),
                  );
                },

                itemCount: todos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                  final todoItem = todos[index];

                return ListTile(
                  leading: todoItem.isCompleted ? Icon(Icons.check_circle_outline_outlined, size: 35, color: Colors.green,) : Icon(Icons.cancel_outlined, color: Colors.red, size: 35,),
                  title: Text('${todoItem.title}', style:  TextStyle(color: Colors.orange, fontWeight: FontWeight.w700),),
                );
              });
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(child: Text('An Error Occurred')));
      }),
    );
  }
}
