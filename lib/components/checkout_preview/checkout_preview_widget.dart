import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkout_preview_model.dart';
export 'checkout_preview_model.dart';

/// Component “CheckoutPreviewCard” matching my theme: rounded 16 card, soft
/// shadow, 16 padding, vertical scroll.
///
/// Sections: title + [Business Name]; First Name, Phone (mask); 3-image
/// banner carousel; Tip for Valet (radio 2 JD or Custom → show number field);
/// Extra Services (checkbox list from prop `services`); Total Amount row;
/// full-width primary “Continue to Payment”; brand footer with car icon +
/// text.
///
/// Props: businessName:String, baseAmount:Number=2,
/// services:[{name,price,desc,active}], tipFixedValue:Number=2,
/// brandText:String="Valet Pro", brandIcon:Icon. Local state:
/// tipMode("fixed"|"custom"), customTip:Number, selectedExtras:[],
/// totalAmount:Number. Total = baseAmount + (fixed?tipFixedValue:customTip) +
/// sum(selectedExtras.price). Outputs: out_totalAmount, out_selectedExtras,
/// out_tipValue. Use my theme tokens for colors/typography.
class CheckoutPreviewWidget extends StatefulWidget {
  const CheckoutPreviewWidget({
    super.key,
    this.bannerUrl,
    this.jdpriceadd,
  });

  final String? bannerUrl;
  final List<int>? jdpriceadd;

  @override
  State<CheckoutPreviewWidget> createState() => _CheckoutPreviewWidgetState();
}

class _CheckoutPreviewWidgetState extends State<CheckoutPreviewWidget> {
  late CheckoutPreviewModel _model;
  
  // Add state variables for services selection and total calculation
  List<String> selectedServices = [];
  double totalAmount = 0.0;
  double baseAmount = 2.5; // Base tip amount
  double customTipAmount = 0.0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutPreviewModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    
    // Initialize total amount with base tip
    totalAmount = baseAmount;

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }
  
  // Method to calculate total amount
  void calculateTotal() {
    double tipAmount = 0.0;
    
    // Calculate tip amount based on radio button selection
    if (_model.radioButtonValue == '2.5 JD') {
      tipAmount = baseAmount;
    } else if (_model.radioButtonValue == 'Custom Amount') {
      // Parse custom tip amount from text field
      String customTipText = _model.textController4.text;
      if (customTipText.isNotEmpty) {
        double customAmount = double.tryParse(customTipText) ?? 0.0;
        
        // Validate custom tip amount
        if (customAmount <= 2.5) {
          // Show error toast
          showSnackbar(
            context,
            'Custom tip must be greater than 2.5 JD',
          );
          return; // Don't update total if validation fails
        }
        
        tipAmount = customAmount;
      }
    }
    
    // Update total amount (services total will be calculated when services are selected)
    totalAmount = tipAmount;
  }
  
  // Method to add service to total
  void addServiceToTotal(double servicePrice) {
    setState(() {
      totalAmount += servicePrice;
    });
  }
  
  // Method to remove service from total
  void removeServiceFromTotal(double servicePrice) {
    setState(() {
      totalAmount -= servicePrice;
    });
  }
  
  // Method to toggle service selection
  void toggleService(String serviceId, double servicePrice) {
    setState(() {
      if (selectedServices.contains(serviceId)) {
        selectedServices.remove(serviceId);
        removeServiceFromTotal(servicePrice);
      } else {
        selectedServices.add(serviceId);
        addServiceToTotal(servicePrice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: 340.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'qycww73z' /* [Checkout Message] */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'n6s5jqjj' /* Customer Information */,
                            ),
                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).labelLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelLargeIsCustom,
                                ),
                          ),
                          Text(
                            ' *',
                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).labelLargeFamily,
                                  color: Colors.red,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelLargeIsCustom,
                                ),
                          ),
                          // Expanded(
                          //   child: Text(
                          //     ' (All fields required)',
                          //     style: FlutterFlowTheme.of(context).labelSmall.override(
                          //           fontFamily:
                          //               FlutterFlowTheme.of(context).labelSmallFamily,
                          //           color: Colors.red,
                          //           letterSpacing: 0.0,
                          //           useGoogleFonts: !FlutterFlowTheme.of(context)
                          //               .labelSmallIsCustom,
                          //         ),
                          //   ),
                          // ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'slteslge' /* Enter your name */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyLargeIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            keyboardType: TextInputType.number,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                          TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '2t74m7gn' /* Enter your phone number */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyLargeIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            keyboardType: TextInputType.number,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                          TextFormField(
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode3,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'ity23ayh' /* Enter your email address */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyLargeIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            keyboardType: TextInputType.number,
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'jewqs6u7' /* Flash offer */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .labelLargeIsCustom,
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: StreamBuilder<List<UserBannerRecord>>(
                          stream: queryUserBannerRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserBannerRecord>
                                listViewUserBannerRecordList = snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 0.0),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewUserBannerRecordList.length,
                              separatorBuilder: (_, __) => SizedBox(width: 0.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewUserBannerRecord =
                                    listViewUserBannerRecordList[listViewIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    listViewUserBannerRecord.image,
                                    width: 315.0,
                                    height: 104.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: 315.0,
                                      height: 104.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '9axlqw9j' /* Tip for Valet */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .labelLargeIsCustom,
                            ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowRadioButton(
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'ozby6qe3' /* 2.5 JD */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    't1bo07c0' /* Custom Amount */,
                                  )
                                ].toList(),
                                onChanged: (val) => safeSetState(() {
                                  calculateTotal();
                                }),
                                controller:
                                    _model.radioButtonValueController ??=
                                        FormFieldController<String>(
                                            FFLocalizations.of(context).getText(
                                  '2gnir2lc' /* 2.5 JD */,
                                )),
                                optionHeight: 32.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelMediumIsCustom,
                                    ),
                                selectedTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.vertical,
                                radioButtonColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveRadioButtonColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          TextFormField(
                            controller: _model.textController4,
                            focusNode: _model.textFieldFocusNode4,
                            autofocus: false,
                            enabled: _model.radioButtonValue == 'Custom Amount',
                            obscureText: false,
                            onChanged: (value) => calculateTotal(),
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'a57lcew6' /* Enter custom tip amount */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyLargeIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (_model.radioButtonValue == 'Custom Amount') {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a custom tip amount';
                                }
                                double customAmount = double.tryParse(value) ?? 0.0;
                                if (customAmount <= 2.5) {
                                  return 'Custom tip must be greater than 2.5 JD';
                                }
                              }
                              return null;
                            },
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'xity3slr' /* Extra Services */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .labelLargeIsCustom,
                            ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<List<ServicecolRecord>>(
                            stream: queryServicecolRecord(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<ServicecolRecord>
                                  listViewServicecolRecordList = snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewServicecolRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewServicecolRecord =
                                      listViewServicecolRecordList[
                                          listViewIndex];
                                  return InkWell(
                                    onTap: () => toggleService(listViewServicecolRecord.reference.id, listViewServicecolRecord.jd.toDouble()),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 20.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color: selectedServices.contains(listViewServicecolRecord.reference.id)
                                                  ? FlutterFlowTheme.of(context).primary
                                                  : FlutterFlowTheme.of(context).secondaryText,
                                              width: 2.0,
                                            ),
                                            color: selectedServices.contains(listViewServicecolRecord.reference.id)
                                                ? FlutterFlowTheme.of(context).primary
                                                : Colors.transparent,
                                          ),
                                          child: selectedServices.contains(listViewServicecolRecord.reference.id)
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 12.0,
                                                )
                                              : null,
                                        ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewServicecolRecord
                                                  .servicename,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            Text(
                                              listViewServicecolRecord
                                                  .serviceDesc,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmallIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        listViewServicecolRecord.jd.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '4dlayj23' /* Total Amount */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                      ),
                      Text(
                        '${totalAmount.toStringAsFixed(1)} JD',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      // Validate customer information
                      if (_model.textController1?.text.isEmpty ?? true) {
                        showSnackbar(
                          context,
                          'Please enter your name',
                        );
                        return; // Stop payment process
                      }
                      
                      if (_model.textController2?.text.isEmpty ?? true) {
                        showSnackbar(
                          context,
                          'Please enter your phone number',
                        );
                        return; // Stop payment process
                      }
                      
                      if (_model.textController3?.text.isEmpty ?? true) {
                        showSnackbar(
                          context,
                          'Please enter your email address',
                        );
                        return; // Stop payment process
                      }
                      
                      
                      // Validate custom tip before proceeding to payment
                      if (_model.radioButtonValue == 'Custom Amount') {
                        String customTipText = _model.textController4.text;
                        if (customTipText.isNotEmpty) {
                          double customAmount = double.tryParse(customTipText) ?? 0.0;
                          if (customAmount <= 2.5) {
                            showSnackbar(
                              context,
                              'Custom tip must be greater than 2.5 JD',
                            );
                            return; // Stop payment process
                          }
                        } else {
                          showSnackbar(
                            context,
                            'Please enter a custom tip amount',
                          );
                          return; // Stop payment process
                        }
                      }
                      
                      final paymentResponse = await processStripePayment(
                        context,
                        amount: (totalAmount * 100).toInt(), // Convert JD to cents
                        currency: 'USD',
                        customerEmail: currentUserEmail,
                        customerName: currentUserDisplayName,
                        description: 'This is service payment',
                        allowGooglePay: true,
                        allowApplePay: false,
                        buttonColor: FlutterFlowTheme.of(context).primary,
                        buttonTextColor: FlutterFlowTheme.of(context).secondary,
                      );
                      if (paymentResponse.paymentId == null &&
                          paymentResponse.errorMessage != null) {
                        showSnackbar(
                          context,
                          'Error: ${paymentResponse.errorMessage}',
                        );
                      }
                      _model.paymentId = paymentResponse.paymentId ?? '';

                      safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '9i343iv5' /* Continue to Payment */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '1fj50twh' /* Valet Pro */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .labelMediumFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .labelMediumIsCustom,
                            ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
