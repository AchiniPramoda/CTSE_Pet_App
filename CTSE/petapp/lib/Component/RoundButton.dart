import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap ;
  final bool loading ;
  const RoundButton({Key? key ,
    required this.title,
    required this.onTap,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 180,
        
        decoration: BoxDecoration(
          color: Color(0xffDDA962),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffDDA962), width: 2),
    
        ),
        
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) :
        Text(title, style: TextStyle(color: Colors.white,fontSize: 20),),),
      ),
    );
  }
}