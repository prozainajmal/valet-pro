import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'transactions_widget.dart' show TransactionsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionsModel extends FlutterFlowModel<TransactionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  
  // Search functionality
  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}

