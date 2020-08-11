import 'package:flutter/material.dart';
import 'package:iventure001/Data/BlitzCanvasContent/BcFrameworkData.dart';

class StepperDemo extends StatefulWidget {
  //StepperDemo() : super();

  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}

class StepperDemoState extends State<StepperDemo> {
  //
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text('Step 1'),
      content: Text(bcStepsContent[0].frameworkStep),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Hello World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 4'),
      content: Text('World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 5'),
      content: Text('Hello World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 6'),
      content: Text('World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 7'),
      content: Text('Hello World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 8'),
      content: Text('World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 9'),
      content: Text('Hello World!'),
      isActive: false,
    ),
    Step(
      title: Text('Step 10'),
      content: Text('Hello World!'),
      state: StepState.complete,
      isActive: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Simple Stepper Demo"),
      ),
      // Body
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          steps: steps,
          type: StepperType.horizontal,
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
        ),
      ),
    );
  }
}