import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 74,
          width: 74,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color(0xffE4E8F1), Color(0xffE6E9EF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: Color(0xffA6B4C8),
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(
                  3,
                  4,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 74,
          width: 74,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff768FB1), Color(0xffFFFFFF)],
              begin: Alignment.topLeft,
              end: Alignment.center,
            ),
          ),
        ),
        Container(
          height: 74,
          width: 74,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              const Color(0xffFD2B23).withOpacity(0.4),
              const Color(0xffFFFFFF)
            ], begin: Alignment.bottomRight, end: Alignment.center),
          ),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
            gradient: LinearGradient(
                colors: [Color(0xffFE725C), Color(0xffE5120A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
            gradient: LinearGradient(
                colors: [Color(0xffE5120A), Color(0xffFE725C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
        Image.asset(
          'assets/images/add.png',
        )
      ],
    );
  }
}
