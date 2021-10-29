import 'package:hooks_riverpod/hooks_riverpod.dart';


// ignore: top_level_function_literal_block
final userProvider = StateNotifierProvider((ref){
  return UserStateNotifier();
});

class UserStateNotifier extends StateNotifier<UserModel>{

  UserStateNotifier([ UserModel userData]) : super (userData ?? UserModel(
      name: 'No Name',
      email: 'No Email',
      phoneNo: 'No Phone Number'
  ));

  void saveUser({String name, String mail, String phone}){
    state = UserModel(name: name, email: mail, phoneNo: phone);
  }

}

class UserModel{
  final String name;
  final String email;
  final String phoneNo;

  UserModel({this.name, this.email, this.phoneNo});
}