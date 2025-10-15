import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/checkout_preview/checkout_preview_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import 'checkout_management_widget.dart' show CheckoutManagementWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutManagementModel
    extends FlutterFlowModel<CheckoutManagementWidget> {
  ///  Local state fields for this page.

  String? svcName;

  double? svcPrice;

  String? svcDesc;

  bool svcActive = true;

  List<String> svcType = ['extra', 'upsell'];
  void addToSvcType(String item) => svcType.add(item);
  void removeFromSvcType(String item) => svcType.remove(item);
  void removeAtIndexFromSvcType(int index) => svcType.removeAt(index);
  void insertAtIndexInSvcType(int index, String item) =>
      svcType.insert(index, item);
  void updateSvcTypeAtIndex(int index, Function(String) updateFn) =>
      svcType[index] = updateFn(svcType[index]);

  DocumentReference? companyRef;

  DocumentReference? currentBannerRef;

  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
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
  bool isDataUploading_uploadDataOd9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataOd9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataOd9 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
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
