import 'package:flutter/material.dart';


class LandingRoundButton extends StatelessWidget {
  final String title ;
  final VoidCallback onTap ;
  final bool loading ;
  const LandingRoundButton({Key? key ,
    required this.title,
    required this.onTap,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 230,
        
        decoration: BoxDecoration(
          color: Color(0xffDDA962),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Color(0xffDDA962), width: 2),
    
        ),
        
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) :
        Text(title, style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),),),
      ),
    );
  }
}