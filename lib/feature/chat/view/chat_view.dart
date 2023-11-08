import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_chat_app/feature/chat/view/mixin/chat_view_mixin.dart';
import 'package:realtime_chat_app/feature/chat/view/widget/build_body.dart';
import 'package:realtime_chat_app/feature/chat/view/widget/build_chat_button.dart';
import 'package:realtime_chat_app/product/init/language/locale_keys.g.dart';
import 'package:realtime_chat_app/product/utility/enums/project_enums.dart';

@RoutePage()
class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
    required this.id,
    required this.userName,
    required this.roomType,
  });
  final String id;
  final String userName;
  final RoomType roomType;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with ChatViewMixin {
  TextEditingController? textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${LocaleKeys.room} ${widget.id}'),
        ),
        floatingActionButton: buildFloatingActionButton(),
        body: const BuildBody(),
      ),
    );
  }

  Container buildFloatingActionButton() {
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.grey,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 22),
                  child: TextFormField(
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        textEditingController?.text = val;
                      } else {
                        textEditingController = null;
                      }
                      setState(() {});
                    },
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: LocaleKeys.username,
                      border: InputBorder.none,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
              BuildChatButton(
                textEditingController: textEditingController,
                homeViewModel: homeViewModel,
                widget: widget,
              )
            ],
          ),
        ),
      ),
    );
  }
}
