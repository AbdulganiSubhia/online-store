import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final bool  isLoading;
  final void Function()? onPressed;
  final String lable;

  const PrimaryButtonWidget({super.key, this.onPressed, required this.lable, this.isLoading = false});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isLoading
            ? Colors.black12
            : const Color.fromARGB(255, 253, 163, 28),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: isLoading
          ? SizedBox(
            height: 25,width: 25,
            child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
          )
          : Text(
              lable,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
