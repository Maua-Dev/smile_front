import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class HeaderTableWidget extends StatelessWidget {
  const HeaderTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.3,
          height: 50,
          child: const Text(
            'Nome',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(16)),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          height: 50,
          child: const Text(
            'Data',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(16)),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.1,
          height: 50,
          child: const Text(
            'Hora',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(16)),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          child: const Text(
            'Tipo',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(16)),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.05,
          height: 50,
          child: const Text(
            'Vagas',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(16)),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.05,
          height: 50,
          child: const Text(
            'Ações',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(16)),
        ),
      ],
    );
  }
}
