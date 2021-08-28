import 'package:covid19app/app/shared/utils/theme.dart';
import 'package:flutter/material.dart';

class Images {
  static const pmst = const AssetImage('assets/images/logo-pmst-1.png');
  static const pmst2 = const AssetImage('assets/images/logo-pmst-2.png');
  static const logoBsi = const AssetImage('assets/images/logobsi.png');
  static const logoUast = const AssetImage('assets/images/logouast.png');
}

class Texts {
  static const aboutTitleText = const Text(
    'Sobre a aplicação',
    style: TextStyle(
      color: AppColors.colorDarkBlue,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  );

  static const support = const Text(
    'Apoio',
    style: TextStyle(
      color: AppColors.colorDarkBlue,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  );

  static const aboutDescriptionText = const Text(
    'Sertão Saúde é uma ferramenta para auxílio no combate ao Coronavirus na cidade de Serra Talhada. O aplicativo fornece atualizações diárias sobre casos suspeitos e confirmados, dicas de como se proteger e locais onde há um maior número de pessoas com sintomas de gripe em nossa cidade.  Para isto, precisamos de informações diárias da população e contamos com a sua colaboração para salvarmos vidas.',
    style: TextStyle(
      fontSize: 16.0,
      color: AppColors.colorDarkBlue,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.justify,
  );

  static const connectNowText = const Text(
    'Fale com a gente!',
    style: TextStyle(
      fontSize: 18.0,
      color: AppColors.colorDarkBlue,
      fontWeight: FontWeight.bold,
    ),
  );
}
