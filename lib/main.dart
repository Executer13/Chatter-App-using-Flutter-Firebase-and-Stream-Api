import 'package:chatapp/themeData.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'screens/screens.dart';
import 'widgets/app.dart';

void main() {
  final client =StreamChatClient(streamKey);
  runApp( MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}):super(key:key);
final StreamChatClient client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //themeMode: ThemeMode.light,
      debugShowCheckedModeBanner:false,
      title: 'Chatter',
      builder: (context, child) {
        return StreamChatCore(client: client, child: ChannelsBloc(child: UsersBloc(child: child!)));
      },
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      home:  SelectUserScreen(),
    );
  }
}