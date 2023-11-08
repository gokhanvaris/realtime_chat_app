import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:realtime_chat_app/feature/chat/view/mixin/chat_view_mixin.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/init/language/locale_keys.g.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';
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
  TextEditingController? _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${LocaleKeys.room} ${widget.id}'),
        ),
        floatingActionButton: Container(
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
                            _textEditingController?.text = val;
                          } else {
                            _textEditingController = null;
                          }
                          setState(() {});
                        },
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: LocaleKeys.username,
                          border: InputBorder.none,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_textEditingController?.text != "") {
                          homeViewModel.sendMessage(
                              roomType: widget.roomType,
                              message: _textEditingController?.text,
                              username: widget.userName);
                          _textEditingController?.text = "";
                        }
                      },
                      child: const Text(LocaleKeys.send,
                          style: TextStyle(color: ColorName.black)))
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<HomeViewModel, AppState>(
                builder: (context, state) {
                  if (state.messagesListState != null) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.messagesListState!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.messagesListState![index]),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: SizedBox(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
