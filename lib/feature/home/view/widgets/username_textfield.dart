import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/language/locale_keys.g.dart';

class BuildUsernameTextField extends StatefulWidget {
  const BuildUsernameTextField({
    super.key,
    required this.usernameController,
    required this.homeViewModel,
  });
  final TextEditingController usernameController;
  final HomeViewModel homeViewModel;

  @override
  State<BuildUsernameTextField> createState() => _BuildUsernameTextFieldState();
}

class _BuildUsernameTextFieldState extends State<BuildUsernameTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.homeViewModel,
      child: Container(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.grey,
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            child: TextFormField(
              onChanged: (val) {
                widget.usernameController.text = val;
              },
              controller: widget.usernameController,
              decoration: const InputDecoration(
                hintText: LocaleKeys.username,
                border: InputBorder.none,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
