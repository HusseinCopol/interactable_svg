import 'package:flutter/material.dart';
import 'package:interactable_svg/interactable_svg/interactable_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
final GlobalKey<InteractableSvgState> mapKey = GlobalKey();
class _MyHomePageState extends State<MyHomePage> {


  Region? selectedRegion;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Interactable SVG Example"),
      ),
      body: Column(
        children: [
          Container(
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
                key: mapKey,
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
          MaterialButton(onPressed: (){
            if(selectedRegion!=null) {
              mapKey.currentState?.toggleButton(selectedRegion!);
            }
          }
          ,color: Colors.blue,
            child: const Text("select last selected room"),
          )
        ],
      ),

    );
  }
}
