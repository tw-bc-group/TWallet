import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class ComposeVcPage extends StatelessWidget {
  ComposeVcPage();

  final VcStore _store = Get.find();

  get vcpr => _store.vcpr;

  @override
  Widget build(BuildContext context) {

    print("find: ${vcpr.toJson()}");

    List<VerifiableCredential> vcs = <VerifiableCredential>[];

    for (final vcType in vcpr.vcTypes) {
      switch(vcType.toString()) {
        case "qSARS-CoV-2-Rapid-Test-Credential": {
          vcs.add(VerifiableCredential(
            name: "行乘健康码",
            issuer: "中国移动",
          ));
        }
        break;

        case "ImmunoglobulinDetectionTestCard": {
          vcs.add(VerifiableCredential(
            name: "核算检查",
            issuer: "某某检测机构",
          ));
        }
        break;

        default: {
          print("unknow vc type id: ${vcType}");
        }
        break;
      }
    }

    final List<Widget> list = <Widget>[];

    list.add(_header);
    vcs.forEach((vc) {
      list.add(VerifiableCredentialCard(vc: vc));
    });
    list.add(_bottom(context));

    return CommonLayout(
      title: "选择凭据",
      child: Stack(
        children: <Widget>[
          ListView(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              children: list),
        ],
      ),
    );
  }

  Widget get _header {
    return Container(
      height: 70,
      color: WalletColor.primary,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("【地坛医院】请求验证以下凭证\n请确认是否同意？",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                )),
          ),
        ],
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Column(
      children: <Widget>[
        WalletTheme.button(
          text: '同意并生成验证二维码',
          onPressed: () async {
            const vcTokens = [
              "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJESUQ6VFc6Y0E4NDM1NjllMzQyNzE0NGNFYWQ1ZTRkNTk5OWEzRDBjQ0Y5MkI4ZSIsInZlciI6IjAuMSIsImlhdCI6MTYwOTcyNTM1NCwiZXhwIjoxNjA5NzI3MTU0LCJ2YyI6eyJ0eXAiOlsiVmVyaWZpYWJsZUNyZWRlbnRpYWwiLCJxU0FSUy1Db1YtMi1SYXBpZC1UZXN0LUNyZWRlbnRpYWwiXSwiaWQiOiJESUQ6VFc6R2VIdVVNYjRQUncxYVhHTndra3NHNHg5N2JRY2tVM3RjRmgzYzlZUyIsImlzc3VlciI6eyJsb2NhdGlvbiI6eyJuYW1lIjoiU3RhbmZvcmQgSGVhbHRoIENhcmUiLCJ1cmwiOiJodHRwczovL3N0YW5mb3JkaGVhbHRoY2FyZS5vcmcvIiwiQHR5cGUiOiJDb3ZpZFRlc3RpbmdGYWNpbGl0eSJ9fSwibmFtZSI6InFTQVJTLUNvVi0yIElnRy9JZ00gUmFwaWQgVGVzdCBDcmVkZW50aWFsIiwiZGVzYyI6IlJlc3VsdHMgZnJvbSBhbnRpYm9keSB0ZXN0aW5nIHNob3VsZCBub3QgYmUgdXNlZCBhcyB0aGUgc29sZSBiYXNpcyB0byBkaWFnbm9zZSBvciBleGNsdWRlIFNBUlMtQ29WLTIgaW5mZWN0aW9uLiBGYWxzZSBwb3NpdGl2ZSByZXN1bHRzIG1heSBvY2N1ciBkdWUgdG8gY3Jvc3MtcmVhY3RpbmcgYW50aWJvZGllcyBmcm9tIHByZXZpb3VzIGluZmVjdGlvbnMsIHN1Y2ggYXMgb3RoZXIgY29yb25hdmlydXNlcywgb3IgZnJvbSBvdGhlciBjYXVzZXMgU2FtcGxlcyB3aXRoIHBvc2l0aXZlIHJlc3VsdHMgc2hvdWxkIGJlIGNvbmZpcm1lZCB3aXRoIGFsdGVybmF0aXZlIHRlc3RpbmcgbWV0aG9kKHMpIGFuZCBjbGluaWNhbCBmaW5kaW5ncyBiZWZvcmUgYSBkaWFnbm9zdGljIGRldGVybWluYXRpb24gaXMgbWFkZS4iLCJzdWIiOnsiaWQiOiJUVzpkaWQ6cXdlcmRmIiwidHlwIjpbInFTQVJTLUNvVi0yLVJhcGlkLVRlc3QtQ3JlZGVudGlhbCJdLCJudW0iOiI1NTE1QzAyNSwgNTUxNUMwNTAsIDU1MTVDMTAwIiwiaWZ1IjoiaHR0cHM6Ly9jZWxsZXhjb3ZpZC5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjAvMDQvQ2VsbGV4LXJhcGlkLWlmdS5wZGYiLCJhc3NheSI6Ik5lZ2F0aXZlIn0sIkBjb250ZXh0IjpbImh0dHBzOi8vd3d3LnczLm9yZy8yMDE4L2NyZWRlbnRpYWxzL3YxIiwiaHR0cHM6Ly93M2MtY2NnLmdpdGh1Yi5pby92Yy1leGFtcGxlcy9jb3ZpZC0xOS92Mi92Mi5qc29ubGQiXX19.MDFiNjkzNDM4OTljMzExMWJiZjJmNmY2NmM4NmI0ZGJmZmRhM2E5OGQ3YTM2MjUyYzgxMzc1NDMwODc5ZTFlZDYxNTc2NzA3NzNiNTg2MDVkY2FkODgyZGM1Y2RjNTgyNTMxNjc4M2FlM2YwMjVkYzkxZmFkZmExMjRlYzM1NTNjOA==",
              "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJESUQ6VFc6Y0E4NDM1NjllMzQyNzE0NGNFYWQ1ZTRkNTk5OWEzRDBjQ0Y5MkI4ZSIsInZlciI6IjAuMSIsImlhdCI6MTYwOTcyNTM5OCwiZXhwIjoxNjA5NzI3MTk4LCJ2YyI6eyJ0eXAiOlsiVmVyaWZpYWJsZUNyZWRlbnRpYWwiLCJJbW11bm9nbG9idWxpbkRldGVjdGlvblRlc3RDYXJkIl0sImlkIjoiRElEOlRXOjJDMnY2QmRIZnMybWM0S1NTNUd2V2JmTkJTRlVhQ1VaRWYxcnYxdFkiLCJpc3N1ZXIiOnsibG9jYXRpb24iOnsibmFtZSI6IlN0YW5mb3JkIEhlYWx0aCBDYXJlIiwidXJsIjoiaHR0cHM6Ly9zdGFuZm9yZGhlYWx0aGNhcmUub3JnLyIsIkB0eXBlIjoiQ292aWRUZXN0aW5nRmFjaWxpdHkifX0sIm5hbWUiOiJJbW11bm9nbG9idWxpbiBEZXRlY3Rpb24gVGVzdCBDYXJkIiwiZGVzYyI6IkltbXVub2dsb2J1bGluIGRldGVjdGlvbiB0ZXN0cyBhcmUgYmFzZWQgb24gdGhlIHF1YWxpdGF0aXZlIGRldGVjdGlvbiBvZiBJZ00gYW5kIElnRyB0aGF0IGFyZSBzcGVjaWZpY2FsbHkgZ2VuZXJhdGVkIGJ5IHRoZSBib2R5IGluIHJlc3BvbnNlIHRvIFNBUlMtQ29WLTIgaW5mZWN0aW9uLiIsInN1YiI6eyJpZCI6IlRXOmRpZDpxd2VyZGYiLCJ0eXAiOlsiSW1tdW5vZ2xvYnVsaW5EZXRlY3Rpb25UZXN0U3ViamVjdCJdLCJpZ0ciOnRydWUsImlnTSI6dHJ1ZX0sIkBjb250ZXh0IjpbImh0dHBzOi8vd3d3LnczLm9yZy8yMDE4L2NyZWRlbnRpYWxzL3YxIiwiaHR0cHM6Ly93M2MtY2NnLmdpdGh1Yi5pby92Yy1leGFtcGxlcy9jb3ZpZC0xOS92MS92MS5qc29ubGQiXX19.MDExOThjOTRjNzc3ZGQyNWI5ZTQ2OTg5OTM2MDkzNzk5MjcyNjFkZDFkYzU2MWQxMjdhNjc5ZjM4OTBjM2VmOGExMmI1ZmUzODVlZGVkMzMwMmNmMDQ1MDI0YWQ4ZmZiMjM5Mjk0MjMzNjcwZGFjMWIxYmFkMzE1MjAwMzA5NzQ5Mg==",
            ];
            VerifiableCredentialTokenResponse vctr = await SsiService.verifyAndGetPassport(vcTokens);
            final vcPass = VcPass(name: _store.vcpr.name as String, token: vctr.token);
            await _store.setPass(vcPass);
            Application.router.navigateTo(context, Routes.passPage);
          },
        ),
        WalletTheme.button(
          text: '拒绝',
          onPressed: () {},
        ),
      ],
    );
  }
}
