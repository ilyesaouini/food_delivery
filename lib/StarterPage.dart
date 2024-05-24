import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/animations/FadeAnimation.dart';
import 'package:food_delivery/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with TickerProviderStateMixin {
 late AnimationController _animationController;
 late Animation<double> _animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationController =AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100)
      );
    _animation =Tween<double>(begin: 0.0,end: 25.0).animate(_animationController);
    super.initState();
  }

  void onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((value) => 
    Navigator.push(context, PageTransition(child: HomePage(), type: PageTransitionType.fade) ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/starter-image.jpg'),
          fit: BoxFit.cover)
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
               colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.7)
                       ]                       
             )
          ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(.5,Text('Taking Order For Deloivery', style: TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.bold),)),
              SizedBox(height: 20,),
            FadeAnimation(.5, Text("See restaurants nearby by \nadding location",style: TextStyle(color: Colors.white,height: 1.4,fontSize: 18),)),
            SizedBox(height:100,),
            FadeAnimation(.5,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: 
                  [
                    Colors.yellow,
                    Colors.orange
                  ]
                )
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                child: Text("Start",style: TextStyle(color: Colors.white),),
                onPressed: () => onTap()
              ),
            ),),
            SizedBox(height: 20,),
            FadeAnimation(.5,
            Align(
              child: Text("Now Deliver To Your Door 24/7",style: TextStyle(color: Colors.white,fontSize: 15),),
            ),),
            SizedBox(height: 30,),
            ]
          ),
           ),
        ),
      ),
    );
  }
}