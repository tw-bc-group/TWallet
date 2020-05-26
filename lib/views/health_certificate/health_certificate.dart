import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/health_certificate/health_certificate_page_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

class HealthCertificatePage extends StatefulWidget {
  final String id;

  HealthCertificatePage({this.id});

  @override
  State<StatefulWidget> createState() {
    return HealthCertificateState(id: id);
  }
}

class HealthCertificateState extends State<HealthCertificatePage> {
  final String id;
  final HealthCertificatePageStore _pageStore = HealthCertificatePageStore();

  TextEditingController _phoneInputController;
  TextEditingController _temperatureInputController;
  ScrollController _scrollController = ScrollController();

  HealthCertificateState({this.id});

  @override
  void initState() {
    super.initState();
    _phoneInputController = TextEditingController();
    _temperatureInputController = TextEditingController();
  }

  Future<void> handleConfirm() async {
    _pageStore.validateAll();
    if (_pageStore.error.hasErrors) {
      _scrollController.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      getIt<HealthCertificationStore>()
          .bindHealthCert(
              getIt<IdentityStore>().getIdentityById(id).did.toString(),
              _pageStore.phone,
              double.parse(_pageStore.temperature),
              _pageStore.contactOption.toString(),
              _pageStore.symptomsOption.toString())
          .then((_) => Application.router.navigateTo(
              context, '${Routes.healthCode}?id=$id&notRefresh=true'));
    }
  }

  Widget _textFiled(ScreenUtil _screenUtil, TextEditingController controller,
      TextInputType inputType, Function onChanged) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: _screenUtil.setWidth(16)),
        margin: EdgeInsets.symmetric(vertical: _screenUtil.setHeight(13)),
        decoration: BoxDecoration(
          border: Border.all(color: WalletColor.grey, width: 1),
        ),
        height: _screenUtil.setHeight(44),
        child: TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: '点击输入',
            hintStyle: WalletFont.font_12(
                textStyle: TextStyle(
                    color: WalletColor.grey, fontWeight: FontWeight.w400)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
          ),
          style: WalletFont.font_14(
              textStyle: TextStyle(
                  color: WalletColor.black, fontWeight: FontWeight.w400)),
          onChanged: onChanged,
        ));
  }

  Widget _formTitle(String title, {bool hasAsterisk = true, String errorText}) {
    TextStyle _titleStyle = WalletFont.font_14(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: WalletColor.black,
            letterSpacing: 0));

    return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Expanded(
        child: RichText(
          text: TextSpan(
            text: title,
            style: _titleStyle,
            children: <TextSpan>[
              TextSpan(
                  text: hasAsterisk ? ' *' : '',
                  style: _titleStyle.merge(TextStyle(color: WalletColor.red))),
            ],
          ),
        ),
      ),
      Text(errorText ?? '',
          style: _titleStyle.merge(TextStyle(color: WalletColor.red)))
    ]);
  }

  Widget _buildRadioGroup(Function onValueChanged) {
    return CustomRadioButton(
      elevation: 0,
      enableShape: true,
      buttonColor: Theme.of(context).canvasColor,
      buttonLables:
          SelectOption.values.map((value) => value.description()).toList(),
      buttonValues: SelectOption.values.toList(),
      radioButtonValue: onValueChanged,
      selectedColor: WalletColor.primary,
      customShape: RoundedRectangleBorder(
        side: BorderSide(color: WalletColor.primary, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  Widget _buildForm(ScreenUtil _screenUtil) {
    return Container(
        decoration: new BoxDecoration(
            color: WalletColor.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: _screenUtil.setWidth(24)),
              child: Text('请输入以下信息',
                  style: WalletFont.font_16(
                      textStyle: TextStyle(fontWeight: FontWeight.w600))),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _screenUtil.setWidth(24)),
                child: Form(
                    child: ListView(controller: _scrollController, children: <
                        Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(36)),
                    child: _formTitle('手机号', errorText: _pageStore.error.phone),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(16)),
                    child: _textFiled(
                        _screenUtil,
                        _phoneInputController,
                        TextInputType.phone,
                        (String value) => _pageStore.updatePhone(value)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(36)),
                    child: _formTitle('今日体温（℃）',
                        errorText: _pageStore.error.temperature),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(16)),
                    child: _textFiled(
                        _screenUtil,
                        _temperatureInputController,
                        TextInputType.numberWithOptions(decimal: true),
                        (String value) => _pageStore.updateTemperature(value)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: _screenUtil.setWidth(26)),
                      child: _formTitle('近14天内您是否接触新冠肺炎确诊患者或疑似患者？',
                          hasAsterisk: false)),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(21)),
                    child: _buildRadioGroup(
                        (value) => _pageStore.contactOption = value),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(36)),
                    child: _formTitle('您是否有发烧、恶心呕吐、头痛、呼吸急促、心慌、胸闷、乏力、肌肉疼痛等症状？',
                        hasAsterisk: false),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(21)),
                    child: _buildRadioGroup(
                        (value) => _pageStore.symptomsOption = value),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: _screenUtil.setWidth(36)),
                      child: Divider(color: WalletColor.grey)),
                  Padding(
                    padding: EdgeInsets.only(top: _screenUtil.setWidth(24)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: WalletColor.lightGrey,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: _screenUtil.setHeight(20)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: _formTitle('本人郑重承诺',
                                      errorText: _pageStore.error.commitment),
                                  value: _pageStore.hasCommitment,
                                  onChanged: (bool value) {
                                    _pageStore.updateCommitment(value);
                                  },
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: _screenUtil.setWidth(20)),
                                    child: Text(
                                        '上述信息是我本人填写，本人对内容真实性和完整性负责，因信息填报不实导致相关后果的，本人愿意承担相应责任。',
                                        style: WalletFont.font_12(
                                            textStyle: TextStyle(
                                                color: WalletColor.grey,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0))))
                              ]),
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _screenUtil.setWidth(20),
                          vertical: _screenUtil.setHeight(24)),
                      child: WalletTheme.button(
                          text: '确定',
                          onPressed: (_pageStore.hasEmpty ||
                                  _pageStore.error.hasErrors)
                              ? null
                              : handleConfirm)),
                ])),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Observer(
        builder: (_) => NewCommonLayout(
            title: '健康认证',
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/security.svg',
                  width: _screenUtil.setWidth(60),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _screenUtil.setWidth(24),
                      vertical: _screenUtil.setHeight(24)),
                  child: Text('本服务基于手机运营商提供的行程数据以及个人健康信息的填报，为公众提供本人防疫健康信息查询服务。',
                      textAlign: TextAlign.center,
                      style: WalletFont.font_14(
                          textStyle: TextStyle(
                              color: WalletColor.white,
                              fontWeight: FontWeight.w400))),
                ),
                Expanded(child: _buildForm(_screenUtil)),
              ],
            )));
  }
}
