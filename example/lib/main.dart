import 'package:flutter/material.dart';
import 'package:interactable_svg/interactable_svg/interactable_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intractable SVG Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Region? selectedRegion;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Interactable SVG Example"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey.withOpacity(0.2)
        ),

        child: InteractiveViewer(
          scaleEnabled: true,
          panEnabled: true,
          constrained: true,


          child:InteractableSvg(
            svgAddress: "assets/floor_map.svg",
            onChanged: (region) {
              setState(() {
                selectedRegion = region;

              });
            },

            width: double.infinity,
            height: double.infinity,
            toggleEnable: true,
            isMultiSelectable: false,
            dotColor: Colors.black,
            selectedColor: Colors.red.withOpacity(0.5),
            strokeColor: Colors.blue,
            unSelectableId: "bg",
            centerDotEnable:true ,
            centerTextEnable:true ,
            strokeWidth: 2.0,
            centerTextStyle: const TextStyle(fontSize: 12,color: Colors.black,

            ),


          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
