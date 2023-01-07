import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
const streamKey='n7bt4r2htxqp';

var logger= log.Logger();
extension StreamChatContent on BuildContext{

String? get currentUserImage=> currentUser!.image;

User? get currentUser=> StreamChatCore.of(this).currentUser;

}