import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_app/core/theme/app_colors.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/auth/register/presentation/manager/terms_cubit.dart';

class AcceptTermsCheckbox extends StatelessWidget {
  const AcceptTermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsCubit, bool>(
      builder: (context, isChecked) {
        return Row(
          children: [
            Checkbox(
              activeColor: AppColors.orangeColor,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              side: const BorderSide(color: AppColors.orangeColor, width: 1),
              value: isChecked,
              onChanged: (val) {
                context.read<TermsCubit>().toggle(val);
              },
            ),
            Expanded(
              child: Text(
                "Accept Terms & Conditions",
                style: TextAppTheme.textStyle12.copyWith(
                  color: AppColors.orangeColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
