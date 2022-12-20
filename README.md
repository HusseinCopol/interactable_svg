# interactable SVG

A flutter package for interact with different parts of a SVG.

![ezgif-1-329e06ec0d](https://user-images.githubusercontent.com/43154747/208778220-8c16a386-f92d-46b8-a8a3-b9028c3abb29.gif)


## Getting Started

In the `pubspec.yaml` of your **Flutter** project, add the following dependency:

```yaml
dependencies:
  ...
  interactable_svg: any
```

In your library file add the following import:

```dart
import 'package:interactable_svg/interactable_svg/interactable_svg.dart';
```

## Usage

```dart
        InteractiveViewer(
          scaleEnabled: true,
          panEnabled: true,
          constrained: true,
          child:InteractableSvg(
            svgAddress: "assets/floor_map.svg",
            onChanged: (region) {
              setState(() {
                selectedCity = region;

              });
            },

            width: double.infinity,
            height: double.infinity,
            toggleEnable: true,
            dotColor: Colors.black,
            selectedColor: Colors.red.withOpacity(0.5),
            strokeColor: Colors.blue,
            unSelectableId: "bg",
            centerDotEnable:true ,
            centerTextEnable:true ,
            strokeWidth: 2.0,
            centerTextStyle: const TextStyle(fontSize: 12,color: Colors.black),


          ),
        )
```

Also your SVG must follow the following pattern.For better understanding see the example SVG.
```
'.* id="(.*)" name="(.*)" .* d="(.*)"'
for example:
  <path id="118" name="room 9" class="st0" d="M55 508h101.26v330H55Z" />;

```
## Props
| props                   |         types          |                     description                      |
| :---------------------- |:----------------------:|:----------------------------------------------------:|
| key        |         `Key?`         |                                                      |
| svgAddress       |        `String`        |     Address of SVG like  "assets/floor_map.svg"      |
| width           |       `double?`        |     Map width. Default value is double.infinity      |
| height       |       `double?`        |     Map height. Default value is double.infinity     |
| strokeColor       |        `Color?`        |             Color of the region borders              |
| selectedColor       |        `Color?`        |             Color of the selected region             |
| strokeWidth |       `double?`       |             Width of the region borders              |
| toggleEnable |       `boolean?`       |      Region selecting act as like toggle button      |
| onChanged       | `Function(City? city)` |       Returns new region value when it changed       |
| unSelectableId |       `String?`        |      Makes that region wi that id non selective      |
| centerDotEnable |       `boolean?`       |       place a dot in the center of the region        |
| centerTextEnable |       `boolean?`       | place name of the region at the center of the region |
| centerTextStyle |      `TextStyle?`      |             Style of name of the region              |
| dotColor |        `Color?`        |     Color of the dot in the center of the region     |

Author
------

* [Hussein Hajian](https://github.com/HusseinCopol)