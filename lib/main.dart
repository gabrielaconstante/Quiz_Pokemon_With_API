import 'package:flutter/material.dart';
import 'package:pokedex/screens/details.dart';
import 'package:pokedex/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
      initialRoute: '/',
    );
  }
}



























































































// import 'state_machine.dart';
// import 'package:flutter/material.dart';
// import 'package:diabetes_template/state_machine.dart';

// void main() {
//   runApp(const DiabetesHelper());
// }

// class DiabetesHelper extends StatelessWidget {
//   const DiabetesHelper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         body: const SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: DiabetesHelperPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DiabetesHelperPage extends StatefulWidget {
//   const DiabetesHelperPage({super.key});

//   @override
//   State<DiabetesHelperPage> createState() => _DiabetesHelperPageState();
// }

// class _DiabetesHelperPageState extends State<DiabetesHelperPage> {
//   StateMachine stateMachine = StateMachine();
//   var numState = 4;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         // Texto
//         // Expanded(
//         //   flex: 5,
//         //   child: Padding(
//         //     padding: EdgeInsets.all(10.0),
//         //     child: Center(
//         //       child: Text(
//         //         stateMachine.getStateText(),
//         //         textAlign: TextAlign.center,
//         //         style: TextStyle(
//         //           fontSize: 25.0,
//         //           color: const Color.fromARGB(255, 224, 45, 45),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),

//         // Botpes
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//               onPressed: () {
//                 checkAnswer(1);
//               },
//               child: Text(
//                 stateMachine.getStatechoice1(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           ),
//         ),











//         Visibility(






//           visible: stateMachine.getStatechoice2(numState) != null,
//           child: Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                 ),
//                 onPressed: () {
//                   checkAnswer(2);
//                 },
//                 child: Text(
//                   stateMachine.getStatechoice2(numState) ?? '',
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     fontSize: 20.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }




//   void checkAnswer(int userAnswer) {
//     setState(() {
//       if (stateMachine.isFinished()) {
//         stateMachine.reset();
//       } else {
//         stateMachine.nextState(userAnswer);
//       }
//     });
//   }
// }
