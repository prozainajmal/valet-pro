import '../../components/checkout_preview/checkout_preview_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_agent/add_agent_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'valet_agents_model.dart';
export 'valet_agents_model.dart';

class ValetAgentsWidget extends StatefulWidget {
  const ValetAgentsWidget({super.key});

  static String routeName = 'ValetAgents';
  static String routePath = 'ValetAgents';

  @override
  State<ValetAgentsWidget> createState() => _ValetAgentsWidgetState();
}

class _ValetAgentsWidgetState extends State<ValetAgentsWidget>
    with TickerProviderStateMixin {
  late ValetAgentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValetAgentsModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    animationsMap.addAll({
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
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 1.0),
            end: Offset(1.0, 1.0),
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
            begin: Offset(0.0, 10.0),
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: !isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  FFLocalizations.of(context).getText(
                    'ym579y79' /* Dashboard */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displaySmallFamily,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                      ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    wrapWithModel(
                      model: _model.webNavModel,
                      updateCallback: () => safeSetState(() {}),
                      child: WebNavWidget(
                        iconOne: Icon(
                          Icons.dashboard_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        iconTwo: Icon(
                          Icons.group,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        iconThree: Icon(
                          Icons.home_work_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        iconFour: Icon(
                          Icons.account_circle,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        colorBgOne:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        colorBgTwo:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        colorBgThree:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        colorBgFour:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        textOne: FlutterFlowTheme.of(context).secondaryText,
                        textTwo: FlutterFlowTheme.of(context).secondaryText,
                        textThree: FlutterFlowTheme.of(context).secondaryText,
                        textFour: FlutterFlowTheme.of(context).secondaryText,
                        iconFive: Icon(
                          Icons.reduce_capacity,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        colorBgFive:
                            FlutterFlowTheme.of(context).primaryBackground,
                        textFive: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  Expanded(
                    flex: 10,
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Container(
                              width: double.infinity,
                              height: 34.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 1.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '8jlklje5' /* Valet Agents */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .displaySmallIsCustom,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation1']!),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: AddAgentWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'd1deaf9v' /* Add Agent */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  22.0, 0.0, 22.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
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
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 16.0, 8.0),
                                        child: TextFormField(
                                          controller:
                                              _model.emailAddressTextController,
                                          focusNode:
                                              _model.emailAddressFocusNode,
                                          obscureText: false,
                                          onChanged: (value) {
                                            _model.searchQuery = value;
                                            safeSetState(() {});
                                          },
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '9iuss6gl' /* Search for your customers... */,
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
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.lexendDeca(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
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
                                                    24.0, 12.0, 20.0, 12.0),
                                            prefixIcon: Icon(
                                              Icons.search_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            suffixIcon: _model.searchQuery.isNotEmpty
                                                ? IconButton(
                                                    icon: Icon(
                                                      Icons.clear,
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                    ),
                                                    onPressed: () {
                                                      _model.emailAddressTextController?.clear();
                                                      _model.searchQuery = '';
                                                      safeSetState(() {});
                                                    },
                                                  )
                                                : null,
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
                                              .emailAddressTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 24.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.search_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x1F000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    StreamBuilder<List<ValetAgentsRecord>>(
                                      stream: queryValetAgentsRecord(
                                        queryBuilder: (valetAgentsRecord) =>
                                            valetAgentsRecord
                                                .where(
                                                  'assigned_company',
                                                  isEqualTo:
                                                      currentUserDocument
                                                          ?.companyId,
                                                )
                                                .where(
                                                  'status',
                                                  isEqualTo: 'active',
                                                ),
                                        limit: 1,
                                      ),
                                      builder: (context, headerSnapshot) {
                                        // Only show headers if there are agents
                                        if (!headerSnapshot.hasData || headerSnapshot.data!.isEmpty) {
                                          return SizedBox.shrink();
                                        }
                                        
                                        // Also hide headers if searching and no results
                                        if (_model.searchQuery.isNotEmpty && headerSnapshot.data!.isNotEmpty) {
                                          // Check if any agents match the search
                                          final hasSearchResults = headerSnapshot.data!.any((agent) {
                                            final query = _model.searchQuery.toLowerCase();
                                            return agent.name.toLowerCase().contains(query) ||
                                                   agent.email.toLowerCase().contains(query) ||
                                                   agent.phoneNumber.toLowerCase().contains(query);
                                          });
                                          if (!hasSearchResults) {
                                            return SizedBox.shrink();
                                          }
                                        }
                                        
                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              12.0, 12.0, 12.0, 0.0),
                                          child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5mtplc2u' /* Member Name */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                            ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xsqhz5g4' /* Email */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                          ))
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xkijgi68' /* Last Active */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dtsi2m5j' /* Date Created */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gip25udk' /* Link */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '30pvspoq' /* Phone Number */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmallIsCustom,
                                                        ),
                                              ),
                                            ),
                                          Expanded(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qriboqj2' /* Status */,
                                              ),
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => StreamBuilder<
                                            List<ValetAgentsRecord>>(
                                          stream: queryValetAgentsRecord(
                                            queryBuilder: (valetAgentsRecord) =>
                                                valetAgentsRecord
                                                    .where(
                                                      'assigned_company',
                                                      isEqualTo:
                                                          currentUserDocument
                                                              ?.companyId,
                                                    )
                                                    .where(
                                                      'status',
                                                      isEqualTo: 'active',
                                                    )
                                                    .orderBy('created_time', descending: true),
                                            limit: 50,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ValetAgentsRecord>
                                                listViewValetAgentsRecordList =
                                                snapshot.data!;

                                            // Apply search filter
                                            List<ValetAgentsRecord> filteredList = listViewValetAgentsRecordList;
                                            if (_model.searchQuery.isNotEmpty) {
                                              filteredList = listViewValetAgentsRecordList.where((agent) {
                                                final query = _model.searchQuery.toLowerCase();
                                                return agent.name.toLowerCase().contains(query) ||
                                                       agent.email.toLowerCase().contains(query) ||
                                                       agent.phoneNumber.toLowerCase().contains(query);
                                              }).toList();
                                            }

                                            // Check if filtered list is empty
                                            if (filteredList.isEmpty) {
                                              // Show different messages for no agents vs no search results
                                              final isSearching = _model.searchQuery.isNotEmpty;
                                              final hasAgents = listViewValetAgentsRecordList.isNotEmpty;
                                              
                                              return Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(40.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      isSearching ? Icons.search_off : Icons.people_outline,
                                                      size: 80.0,
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                    ),
                                                    SizedBox(height: 16.0),
                                                    Text(
                                                      isSearching ? 'No Results Found' : 'No Agents Yet',
                                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                        fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      isSearching 
                                                          ? 'Try adjusting your search terms or clear the search to see all agents.'
                                                          : 'Start by adding your first valet agent using the "Add Agent" button above.',
                                                      textAlign: TextAlign.center,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: filteredList.length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewValetAgentsRecord =
                                                    filteredList[listViewIndex];
                                                return Dismissible(
                                                  key: Key(listViewValetAgentsRecord.reference.id),
                                                  direction: DismissDirection.endToStart,
                                                  confirmDismiss: (direction) async {
                                                    // Show confirmation dialog
                                                    return await showDialog<bool>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: Text('Delete Agent'),
                                                          content: Text('Are you sure you want to delete ${listViewValetAgentsRecord.name}? This action cannot be undone.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.of(context).pop(false),
                                                              child: Text('Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () => Navigator.of(context).pop(true),
                                                              style: TextButton.styleFrom(
                                                                foregroundColor: Colors.red,
                                                              ),
                                                              child: Text('Delete'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  onDismissed: (direction) async {
                                                    // Update agent status to inactive instead of deleting
                                                    await listViewValetAgentsRecord.reference.update({
                                                      'status': 'inactive',
                                                      'is_active': false,
                                                    });
                                                    
                                                    // Show success message
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('Agent ${listViewValetAgentsRecord.name} has been removed'),
                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                      ),
                                                    );
                                                  },
                                                  background: Container(
                                                    alignment: Alignment.centerRight,
                                                    padding: EdgeInsets.only(right: 20.0),
                                                    color: Colors.red,
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 2.0),
                                                    child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          listViewValetAgentsRecord.profilePhoto.isNotEmpty 
                                                                              ? listViewValetAgentsRecord.profilePhoto
                                                                              : 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      listViewValetAgentsRecord
                                                                          .name
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            32,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      tabletLandscape:
                                                                          false,
                                                                      desktop:
                                                                          false,
                                                                    ))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          listViewValetAgentsRecord.email,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                listViewValetAgentsRecord
                                                                    .email,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "M/d h:mm a",
                                                                  listViewValetAgentsRecord
                                                                      .createdTime!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "M/d h:mm a",
                                                                  listViewValetAgentsRecord
                                                                      .createdTime!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap: listViewValetAgentsRecord.qrCodeUrl.isNotEmpty
                                                                    ? () async {
                                                                        // Show QR code in dialog
                                                                        await showDialog(
                                                                          context: context,
                                                                          builder: (dialogContext) {
                                                                            return Dialog(
                                                                              backgroundColor: Colors.white,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                              ),
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(24.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'QR Code - ${listViewValetAgentsRecord.name}',
                                                                                          style: FlutterFlowTheme.of(context)
                                                                                              .titleLarge
                                                                                              .override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        IconButton(
                                                                                          icon: Icon(Icons.close),
                                                                                          onPressed: () => Navigator.of(dialogContext).pop(),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(height: 24.0),
                                                                                    // QR Code Image
                                                                                    Container(
                                                                                      width: 300.0,
                                                                                      height: 300.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.white,
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).lineColor,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Center(
                                                                                        child: QrImageView(
                                                                                          data: listViewValetAgentsRecord.qrCodeUrl,
                                                                                          version: QrVersions.auto,
                                                                                          size: 250.0,
                                                                                          backgroundColor: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 24.0),
                                                                                    // Agent Info
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
                                                                                                listViewValetAgentsRecord.name,
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
                                                                                                listViewValetAgentsRecord.email,
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
                                                                                                listViewValetAgentsRecord.phoneNumber,
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
                                                                                                      agentName: listViewValetAgentsRecord.name,
                                                                                                      agentEmail: listViewValetAgentsRecord.email,
                                                                                                      agentPhone: listViewValetAgentsRecord.phoneNumber,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
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
                                                                                                    ClipboardData(text: listViewValetAgentsRecord.qrCodeUrl),
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
                                                                                                      'mailto:?subject=QR Code for ${listViewValetAgentsRecord.name}&body=Hi,%0A%0AHere is the QR code link for ${listViewValetAgentsRecord.name}:%0A%0A${listViewValetAgentsRecord.qrCodeUrl}%0A%0AAgent Details:%0AName: ${listViewValetAgentsRecord.name}%0AEmail: ${listViewValetAgentsRecord.email}%0APhone: ${listViewValetAgentsRecord.phoneNumber}',
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
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    : null,
                                                                child: Text(
                                                                  listViewValetAgentsRecord.qrCodeUrl.isNotEmpty
                                                                      ? 'QR Code'
                                                                      : 'No QR',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context)
                                                                                .bodyMediumFamily,
                                                                        color: listViewValetAgentsRecord.qrCodeUrl.isNotEmpty
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        decoration: listViewValetAgentsRecord.qrCodeUrl.isNotEmpty
                                                                            ? TextDecoration.underline
                                                                            : TextDecoration.none,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context)
                                                                                .bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Expanded(
                                                              child: Text(
                                                                listViewValetAgentsRecord
                                                                    .phoneNumber,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  listViewValetAgentsRecord
                                                                      .status,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                        "relative",
                                                                        listViewValetAgentsRecord.createdTime!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
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
                                                );
                                              },
                                            );
                                          },
                                        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
