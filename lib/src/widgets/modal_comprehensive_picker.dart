import 'package:countrify/src/widgets/colored_safe_area.dart';
import 'package:countrify/src/widgets/country_picker_config.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../models/country.dart';
import '../models/country_code.dart';
import 'comprehensive_country_picker.dart';
import 'country_picker_config.dart' as config;
import 'country_picker_theme.dart';

/// {@template modal_comprehensive_picker}
/// Modal display methods for the comprehensive country picker
/// {@endtemplate}
class ModalComprehensivePicker {
  /// Show country picker as bottom sheet
  static Future<Country?> showBottomSheet({
    required BuildContext context,
    CountryCode? initialCountryCode,
    ValueChanged<Country>? onCountrySelected,
    ValueChanged<Country>? onCountryChanged,
    ValueChanged<String>? onSearchChanged,
    ValueChanged<CountryFilter>? onFilterChanged,
    CountryPickerTheme? theme,
    config.CountryPickerConfig? config,
    bool showCloseButton = true,
    bool showPhoneCode = true,
    bool showFlag = true,
    bool showCountryName = true,
    bool showCapital = false,
    bool showRegion = false,
    bool showPopulation = false,
    bool searchEnabled = true,
    bool filterEnabled = false,
    bool enableScrollbar = true,
    int searchDebounceMs = 300,
    CountrySortBy sortBy = CountrySortBy.name,
    bool includeIndependent = true,
    bool includeUnMembers = true,
    double? maxHeight,
    double minHeight = 200.0,
    double? dropdownMaxHeight,
    Size flagSize = const Size(32, 24),
    FlagShape flagShape = FlagShape.rectangular,
    Color? flagShadowColor,
    double flagShadowBlur = 2.0,
    Offset flagShadowOffset = const Offset(0, 1),
    String filterTitleText = 'Filter Countries',
    String filterSortByText = 'Sort by:',
    String filterRegionsText = 'Regions:',
    String filterAllText = 'All',
    String filterCancelText = 'Cancel',
    String filterApplyText = 'Apply',
    Widget Function(BuildContext context, Country country, bool isSelected)? customCountryBuilder,
    Widget Function(BuildContext context)? customHeaderBuilder,
    Widget Function(
            BuildContext context, TextEditingController controller, ValueChanged<String> onChanged)?
        customSearchBuilder,
    Widget Function(
            BuildContext context, CountryFilter filter, ValueChanged<CountryFilter> onChanged)?
        customFilterBuilder,
    bool hapticFeedback = true,
    Duration animationDuration = const Duration(milliseconds: 300),
    Duration debounceDuration = const Duration(milliseconds: 300),
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    bool useRootNavigator = false,
    bool useSafeArea = true,
    Color? barrierColor,
    String? barrierLabel,
    bool barrierDismissible = true,
    RouteSettings? routeSettings,
  }) async {
    final result = await showMaterialModalBottomSheet<Country>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor ?? Colors.black54,
      settings: routeSettings,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final effectiveConfig = config ?? const CountryPickerConfig();
        Widget picker = ComprehensiveCountryPicker(
          initialCountryCode: initialCountryCode,
          onCountrySelected: onCountrySelected,
          onCountryChanged: onCountryChanged,
          onSearchChanged: onSearchChanged,
          onFilterChanged: onFilterChanged,
          theme: theme,
          config: effectiveConfig,
          pickerType: CountryPickerType.bottomSheet,
          showCloseButton: showCloseButton,
          showPhoneCode: showPhoneCode,
          showFlag: showFlag,
          showCountryName: showCountryName,
          showCapital: showCapital,
          showRegion: showRegion,
          showPopulation: showPopulation,
          searchEnabled: searchEnabled,
          filterEnabled: filterEnabled,
          enableScrollbar: enableScrollbar,
          searchDebounceMs: searchDebounceMs,
          sortBy: sortBy,
          includeIndependent: includeIndependent,
          includeUnMembers: includeUnMembers,
          maxHeight: maxHeight,
          minHeight: minHeight,
          dropdownMaxHeight: dropdownMaxHeight,
          flagSize: flagSize,
          flagShape: flagShape,
          flagShadowColor: flagShadowColor,
          flagShadowBlur: flagShadowBlur,
          flagShadowOffset: flagShadowOffset,
          filterTitleText: filterTitleText,
          filterSortByText: filterSortByText,
          filterRegionsText: filterRegionsText,
          filterAllText: filterAllText,
          filterCancelText: filterCancelText,
          filterApplyText: filterApplyText,
          customCountryBuilder: customCountryBuilder,
          customHeaderBuilder: customHeaderBuilder,
          customSearchBuilder: customSearchBuilder,
          customFilterBuilder: customFilterBuilder,
          hapticFeedback: hapticFeedback,
          animationDuration: animationDuration,
          debounceDuration: debounceDuration,
        );

        if (effectiveConfig.useSafeArea) {
          picker = ClipRRect(
            borderRadius:
                theme?.borderRadius ?? const BorderRadius.vertical(top: Radius.circular(20)),
            child: ColoredSafeArea(
              color: effectiveConfig.safeAreaColor,
              top: effectiveConfig.safeAreaTop,
              bottom: effectiveConfig.safeAreaBottom,
              child: picker,
            ),
          );
        }

        return picker;
      },
    );
    return result;
  }

  /// Show country picker as dialog
  static Future<Country?> showDialog({
    required BuildContext context,
    CountryCode? initialCountryCode,
    ValueChanged<Country>? onCountrySelected,
    ValueChanged<Country>? onCountryChanged,
    ValueChanged<String>? onSearchChanged,
    ValueChanged<CountryFilter>? onFilterChanged,
    CountryPickerTheme? theme,
    config.CountryPickerConfig? config,
    bool showCloseButton = true,
    bool showPhoneCode = true,
    bool showFlag = true,
    bool showCountryName = true,
    bool showCapital = false,
    bool showRegion = false,
    bool showPopulation = false,
    bool searchEnabled = true,
    bool filterEnabled = false,
    bool enableScrollbar = true,
    int searchDebounceMs = 300,
    CountrySortBy sortBy = CountrySortBy.name,
    bool includeIndependent = true,
    bool includeUnMembers = true,
    double? maxHeight,
    double minHeight = 200.0,
    double? dropdownMaxHeight,
    Size flagSize = const Size(32, 24),
    FlagShape flagShape = FlagShape.rectangular,
    Color? flagShadowColor,
    double flagShadowBlur = 2.0,
    Offset flagShadowOffset = const Offset(0, 1),
    String filterTitleText = 'Filter Countries',
    String filterSortByText = 'Sort by:',
    String filterRegionsText = 'Regions:',
    String filterAllText = 'All',
    String filterCancelText = 'Cancel',
    String filterApplyText = 'Apply',
    Widget Function(BuildContext context, Country country, bool isSelected)? customCountryBuilder,
    Widget Function(BuildContext context)? customHeaderBuilder,
    Widget Function(
            BuildContext context, TextEditingController controller, ValueChanged<String> onChanged)?
        customSearchBuilder,
    Widget Function(
            BuildContext context, CountryFilter filter, ValueChanged<CountryFilter> onChanged)?
        customFilterBuilder,
    bool hapticFeedback = true,
    Duration animationDuration = const Duration(milliseconds: 300),
    Duration debounceDuration = const Duration(milliseconds: 300),
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
  }) async {
    final result = await showGeneralDialog<Country>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black54,
      barrierLabel: barrierLabel ?? 'Close dialog',
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) {
        final effectiveConfig = config ?? const CountryPickerConfig();
        final Widget dialogPicker = ComprehensiveCountryPicker(
          initialCountryCode: initialCountryCode,
          onCountrySelected: onCountrySelected,
          onCountryChanged: onCountryChanged,
          onSearchChanged: onSearchChanged,
          onFilterChanged: onFilterChanged,
          theme: theme,
          config: effectiveConfig,
          pickerType: CountryPickerType.dialog,
          showCloseButton: showCloseButton,
          showPhoneCode: showPhoneCode,
          showFlag: showFlag,
          showCountryName: showCountryName,
          showCapital: showCapital,
          showRegion: showRegion,
          showPopulation: showPopulation,
          searchEnabled: searchEnabled,
          filterEnabled: filterEnabled,
          enableScrollbar: enableScrollbar,
          searchDebounceMs: searchDebounceMs,
          sortBy: sortBy,
          includeIndependent: includeIndependent,
          includeUnMembers: includeUnMembers,
          maxHeight: maxHeight,
          minHeight: minHeight,
          dropdownMaxHeight: dropdownMaxHeight,
          flagSize: flagSize,
          flagShape: flagShape,
          flagShadowColor: flagShadowColor,
          flagShadowBlur: flagShadowBlur,
          flagShadowOffset: flagShadowOffset,
          filterTitleText: filterTitleText,
          filterSortByText: filterSortByText,
          filterRegionsText: filterRegionsText,
          filterAllText: filterAllText,
          filterCancelText: filterCancelText,
          filterApplyText: filterApplyText,
          customCountryBuilder: customCountryBuilder,
          customHeaderBuilder: customHeaderBuilder,
          customSearchBuilder: customSearchBuilder,
          customFilterBuilder: customFilterBuilder,
          hapticFeedback: hapticFeedback,
          animationDuration: animationDuration,
          debounceDuration: debounceDuration,
        );

        return dialogPicker;
      },
    );
    return result;
  }

  /// Show country picker as full screen
  static Future<Country?> showFullScreen({
    required BuildContext context,
    CountryCode? initialCountryCode,
    ValueChanged<Country>? onCountrySelected,
    ValueChanged<Country>? onCountryChanged,
    ValueChanged<String>? onSearchChanged,
    ValueChanged<CountryFilter>? onFilterChanged,
    CountryPickerTheme? theme,
    config.CountryPickerConfig? config,
    bool showCloseButton = true,
    bool showPhoneCode = true,
    bool showFlag = true,
    bool showCountryName = true,
    bool showCapital = false,
    bool showRegion = false,
    bool showPopulation = false,
    bool searchEnabled = true,
    bool filterEnabled = false,
    bool enableScrollbar = true,
    int searchDebounceMs = 300,
    CountrySortBy sortBy = CountrySortBy.name,
    bool includeIndependent = true,
    bool includeUnMembers = true,
    double? maxHeight,
    double minHeight = 200.0,
    double? dropdownMaxHeight,
    Size flagSize = const Size(32, 24),
    FlagShape flagShape = FlagShape.rectangular,
    Color? flagShadowColor,
    double flagShadowBlur = 2.0,
    Offset flagShadowOffset = const Offset(0, 1),
    String filterTitleText = 'Filter Countries',
    String filterSortByText = 'Sort by:',
    String filterRegionsText = 'Regions:',
    String filterAllText = 'All',
    String filterCancelText = 'Cancel',
    String filterApplyText = 'Apply',
    Widget Function(BuildContext context, Country country, bool isSelected)? customCountryBuilder,
    Widget Function(BuildContext context)? customHeaderBuilder,
    Widget Function(
            BuildContext context, TextEditingController controller, ValueChanged<String> onChanged)?
        customSearchBuilder,
    Widget Function(
            BuildContext context, CountryFilter filter, ValueChanged<CountryFilter> onChanged)?
        customFilterBuilder,
    bool hapticFeedback = true,
    Duration animationDuration = const Duration(milliseconds: 300),
    Duration debounceDuration = const Duration(milliseconds: 300),
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
  }) async {
    final result = await Navigator.of(context, rootNavigator: useRootNavigator).push<Country>(
      MaterialPageRoute<Country>(
        settings: routeSettings,
        builder: (context) {
          final effectiveConfig = config ?? const CountryPickerConfig();
          final Widget fullScreenPicker = ComprehensiveCountryPicker(
            initialCountryCode: initialCountryCode,
            onCountrySelected: onCountrySelected,
            onCountryChanged: onCountryChanged,
            onSearchChanged: onSearchChanged,
            onFilterChanged: onFilterChanged,
            theme: theme,
            config: effectiveConfig,
            pickerType: CountryPickerType.fullScreen,
            showCloseButton: showCloseButton,
            showPhoneCode: showPhoneCode,
            showFlag: showFlag,
            showCountryName: showCountryName,
            showCapital: showCapital,
            showRegion: showRegion,
            showPopulation: showPopulation,
            searchEnabled: searchEnabled,
            filterEnabled: filterEnabled,
            enableScrollbar: enableScrollbar,
            searchDebounceMs: searchDebounceMs,
            sortBy: sortBy,
            includeIndependent: includeIndependent,
            includeUnMembers: includeUnMembers,
            maxHeight: maxHeight,
            minHeight: minHeight,
            dropdownMaxHeight: dropdownMaxHeight,
            flagSize: flagSize,
            flagShape: flagShape,
            flagShadowColor: flagShadowColor,
            flagShadowBlur: flagShadowBlur,
            flagShadowOffset: flagShadowOffset,
            filterTitleText: filterTitleText,
            filterSortByText: filterSortByText,
            filterRegionsText: filterRegionsText,
            filterAllText: filterAllText,
            filterCancelText: filterCancelText,
            filterApplyText: filterApplyText,
            customCountryBuilder: customCountryBuilder,
            customHeaderBuilder: customHeaderBuilder,
            customSearchBuilder: customSearchBuilder,
            customFilterBuilder: customFilterBuilder,
            hapticFeedback: hapticFeedback,
            animationDuration: animationDuration,
            debounceDuration: debounceDuration,
          );

          return fullScreenPicker;
        },
      ),
    );
    return result;
  }

  /// Create country picker as dropdown widget (for embedding in forms/UI)
  ///
  /// This returns a Widget that can be embedded directly in your UI.
  /// The dropdown shows the selected country and opens a menu below when tapped.
  ///
  /// Example:
  /// ```dart
  /// ModalComprehensivePicker.dropdown(
  ///   initialCountryCode: country.us,
  ///   onCountrySelected: (country) {
  ///     setState(() => selectedCountry = country);
  ///   },
  /// )
  /// ```
  static Widget dropdown({
    CountryCode? initialCountryCode,
    ValueChanged<Country>? onCountrySelected,
    ValueChanged<Country>? onCountryChanged,
    CountryPickerTheme? theme,
    config.CountryPickerConfig? config,
    bool showCloseButton = true,
    bool showPhoneCode = true,
    bool showFlag = true,
    bool showCountryName = true,
    bool hapticFeedback = true,
    Size flagSize = const Size(32, 24),
    FlagShape flagShape = FlagShape.rectangular,
  }) {
    return ComprehensiveCountryPicker(
      initialCountryCode: initialCountryCode,
      onCountrySelected: onCountrySelected,
      onCountryChanged: onCountryChanged,
      theme: theme,
      config: config,
      pickerType: CountryPickerType.dropdown,
      showCloseButton: showCloseButton,
      showPhoneCode: showPhoneCode,
      showFlag: showFlag,
      showCountryName: showCountryName,
      flagSize: flagSize,
      flagShape: flagShape,
      searchEnabled: false,
      filterEnabled: false,
      hapticFeedback: hapticFeedback,
    );
  }

  /// Show country picker inline
  static Widget showInline({
    CountryCode? initialCountryCode,
    ValueChanged<Country>? onCountrySelected,
    ValueChanged<Country>? onCountryChanged,
    ValueChanged<String>? onSearchChanged,
    ValueChanged<CountryFilter>? onFilterChanged,
    CountryPickerTheme? theme,
    config.CountryPickerConfig? config,
    bool showCloseButton = true,
    bool showPhoneCode = true,
    bool showFlag = true,
    bool showCountryName = true,
    bool showCapital = false,
    bool showRegion = false,
    bool showPopulation = false,
    bool searchEnabled = true,
    bool filterEnabled = false,
    bool enableScrollbar = true,
    int searchDebounceMs = 300,
    CountrySortBy sortBy = CountrySortBy.name,
    bool includeIndependent = true,
    bool includeUnMembers = true,
    double? maxHeight,
    double minHeight = 200.0,
    double? dropdownMaxHeight,
    Size flagSize = const Size(32, 24),
    FlagShape flagShape = FlagShape.rectangular,
    Color? flagShadowColor,
    double flagShadowBlur = 2.0,
    Offset flagShadowOffset = const Offset(0, 1),
    String filterTitleText = 'Filter Countries',
    String filterSortByText = 'Sort by:',
    String filterRegionsText = 'Regions:',
    String filterAllText = 'All',
    String filterCancelText = 'Cancel',
    String filterApplyText = 'Apply',
    Widget Function(BuildContext context, Country country, bool isSelected)? customCountryBuilder,
    Widget Function(BuildContext context)? customHeaderBuilder,
    Widget Function(
            BuildContext context, TextEditingController controller, ValueChanged<String> onChanged)?
        customSearchBuilder,
    Widget Function(
            BuildContext context, CountryFilter filter, ValueChanged<CountryFilter> onChanged)?
        customFilterBuilder,
    bool hapticFeedback = true,
    Duration animationDuration = const Duration(milliseconds: 300),
    Duration debounceDuration = const Duration(milliseconds: 300),
  }) {
    return ComprehensiveCountryPicker(
      initialCountryCode: initialCountryCode,
      onCountrySelected: onCountrySelected,
      onCountryChanged: onCountryChanged,
      onSearchChanged: onSearchChanged,
      onFilterChanged: onFilterChanged,
      theme: theme,
      config: config,
      pickerType: CountryPickerType.inline,
      showCloseButton: showCloseButton,
      showPhoneCode: showPhoneCode,
      showFlag: showFlag,
      showCountryName: showCountryName,
      showCapital: showCapital,
      showRegion: showRegion,
      showPopulation: showPopulation,
      searchEnabled: searchEnabled,
      filterEnabled: filterEnabled,
      enableScrollbar: enableScrollbar,
      searchDebounceMs: searchDebounceMs,
      sortBy: sortBy,
      includeIndependent: includeIndependent,
      includeUnMembers: includeUnMembers,
      maxHeight: maxHeight,
      minHeight: minHeight,
      dropdownMaxHeight: dropdownMaxHeight,
      flagSize: flagSize,
      flagShape: flagShape,
      flagShadowColor: flagShadowColor,
      flagShadowBlur: flagShadowBlur,
      flagShadowOffset: flagShadowOffset,
      filterTitleText: filterTitleText,
      filterSortByText: filterSortByText,
      filterRegionsText: filterRegionsText,
      filterAllText: filterAllText,
      filterCancelText: filterCancelText,
      filterApplyText: filterApplyText,
      customCountryBuilder: customCountryBuilder,
      customHeaderBuilder: customHeaderBuilder,
      customSearchBuilder: customSearchBuilder,
      customFilterBuilder: customFilterBuilder,
      hapticFeedback: hapticFeedback,
      animationDuration: animationDuration,
      debounceDuration: debounceDuration,
    );
  }
}
