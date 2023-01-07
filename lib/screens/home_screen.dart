import 'package:chatapp/pages/calls_page.dart';
import 'package:chatapp/pages/contacts_page.dart';
import 'package:chatapp/pages/messages_page.dart';
import 'package:chatapp/pages/notifications.dart';
import 'package:chatapp/screens/proile_screen.dart';
import 'package:chatapp/themeData.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/widget.dart';

import '../helpers.dart';
import '../widgets/icon_button.dart';


class HomeScreen extends StatelessWidget {
  

   HomeScreen({super.key});

  final pages=const [

  MessagesPage(),
  NotifcationsPage(),
  CallsPage(),
  ContactsPage(),

];

  final title=const [
 
  "Messages",
  "Notifcations",
   "Calls",
  "Contacts",

];
void _onNavigationItemSelected(index) {
  titleIndex.value=title[index];
    pageIndex.value = index;
    
   }

final ValueNotifier<int> pageIndex= ValueNotifier(0);
final ValueNotifier<String> titleIndex= ValueNotifier('Messages');

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      
      
appBar: AppBar(
  iconTheme:Theme.of(context).iconTheme,
  backgroundColor:Colors.transparent,
  leadingWidth: 54,
  leading: Align(
  
    alignment: Alignment.centerRight,
    child: IconBackground(icon: Icons.search,onTap:() {
      
    },),
  ),
  actions: [Padding(
    padding: const EdgeInsets.only(right:24.0),
    child: Hero(tag: 'hero-profile-picture',
      child: Avatar.small(url:context.currentUserImage, onTap:() {
        Navigator.of(context).push(ProfileScreen.route);
      }),
    ),

  )],
  elevation: 0,

  title:ValueListenableBuilder(valueListenable:titleIndex, builder:(BuildContext context,value,_){
return Text(titleIndex.value,style: const TextStyle(fontSize:16,fontWeight:FontWeight.bold),);


  })),

      body: ValueListenableBuilder(valueListenable: pageIndex, builder:( BuildContext context,int value,_){
           
        
        return pages[value];
      }),

bottomNavigationBar:  _BottomNavigationBar(onItemSelected: _onNavigationItemSelected,
  
),

    );
  }

  
}

class _BottomNavigationBar extends StatefulWidget {
_BottomNavigationBar({
    Key? key, required this.onItemSelected,
  }) : super(key: key);
   final ValueChanged<int> onItemSelected; 
 
   

  @override
  State<_BottomNavigationBar> createState() => __BottomNavigationBarState();
}

class __BottomNavigationBarState extends State<_BottomNavigationBar> {

  var selectedIndex =0;


 void _handleItemSelected(index){

  setState((){ selectedIndex=index;});
  widget.onItemSelected(index);
     
    }
   
  @override
  Widget build(BuildContext context) {
final brightness =Theme.of(context).brightness;
    return      SafeArea(
      top: false,
      bottom: false,


      child: 
    Card(
      margin: const EdgeInsets.all(0),
      color: (brightness==Brightness.light)?Colors.transparent:null,
      elevation:0,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16,right: 8,bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
           NavigationItem(icon: Icons.message, label: "Messages",index: 0,onTap:_handleItemSelected,isSelected: (selectedIndex==0)),
           NavigationItem(icon: Icons.notifications, label: "Notification",index: 1,onTap:_handleItemSelected,isSelected: (selectedIndex==1)),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:8.0),
             child: GlowingActionButton(color: AppColors.secondary, icon: Icons.add, onPressed: (){

                showDialog(context: context, builder: (BuildContext context) =>const Dialog(child: AspectRatio(
                  aspectRatio: 8/7,
                  child:  ContactsPage(),
                ),));

             }),
           ),
           NavigationItem(icon: Icons.call, label: "Calls",index: 2,onTap:_handleItemSelected,isSelected: (selectedIndex==2)),
           NavigationItem(icon: Icons.people, label: "Contacts",index: 3,onTap:_handleItemSelected,isSelected: (selectedIndex==3)),
          ],),
        ),
      ),
    ));
  }

 
}

class NavigationItem extends StatelessWidget {
  final int index;
  final String label;
  final IconData icon;
  final bool isSelected ;
  const NavigationItem( {super.key, required this.label, required this.icon, required this.index, required this.onTap, this.isSelected=false});
  
 final ValueChanged<int> onTap; 

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        width:70,
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children:  [
            Icon(icon,
            size: 20,color: isSelected?AppColors.secondary:null),
            const SizedBox(height:8),
            Text(label,style: TextStyle(fontSize:11,color:isSelected?AppColors.secondary:null,fontWeight:isSelected?FontWeight.bold:null)),
          ],
        ),
      ),
    );
  }
}

