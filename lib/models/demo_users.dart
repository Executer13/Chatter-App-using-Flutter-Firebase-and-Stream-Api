import 'package:flutter/material.dart';


const users=[
  userReuben,
  userNash,
  userSalvatore,
  userYasan

];

const userReuben=DemoUser(

  id:'reuben',
  name:'Reuben Turner',
  image:'https://picsum.photos/seed/1211/300/300'
);

const userNash=DemoUser(

  id:'nash',
  name:'nash Turner',
  image:'https://picsum.photos/seed/2345/300/300'
);
const userSalvatore=DemoUser(

  id:'Salvatore',
  name:'Salvatore',
  image:'https://picsum.photos/seed/1234/300/300'
);
const userYasan=DemoUser(

  id:'Yasan',
  name:'Yasan Malik',
  image:'https://picsum.photos/seed/5445/300/300'
);

@immutable 
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({required this.id, required this.name, required this.image, });
}