import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGoogleFacebookSignIn extends StatelessWidget {
  const CustomGoogleFacebookSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 25.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSignInButton(
          context,
          image: 'assets/images/google.png',
          onTap: () {
            // Handle Google sign-in logic
          },
        ),

        _buildSignInButton(
          context,
          image: 'assets/images/facebook.png',
          onTap: () {
            // Handle Facebook sign-in logic
          },
        ),
      ],
    );
  }

  Widget _buildSignInButton(
    BuildContext context, {
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Image.asset(image, width: 24, height: 24),
      ),
    );
  }
}
