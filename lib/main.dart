import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.redAccent,
      home: Myhome(),
    );
  }
}
class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  bool _cheak = true;
  bool _switch= false;
  bool _animated=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: ()
      {

        setState(() {
          _animated =! _animated;
        });
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //this is Animated cross fade
            Text("Animated cross fade widget",style: TextStyle(
              fontSize: 27
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        AnimatedCrossFade(firstChild:  Container(
        height:100.00,
          color: Colors.amberAccent,
          child:ElevatedButton(onPressed: (){
            setState(() {
              _cheak=false;

            });
          },
              child: Text("sign in",style: TextStyle(
                  fontSize: 60,
                  color: Colors.redAccent
              ),)),
        ),
          secondChild:Text("Sign in successfull",style: TextStyle(
              fontSize: 40,
              color: Colors.redAccent
          )),
          crossFadeState: _cheak ? CrossFadeState.showFirst :CrossFadeState.showSecond,
          duration: Duration(seconds: 1)),
              ],
            ),
            SizedBox(height: 20,
            ),
            //this is switch widget.....
            Text("Switch widget",style: TextStyle(
                fontSize: 27
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  activeColor: Colors.redAccent,
                    activeTrackColor: Colors.black,
                    value: _switch, onChanged: (val){
                  setState(() {
                    _switch=val;
                    print(_switch);
                  });
                })
              ],
            ),
            SizedBox(height: 20,),
            Text("Animated Container widget",style: TextStyle(
                fontSize: 27
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AnimatedContainer(
                  height: _animated==false?150:250,
                  width: _animated==false?150:200,
                    color: Colors.blue,
                    duration: Duration(seconds: 4)

                )
              ],
            )
          ]
        ),
      ),
    );
  }
}
