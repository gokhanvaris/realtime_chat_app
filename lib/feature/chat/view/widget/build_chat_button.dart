import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:realtime_chat_app/feature/chat/view/chat_view.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/language/locale_keys.g.dart';

class BuildChatButton extends StatelessWidget {
  const BuildChatButton({
    super.key,
    required this.textEditingController,
    required this.homeViewModel,
    required this.widget,
  });

  final TextEditingController? textEditingController;
  final HomeViewModel homeViewModel;
  final ChatView widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (textEditingController?.text != "") {
            homeViewModel.sendMessage(
                roomType: widget.roomType,
                message: textEditingController?.text,
                username: widget.userName);
            textEditingController?.text = "";
          }
        },
        child: const Text(LocaleKeys.send,
            style: TextStyle(color: ColorName.black)));
  }
}
