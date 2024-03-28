# re_exam

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
<p>
  <img src="https://github.com/userravina/re_exam/assets/120082785/81bc1725-fa25-4a71-8bd8-834980bb89b4" height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/3938dad3-351a-4d43-99ee-a07457df9043"  height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/5c989356-429c-42cb-af53-b846c047d09f" height="50%" width="30%">
  <img src="https://github.com/userravina/re_exam/assets/120082785/f047ff5f-f02b-4762-9b23-c0c8345ea5d2"  height="50%" width="30%">
</p>
apply plugin: 'com.google.gms.google-services'

    if(onetime == false) {
                   if (controller.prevOpertor.value == "+"){
                     print("onetime");
                     String display = controller.display.value;
                     print(display);
                     controller.value.add(
                         controller.prevOpertor.value + controller.display.value);
                     controller.saveValueListToPrefs();
                     print(controller.value);
                     print("currentValue ${controller.currentValue.value}");
                     controller.currentValue.value =
                         double.parse(controller.value[0]);
                     print("currentValue ${controller.currentValue.value}");

                     double percentageValue =
                         controller.currentValue.value * double.parse(display);
                     print("percentageValue ${percentageValue}");
                     percentageValue /= 100;
                     print("percentageValue ${percentageValue}");
                     double newValue =
                         controller.currentValue.value + percentageValue;

                     print("newValue ${newValue}");
                     // Update the display with the new value
                     controller.display.value = newValue.toString();

                     controller.displayEnglish.value = newValue.toString();
                   } else if (controller.prevOpertor.value == "-") {
                     String display = controller.display.value;
                     controller.value.add(
                         controller.prevOpertor.value + controller.display.value);
                     controller.saveValueListToPrefs();
                     print(controller.value.value);
                     print("currentValue ${controller.currentValue.value}");
                     controller.currentValue.value = double.parse(controller.value[0]);
                     print("currentValue ${controller.currentValue.value}");
                     double percentageValue =
                         controller.currentValue.value * double.parse(display);
                     print("percentageValue ${percentageValue}");
                     percentageValue /= 100;
                     print("percentageValue ${percentageValue}");
                     double newValue =
                         controller.currentValue.value - percentageValue;

                     print("newValue ${newValue}");
                     // Update the display with the new value
                     controller.display.value = newValue.toString();

                     controller.displayEnglish.value = newValue.toString();
                   } else if (controller.prevOpertor.value == "*") {
                     String display = controller.display.value;
                     controller.value.add(
                         controller.prevOpertor.value + controller.display.value);
                     controller.saveValueListToPrefs();
                     print(controller.value.value);
                     print("currentValue ${controller.currentValue.value}");
                     controller.currentValue.value =
                         double.parse(controller.value[0]);
                     print("currentValue ${controller.currentValue.value}");
                     double percentageValue =
                         controller.currentValue.value * double.parse(display);
                     print("percentageValue ${percentageValue}");
                     percentageValue /= 100;
                     print("percentageValue ${percentageValue}");
                     print('************');
                     double newValue =
                         controller.currentValue.value * percentageValue;

                     print("newValue ${newValue}");
                     // Update the display with the new value
                     controller.display.value = percentageValue.toString();

                     controller.displayEnglish.value = percentageValue.toString();
                   } else if (controller.prevOpertor.value == "/") {
                     String display = controller.display.value;
                     controller.value.add(
                         controller.prevOpertor.value + controller.display.value);
                     controller.saveValueListToPrefs();
                     print(controller.value.value);
                     print("currentValue ${controller.currentValue.value}");
                     controller.currentValue.value =
                         double.parse(controller.value[0]);
                     print("currentValue ${controller.currentValue.value}");
                     double percentageValue =
                         controller.currentValue.value / double.parse(display);
                     print("percentageValue ${percentageValue}");
                     percentageValue *= 100;
                     print("percentageValue ${percentageValue}");
                     double newValue =
                         controller.currentValue.value / percentageValue;

                     print("newValue ${newValue}");
                     // Update the display with the new value
                     controller.display.value = percentageValue.toString();

                     controller.displayEnglish.value = percentageValue.toString();
                   }else if(onetime == true)
                     {

                     }
                 } else if (onetime == true) {
                 controller.prevOpertor.value = "=";
                 print("tttttttttttttttttttttttttttt");
                 controller.displayOprater.value = number;
                 print(controller.displayOprater.value);
                 print(" 4000000000000000000${controller.display.value}");
                 print("4444444444444${display}");

                 controller.value.add(
                     controller.displayOprater.value + controller.display.value);

                 controller.currentValue.value = double.parse(display);
                 print("currentValue ${controller.currentValue.value}");
                 double percentageValue = controller.currentValue.value * 100;
                 print("percentageValue ${percentageValue}");
                 double r = 100 - double.parse(controller.display.value);
                 print(percentageValue);
                 print(r);
                 double r1 = percentageValue / r;
                 print(r1);
                 controller.value.add(controller.prevOpertor.value + r1.toString());
                 controller.saveValueListToPrefs();
                 print(controller.value.value);
               }
