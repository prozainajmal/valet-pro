import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'add_company_widget.dart' show AddCompanyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCompanyModel extends FlutterFlowModel<AddCompanyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for agentName widget.
  FocusNode? agentNameFocusNode;
  TextEditingController? agentNameTextController;
  String? Function(BuildContext, String?)? agentNameTextControllerValidator;
  // State field(s) for agentPhoneNumber widget.
  FocusNode? agentPhoneNumberFocusNode;
  TextEditingController? agentPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      agentPhoneNumberTextControllerValidator;
  // State field(s) for agentEmailAddress widget.
  FocusNode? agentEmailAddressFocusNode;
  TextEditingController? agentEmailAddressTextController;
  String? Function(BuildContext, String?)?
      agentEmailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    agentNameFocusNode?.dispose();
    agentNameTextController?.dispose();

    agentPhoneNumberFocusNode?.dispose();
    agentPhoneNumberTextController?.dispose();

    agentEmailAddressFocusNode?.dispose();
    agentEmailAddressTextController?.dispose();
  }
}
