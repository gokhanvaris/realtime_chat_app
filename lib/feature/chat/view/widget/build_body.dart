import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_chat_app/feature/home/view_model/home_view_model.dart';
import 'package:realtime_chat_app/product/state/view_model/app_state.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
