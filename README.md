# interactable SVG

A flutter package for interacting with different parts of an SVG.

![example](https://user-images.githubusercontent.com/43154747/208787228-6dda3327-585d-4bae-a099-ad2b6f9170ed.gif)


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
| props                   |           types            |                     description                      |
| :---------------------- |:--------------------------:|:----------------------------------------------------:|
| key        |           `Key?`           |                                                      |
| svgAddress       |          `String`          |    Address of an SVG like  "assets/floor_map.svg"    |
| width           |         `double?`          |     SVG width. Default value is double.infinity      |
| height       |         `double?`          |     SVG height. Default value is double.infinity     |
| strokeColor       |          `Color?`          |             Color of the region borders              |
| selectedColor       |          `Color?`          |             Color of the selected region             |
| strokeWidth |         `double?`          |             Width of the region borders              |
| toggleEnable |          `bool?`           |      Region selecting act as like toggle button      |
| isMultiSelectable |          `bool?`           |          select multiple regions at once         |
| onChanged       | `Function(Region? region)` |       Returns new region value when it changed       |
| unSelectableId |         `String?`          |      Makes that region wi that id non selective      |
| centerDotEnable |          `bool?`           |       place a dot in the center of the region        |
| centerTextEnable |          `bool?`           | place name of the region at the center of the region |
| centerTextStyle |        `TextStyle?`        |             Style of name of the region              |
| dotColor |          `Color?`          |     Color of the dot in the center of the region     |

Author
------

* [Hussein Copol](https://github.com/HusseinCopol)
