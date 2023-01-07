import 'package:flutter/cupertino.dart';

@immutable
class MessageData {

const  MessageData(
    {
      required this.senderName,
    required this.messageName,
    required this.dataMessage, 
    required this.messageDate, 
    required this.profilePicture});

final String senderName;
final String messageName;
final String dataMessage;
final DateTime messageDate;
final String profilePicture;

 
  
}