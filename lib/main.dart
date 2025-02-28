import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hcricket/config/routes.dart';
import 'package:hcricket/config/routes_name.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'hcricket',
            theme: AppTheme.lightTheme,
            initialRoute: RoutesName.Splashscreen,
            onGenerateRoute: Routes.genreteRoute,
          );
        });
  }
}


// BlocBuilder<DropdownBloc, DropdownState>(
//               builder: (context, state) {
//                 return DropdownButton<String>(
//                   value: selectedRole,
//                   items: [
//                     DropdownMenuItem(value: "Student", child: Text("Student")),
//                     DropdownMenuItem(value: "Teacher", child: Text("Teacher")),
//                   ],
//                   onChanged: (value) {
//                     setState(() {
//                       selectedRole = value!;
//                     });
//                     context.read<DropdownBloc>().add(SelectRole(value!));
//                   },
//                 );
//               },
//             ),
//             SizedBox(height: 10),
//             BlocBuilder<DropdownBloc, DropdownState>(
//               builder: (context, state) {
//                 return Column(
//                   children: List.generate(state.rollNumber, (index) {
//                     return TextField(
//                       controller: giftControllers[index],
//                       decoration: InputDecoration(labelText: "Gift ${index + 1}"),
//                     );
//                   }),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 int roleValue = context.read<DropdownBloc>().state.roleValue;
//                 List<String> gifts = giftControllers.map((controller) => controller.text).toList();

//                 context.read<ApiBloc>().add(
//                       SubmitUserData(
//                         name: nameController.text,
//                         address: addressController.text,
//                         role: roleValue,
//                         gifts: gifts,
//                       ),
//                     );
//               },
//               child: Text("Submit"),
//             ),


// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// // Events
// abstract class DropdownEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class SelectRole extends DropdownEvent {
//   final String role;
//   SelectRole(this.role);

//   @override
//   List<Object> get props => [role];
// }

// class UpdateRollNumber extends DropdownEvent {
//   final int rollNumber;
//   UpdateRollNumber(this.rollNumber);

//   @override
//   List<Object> get props => [rollNumber];
// }

// // State
// class DropdownState extends Equatable {
//   final int roleValue; // 0 for Student, 1 for Teacher
//   final int rollNumber; // Number of gifts

//   DropdownState({required this.roleValue, required this.rollNumber});

//   DropdownState copyWith({int? roleValue, int? rollNumber}) {
//     return DropdownState(
//       roleValue: roleValue ?? this.roleValue,
//       rollNumber: rollNumber ?? this.rollNumber,
//     );
//   }

//   @override
//   List<Object> get props => [roleValue, rollNumber];
// }

// // Bloc
// class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
//   DropdownBloc() : super(DropdownState(roleValue: 0, rollNumber: 0)) {
//     on<SelectRole>((event, emit) {
//       int roleValue = (event.role == "Student") ? 0 : 1;
//       emit(state.copyWith(roleValue: roleValue));
//     });

//     on<UpdateRollNumber>((event, emit) {
//       emit(state.copyWith(rollNumber: event.rollNumber));
//     });
//   }
// }