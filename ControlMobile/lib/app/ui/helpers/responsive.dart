import 'package:flutter/material.dart';
import 'dart:math' as math;

/// `Clase para el responsive`
///
/// Clase para hacer responsive todo la aplicacion movil, para que funcione,
/// en cualquier dipositivo.
///
/// ```dart
///   final responsive = Rpsve();
///   final size = responsive.hp(1);
/// ```
class Rpsve {
  final Size size;
  double get width => size.width;
  double get height => size.height;
  final double diagonal;

  factory Rpsve.of(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = math.sqrt(
      math.pow(size.width, 2) + math.pow(size.height, 2),
    );
    return Rpsve(
      size: size,
      diagonal: diagonal,
    );
  }

  /// `Altura`
  ///
  /// hp : reporna el valor en pixeles el ancho de la pantalla,
  /// [percent] :  es el pocentaje el cual se quiere retornar (0 a 100).
  double wp(double percent) {
    return percent * width / 100;
  }

  /// `Altura`
  ///
  /// hp : reporna el valor en pixeles la altura de la pantalla,
  /// [percent] :  es el pocentaje el cual se quiere retornar (0 a 100).
  double hp(double percent) {
    return percent * height / 100;
  }

  /// `Diagonal`
  ///
  /// dp : reporna el valor en pixeles la diagonal de la pantalla,
  /// [percent] :  es el pocentaje el cual se quiere retornar (0 a 100).
  double dp(double percent) {
    return percent * diagonal / 100;
  }

  Rpsve({
    required this.size,
    required this.diagonal,
  });
}

///CLASE RESPONSIVE PARA USAR MEDIANTE EL CONTEXT
extension Responsive on BuildContext {
  Size get sz => MediaQuery.of(this).size;

  /// Ancho de la pantalla
  double get wd => sz.width;

  /// Alto de la pantalla
  double get hg => sz.height;

  double get diagonal {
    final diagonal = math.sqrt(
      math.pow(sz.width, 2) + math.pow(sz.height, 2),
    );
    return diagonal;
  }

  /// `Altura`
  ///
  /// hp : reporna el valor en pixeles el ancho de la pantalla,
  /// [percent] :  es el pocentaje el cual se quiere retornar (0 a 100).
  double wp(double percent) {
    return percent * wd / 100;
  }

  /// `Altura`
  ///
  /// hp : reporna el valor en pixeles la altura de la pantalla,
  /// [percent] :  es el pocentaje el cual se quiere retornar (0 a 100).
  double hp(double percent) {
    return percent * hg / 100;
  }

  /// `Diagonal`
  ///
  /// dp : reporna el valor en pixeles la diagonal de la pantalla,
  /// [percent] :  es el pocentaje el cual se quiere retornar (0 a 100).
  double dp(double percent) {
    return percent * diagonal / 100;
  }
}
