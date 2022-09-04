import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width ;
  final double height ;
  final double borderRadius;
  final Color color;
  final  double fontsize;
  final String text;
  final VoidCallback onTap;
  final Color fontcolor;
  final bool isSocialMediaLoginButton;
  final Color borderColor;
  final double borderWidth;


  const CustomButton({Key? key,this.borderWidth =1,this.borderColor=Colors.orange,this.isSocialMediaLoginButton=false, this.width=double.infinity ,this.height=55,this.borderRadius =25 ,this.fontcolor = Colors.white ,required this.text,this.fontsize=16,this.color=Colors.orange,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width ,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
      ),

      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        //color: color,
        hoverColor:  const Color(0xFF8D8E98),
        onPressed: onTap,
        child: isSocialMediaLoginButton?  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: 25,
              height: 25,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize:fontsize,
                color: fontcolor,
              ),
            ),
          ],
        ): Text(text,
          style: TextStyle(
            fontSize:fontsize,
            color: fontcolor,
          ),
        ),
      ),
    );
  }
}
