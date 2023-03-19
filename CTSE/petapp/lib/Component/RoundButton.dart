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
        height: 80,
        width: 180,
        
        decoration: BoxDecoration(
          color: Color(0xff003F36),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xff6ED1BA), width: 2),
    
        ),
        
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) :
        Text(title, style: TextStyle(color: Colors.white,fontSize: 20),),),
      ),
    );
  }
}