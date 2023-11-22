import 'package:flutter/material.dart';
import 'package:gerentea/core/utils/size_utils.dart';
import 'package:gerentea/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge16 => theme.textTheme.bodyLarge!
      .copyWith(fontSize: 16.fSize, color: Colors.white);
  static get bodyLargeAbhayaLibreExtraBoldOnPrimaryContainer =>
      theme.textTheme.bodyLarge!.abhayaLibreExtraBold.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 18.fSize,
      );
  static get titleLargeLexendDecaGreen700 =>
      theme.textTheme.titleLarge!.lexendDeca.copyWith(
        color: appTheme.green700,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get displaySmallErrorContainer_1 =>
      theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyLargeJostGray60001 => theme.textTheme.bodyLarge!.jost.copyWith(
        color: appTheme.gray60001,
        fontSize: 17.fSize,
      );
  static get bodyLargeJostPrimaryContainer =>
      theme.textTheme.bodyLarge!.jost.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 17.fSize,
      );
  static get bodyMediumBluegray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter;
  static get bodyMediumInter_1 => theme.textTheme.bodyMedium!.inter;
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyLargeInterOnErrorContainer =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 16.fSize,
      );
  // Display text style
  static get displaySmallBlueA100 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.blueA100,
      );
  // Headline text style
  static get headlineLargeJostOnPrimaryContainer =>
      theme.textTheme.headlineLarge!.jost.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeOnPrimaryContainer =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 32.fSize,
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeOnPrimaryContainerBold =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 32.fSize,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeOnPrimaryContainerBold32 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 32.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeActorGreen700 =>
      theme.textTheme.titleLarge!.actor.copyWith(
        color: appTheme.green700,
        fontSize: 23.fSize,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get bodyLargeAsapGray900_1 => theme.textTheme.bodyLarge!.asap.copyWith(
        color: appTheme.gray900,
      );
  static get bodyLargeBlack900_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get headlineLargeRegular => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );
  static get headlineMediumItimBlueA100 =>
      theme.textTheme.headlineMedium!.itim.copyWith(
        color: appTheme.blueA100,
        fontSize: 28.fSize,
      );
  static get headlineMediumItimErrorContainer =>
      theme.textTheme.headlineMedium!.itim.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 28.fSize,
      );
  static get headlineMediumItimErrorContainer28 =>
      theme.textTheme.headlineMedium!.itim.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 28.fSize,
      );
  static get headlineMediumJostGreen700 =>
      theme.textTheme.headlineMedium!.jost.copyWith(
        color: appTheme.green700,
        fontSize: 28.fSize,
      );
  static get headlineMediumOnPrimaryContainer =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallActorBlack900 =>
      theme.textTheme.headlineSmall!.actor.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelMediumGray600 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray600,
      );
  // Title text style
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInterOnPrimaryContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 16.fSize,
      );
  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }

  TextStyle get abhayaLibreExtraBold {
    return copyWith(
      fontFamily: 'Abhaya Libre ExtraBold',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get actor {
    return copyWith(
      fontFamily: 'Actor',
    );
  }

  TextStyle get lexendDeca {
    return copyWith(
      fontFamily: 'Lexend Deca',
    );
  }

  TextStyle get inder {
    return copyWith(
      fontFamily: 'Inder',
    );
  }

  TextStyle get asap {
    return copyWith(
      fontFamily: 'Asap',
    );
  }

  TextStyle get itim {
    return copyWith(
      fontFamily: 'Itim',
    );
  }
}
