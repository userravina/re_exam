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

else if (click == "-18%") {
          controller.prevOpertor.value = "(-18%)";
          controller.value.add(controller.display.value);
          controller.saveValueListToPrefs();
          print("currentValue ${controller.currentValue.value}");
          print("percentage ${controller.percentage.value}");
          controller.percentage.value = controller.currentValue.value * 0.18;
          print("percentage ${controller.percentage.value}");
          print(" ============= ${number} ");
          gstoperator = number;

          controller.result.value = controller.percentage.value / 2;
          print(" ============= ${controller.result.value} ");

        } else if (click == "-GST") {
          gst = true;
          print('-------------------------');
          print("currentValue ${controller.currentValue}");
          if (gstoperator == "-18%") {
            controller.percentage.value = controller.currentValue.value * 0.18;
            print("percentage ${controller.percentage.value}");
            print(" ============= ${number} ");

            controller.result.value = controller.percentage.value / 2;
            print(" ============= ${controller.result.value} ");
            gstoperator = "18%";
            controller.gstAmount.value =
                (controller.currentValue * controller.percentage.value) / 100;

            controller.gstAmount.value = controller.currentValue.value -
                controller.currentValue.value * (100 / (100 + controller.percentage.value));
            print(controller.gstAmount.value);
            twonumber = controller.gstAmount.value.toStringAsFixed(1);
            controller.value.add("IGST ${gstoperator}   " +twonumber.toString());
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value.toStringAsFixed(1);
            String digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("CGST ${digitresult}%      " + twonumber.toString());
            controller.saveValueListToPrefs();

            controller.SGST.value = controller.gstAmount.value / 2;
            twonumber = controller.SGST.value.toStringAsFixed(1);
            digitresult = controller.result.value.toStringAsFixed(0);
            controller.value.add("SGST ${digitresult}%      " + twonumber.toString());
            controller.saveValueListToPrefs();

            controller.result.value =
                controller.currentValue.value - controller.gstAmount.value;
            twonumber = controller.result.value.toStringAsFixed(1);
            controller.value.add("GST  = " + twonumber.toString());
            controller.saveValueListToPrefs();
          }
