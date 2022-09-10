import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
void NavigatePop({context})=>  Navigator.pop(context);
Future NavigateAndFinsh ({context,router})=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => router), (Route<dynamic> route) => false);


