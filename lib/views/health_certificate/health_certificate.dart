import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/health_certification_store.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/views/health_certificate/health_certificate_page_store.dart';

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

  HealthCertificateState({this.id});

  handleConfirm() {
    getIt<HealthCertificationStore>()
        .bindHealthCert(
            _pageStore.phone,
            getIt<IdentityStore>().getIdentityById(id).did.toString(),
            _pageStore.temperature,
            _pageStore.contactOption.toString(),
            _pageStore.symptomsOption.toString())
        .then((_) => Application.router.pop(context));
  }

  @override
  void initState() {
    super.initState();
    _pageStore.setupDisposers();
    _pageStore.validateAll();
  }

  @override
  void dispose() {
    _pageStore.dispose();
    super.dispose();
  }

  Widget _textFiled(TextInputType inputType, Function onChanged) {
    return Container(
        height: 47,
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: WalletTheme.rgbColor('#f1f0f0'),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          keyboardType: inputType,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
          ),
          style:
              TextStyle(fontSize: 16, color: WalletTheme.rgbColor('#888888')),
          onChanged: onChanged,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
        fontWeight: FontWeight.w600,
        color: WalletTheme.rgbColor('#222222'),
        height: 1.6,
        letterSpacing: 0.75);

    final TextStyle errorStyle = TextStyle(color: Colors.red);

    return Observer(
        builder: (_) => CommonLayout(
            title: '健康认证',
            withBottomBtn: true,
            btnText: '确定',
            btnOnPressed: _pageStore.error.hasErrors ? null : handleConfirm,
            bodyBackColor: '#fafafa',
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text(
                        '* 手机号码',
                        style: titleStyle,
                      ),
                      Expanded(child: Container()),
                      Text(_pageStore.error.phone ?? '', style: errorStyle),
                    ],
                  )),
                  _textFiled(TextInputType.phone,
                      (String value) => _pageStore.phone = value),
                  Row(
                    children: <Widget>[
                      Text('* 今日体温（℃）', style: titleStyle),
                      Expanded(child: Container()),
                      Text(_pageStore.error.temperature ?? '',
                          style: errorStyle),
                    ],
                  ),
                  _textFiled(TextInputType.number,
                      (String value) => _pageStore.temperature = value),
                  Text('* 近14天内您是否接触新冠肺炎确诊患者或疑似患者？', style: titleStyle),
                  Row(
                      children: SelectOption.values
                          .map((contact) => [
                                Radio(
                                  onChanged: (value) {
                                    _pageStore.contactOption = value;
                                  },
                                  groupValue: _pageStore.contactOption,
                                  value: contact,
                                ),
                                Text(contact.description())
                              ])
                          .expand((list) => list)
                          .toList()
                            ..addAll([
                              Expanded(child: Container()),
                              Text(_pageStore.error.contact ?? '',
                                  style: errorStyle)
                            ])),
                  Text('* 您是否有发烧、恶心呕吐、头痛、呼吸急促、心慌、胸闷、乏力、肌肉疼痛等症状？',
                      style: titleStyle),
                  Row(
                      children: SelectOption.values
                          .map((symptoms) => [
                                Radio(
                                  onChanged: (value) {
                                    _pageStore.symptomsOption = value;
                                  },
                                  groupValue: _pageStore.symptomsOption,
                                  value: symptoms,
                                ),
                                Text(symptoms.description())
                              ])
                          .expand((list) => list)
                          .toList()
                            ..addAll([
                              Expanded(child: Container()),
                              Text(_pageStore.error.symptoms ?? '',
                                  style: errorStyle)
                            ])),
                  Row(children: <Widget>[
                    Checkbox(
                      activeColor: Colors.blue,
                      value: _pageStore.hasCommitment ?? false,
                      onChanged: (bool value) {
                        _pageStore.hasCommitment = value;
                      },
                    ),
                    Text('本人郑重承诺'),
                    Expanded(child: Container()),
                    Text(_pageStore.error.commitment ?? '', style: errorStyle)
                  ]),
                  Text('上述信息是我本人填写，本人对内容真实性和完整性负责，因信息填报不实导致相关后果的，本人愿意承担相应责任。',
                      style: TextStyle(color: Colors.grey))
                ],
              ),
            )));
  }
}
