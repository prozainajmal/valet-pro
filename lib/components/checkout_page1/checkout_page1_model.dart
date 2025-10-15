import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'checkout_page1_widget.dart' show CheckoutPage1Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutPage1Model extends FlutterFlowModel<CheckoutPage1Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for serviceName widget.
  FocusNode? serviceNameFocusNode;
  TextEditingController? serviceNameTextController;
  String? Function(BuildContext, String?)? serviceNameTextControllerValidator;
  // State field(s) for servicePrize widget.
  FocusNode? servicePrizeFocusNode;
  TextEditingController? servicePrizeTextController;
  String? Function(BuildContext, String?)? servicePrizeTextControllerValidator;
  // State field(s) for serviceDescription widget.
  FocusNode? serviceDescriptionFocusNode;
  TextEditingController? serviceDescriptionTextController;
  String? Function(BuildContext, String?)?
      serviceDescriptionTextControllerValidator;
  // State field(s) for serviceSwitch widget.
  bool? serviceSwitchValue;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    serviceNameFocusNode?.dispose();
    serviceNameTextController?.dispose();

    servicePrizeFocusNode?.dispose();
    servicePrizeTextController?.dispose();

    serviceDescriptionFocusNode?.dispose();
    serviceDescriptionTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }
}
