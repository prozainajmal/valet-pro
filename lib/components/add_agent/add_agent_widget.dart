import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/checkout_preview/checkout_preview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_agent_model.dart';
export 'add_agent_model.dart';

class AddAgentWidget extends StatefulWidget {
  const AddAgentWidget({super.key});

  @override
  State<AddAgentWidget> createState() => _AddAgentWidgetState();
}

class _AddAgentWidgetState extends State<AddAgentWidget>
    with TickerProviderStateMixin {
  late AddAgentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAgentModel());

    _model.agentNameTextController ??= TextEditingController();
    _model.agentNameFocusNode ??= FocusNode();

    _model.agentPhoneNumberTextController ??= TextEditingController();
    _model.agentPhoneNumberFocusNode ??= FocusNode();

    _model.agentEmailAddressTextController ??= TextEditingController();
    _model.agentEmailAddressFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.9, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.9, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.0,
          sigmaY: 6.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x4D000000),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 530.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x19000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (Theme.of(context).brightness ==
                                  Brightness.light)
                                Image.asset(
                                  'assets/images/logo_newforceLight@3x.png',
                                  width: 130.0,
                                  height: 40.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () => context.safePop(),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation1']!),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 100.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (Theme.of(context).brightness ==
                                        Brightness.light)
                                      Image.asset(
                                        'assets/images/logo_newforceLight_alt@3x.png',
                                        width: 170.0,
                                        height: 60.0,
                                        fit: BoxFit.fitWidth,
                                      ),
                                  ],
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation2']!),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'h2b0403v' /* Add New Valet Agent */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displaySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .displaySmallIsCustom,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation1']!),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8jmut6ns' /* Use the form below to get star... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodySmallIsCustom,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation2']!),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.agentNameTextController,
                                          focusNode: _model.agentNameFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'v6gg362d' /* Full Name */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallIsCustom,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'p5e93qvh' /* Enter your full name */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallIsCustom,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 0.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                          validator: _model
                                              .agentNameTextControllerValidator
                                              .asValidator(context),
                                        ).animateOnPageLoad(animationsMap[
                                            'textFieldOnPageLoadAnimation1']!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model
                                            .agentPhoneNumberTextController,
                                        focusNode:
                                            _model.agentPhoneNumberFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'ykijcc6e' /* Mobile Number */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'wfjxch16' /* Enter your mobile number */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        validator: _model
                                            .agentPhoneNumberTextControllerValidator
                                            .asValidator(context),
                                      ).animateOnPageLoad(animationsMap[
                                          'textFieldOnPageLoadAnimation2']!),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model
                                            .agentEmailAddressTextController,
                                        focusNode:
                                            _model.agentEmailAddressFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            '18kuldks' /* Email Address */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '6c9z76b1' /* Enter your email here... */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmallIsCustom,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 0.0, 24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        validator: _model
                                            .agentEmailAddressTextControllerValidator
                                            .asValidator(context),
                                      ).animateOnPageLoad(animationsMap[
                                          'textFieldOnPageLoadAnimation3']!),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        // Validate form fields
                                        if (_model.agentNameTextController.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Please enter the agent\'s full name'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }
                                        
                                        if (_model.agentPhoneNumberTextController.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Please enter the agent\'s mobile number'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }
                                        
                                        if (_model.agentEmailAddressTextController.text.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Please enter the agent\'s email address'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }
                                        
                                        // Show loading indicator
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                        
                                        try {
                                          // Generate unique agent ID
                                          final agentId = DateTime.now().millisecondsSinceEpoch.toString();
                                          
                                          // Create QR code data (agent profile URL)
                                          final qrData = 'https://valetpro.app/agent/$agentId';
                                          
                                          // Create agent document
                                          final agentDoc = ValetAgentsRecord.collection.doc();
                                          await agentDoc.set({
                                            ...createValetAgentsRecordData(
                                              name: _model
                                                  .agentNameTextController.text,
                                              phoneNumber: _model
                                                  .agentPhoneNumberTextController
                                                  .text,
                                              email: _model
                                                  .agentEmailAddressTextController
                                                  .text,
                                              assignedCompany:
                                                  currentUserDocument?.companyId,
                                              status: 'active',
                                              qrCodeUrl: qrData,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'created_time':
                                                    FieldValue.serverTimestamp(),
                                              },
                                            ),
                                          });
                                          
                                          // Close loading dialog
                                          Navigator.of(context).pop();
                                          
                                          // Show success dialog with QR code
                                          await showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Agent Added Successfully!',
                                                                style: FlutterFlowTheme.of(context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                      letterSpacing: 0.0,
                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                            IconButton(
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(dialogContext).pop();
                                                                context.safePop();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 24.0),
                                                        // Agent Info Card
                                                      Container(
                                                        padding: EdgeInsets.all(16.0),
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(Icons.person, size: 16.0, color: FlutterFlowTheme.of(context).secondaryText),
                                                                SizedBox(width: 8.0),
                                                                Text(
                                                                  _model.agentNameTextController.text,
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                    letterSpacing: 0.0,
                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 8.0),
                                                            Row(
                                                              children: [
                                                                Icon(Icons.email, size: 16.0, color: FlutterFlowTheme.of(context).secondaryText),
                                                                SizedBox(width: 8.0),
                                                                Text(
                                                                  _model.agentEmailAddressTextController.text,
                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                    letterSpacing: 0.0,
                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 8.0),
                                                            Row(
                                                              children: [
                                                                Icon(Icons.phone, size: 16.0, color: FlutterFlowTheme.of(context).secondaryText),
                                                                SizedBox(width: 8.0),
                                                                Text(
                                                                  _model.agentPhoneNumberTextController.text,
                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                    letterSpacing: 0.0,
                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 24.0),
                                                      // QR Code
                                                      Container(
                                                        padding: EdgeInsets.all(16.0),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).lineColor,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              'Agent QR Code',
                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                letterSpacing: 0.0,
                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                              ),
                                                            ),
                                                            SizedBox(height: 16.0),
                                                            QrImageView(
                                                              data: qrData,
                                                              version: QrVersions.auto,
                                                              size: 200.0,
                                                              backgroundColor: Colors.white,
                                                            ),
                                                            SizedBox(height: 16.0),
                                                            Text(
                                                              'Scan this QR code to view agent profile',
                                                              textAlign: TextAlign.center,
                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                letterSpacing: 0.0,
                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 24.0),
                                                      // Action Buttons
                                                      Column(
                                                        children: [
                                                          // Payment Button (Full Width)
                                                          FFButtonWidget(
                                                            onPressed: () async {
                                                              // Close QR dialog first
                                                              Navigator.of(dialogContext).pop();
                                                              
                                                              // Open checkout preview with agent data
                                                              await showDialog(
                                                                context: context,
                                                                builder: (checkoutContext) {
                                                                  return Dialog(
                                                                    elevation: 0,
                                                                    insetPadding: EdgeInsets.zero,
                                                                    backgroundColor: Colors.transparent,
                                                                    alignment: AlignmentDirectional(0.0, 0.0)
                                                                        .resolve(Directionality.of(context)),
                                                                    child: GestureDetector(
                                                                      onTap: () {
                                                                        FocusScope.of(checkoutContext).unfocus();
                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                      },
                                                                      child: CheckoutPreviewWidget(
                                                                        agentName: _model.agentNameTextController.text,
                                                                        agentEmail: _model.agentEmailAddressTextController.text,
                                                                        agentPhone: _model.agentPhoneNumberTextController.text,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              
                                                              // Close the add agent form after payment dialog closes
                                                              context.safePop();
                                                            },
                                                            text: 'Make Payment',
                                                            icon: Icon(
                                                              Icons.payment,
                                                              size: 20.0,
                                                            ),
                                                            options: FFButtonOptions(
                                                              width: double.infinity,
                                                              height: 48.0,
                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                              color: Color(0xFF4CAF50),
                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                color: Colors.white,
                                                                letterSpacing: 0.0,
                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                              ),
                                                              elevation: 3.0,
                                                              borderSide: BorderSide(
                                                                color: Colors.transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius: BorderRadius.circular(8.0),
                                                            ),
                                                          ),
                                                          SizedBox(height: 12.0),
                                                          // Copy Link & Share Buttons
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Expanded(
                                                                child: FFButtonWidget(
                                                                  onPressed: () async {
                                                                    // Copy QR code link to clipboard
                                                                    await Clipboard.setData(
                                                                      ClipboardData(text: qrData),
                                                                    );
                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                      SnackBar(
                                                                        content: Text('QR Code link copied to clipboard!'),
                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                        duration: Duration(seconds: 2),
                                                                      ),
                                                                    );
                                                                  },
                                                                  text: 'Copy Link',
                                                                  icon: Icon(
                                                                    Icons.copy,
                                                                    size: 16.0,
                                                                  ),
                                                                  options: FFButtonOptions(
                                                                    height: 44.0,
                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                      letterSpacing: 0.0,
                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                    ),
                                                                    elevation: 0.0,
                                                                    borderSide: BorderSide(
                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                      width: 1.0,
                                                                    ),
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 12.0),
                                                              Expanded(
                                                                child: FFButtonWidget(
                                                                  onPressed: () async {
                                                                    // Share QR code link
                                                                    await launchUrl(
                                                                      Uri.parse(
                                                                        'mailto:?subject=QR Code for ${_model.agentNameTextController.text}&body=Hi,%0A%0AHere is the QR code link for ${_model.agentNameTextController.text}:%0A%0A$qrData%0A%0AAgent Details:%0AName: ${_model.agentNameTextController.text}%0AEmail: ${_model.agentEmailAddressTextController.text}%0APhone: ${_model.agentPhoneNumberTextController.text}',
                                                                      ),
                                                                    );
                                                                  },
                                                                  text: 'Share',
                                                                  icon: Icon(
                                                                    Icons.share,
                                                                    size: 16.0,
                                                                  ),
                                                                  options: FFButtonOptions(
                                                                    height: 44.0,
                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                      color: Colors.white,
                                                                      letterSpacing: 0.0,
                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                    ),
                                                                    elevation: 2.0,
                                                                    borderSide: BorderSide(
                                                                      color: Colors.transparent,
                                                                      width: 1.0,
                                                                    ),
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                        } catch (e) {
                                          // Close loading dialog
                                          Navigator.of(context).pop();
                                          
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error adding agent: ${e.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              duration: Duration(milliseconds: 4000),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '4f9zttlb' /* Add Valet Agent */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 190.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'buttonOnPageLoadAnimation']!),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
