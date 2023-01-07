import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayErrorMessage extends StatelessWidget {
  const DisplayErrorMessage({super.key, this.error});

final Object? error;
  @override
  Widget build(BuildContext context) {
    return Center(
child:Text('Oh no, Something went wrong''Please check your Config $error')

    );
  }
}