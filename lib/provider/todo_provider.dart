import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intel_test/model/todo.dart';
import 'package:http/http.dart' as http;

final todoProvider = FutureProvider<List<Todo>>((ref) async{
  List<Todo> todos = [];
 var baseUrl = 'https://jsonplaceholder.typicode.com/todos?_limit=5';

 final response = await http.get(baseUrl);
 if(response.statusCode == 200){
   print('${response.body}');
   var decodeTodos = json.decode(response.body);
   var listCon = decodeTodos as List;

   for(var item in listCon){
     Todo todo = Todo(title: item['title'], isCompleted: item['completed']);
     print('${todo.title}');
     todos.add(todo);
   }
 }

 return todos;
});