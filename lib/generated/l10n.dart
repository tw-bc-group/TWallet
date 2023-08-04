// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change Identity`
  String get pageHomeChangeIdentity {
    return Intl.message(
      'Change Identity',
      name: 'pageHomeChangeIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Ticket`
  String get pageHomeTicket {
    return Intl.message(
      'Ticket',
      name: 'pageHomeTicket',
      desc: '',
      args: [],
    );
  }

  /// `Certification`
  String get pageHomeCertification {
    return Intl.message(
      'Certification',
      name: 'pageHomeCertification',
      desc: '',
      args: [],
    );
  }

  /// `Asset`
  String get pageHomeAsset {
    return Intl.message(
      'Asset',
      name: 'pageHomeAsset',
      desc: '',
      args: [],
    );
  }

  /// `Digital Currency`
  String get pageHomeDigitalCurrency {
    return Intl.message(
      'Digital Currency',
      name: 'pageHomeDigitalCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Deed`
  String get pageHomeDeed {
    return Intl.message(
      'Deed',
      name: 'pageHomeDeed',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get pageHomeHome {
    return Intl.message(
      'Home',
      name: 'pageHomeHome',
      desc: '',
      args: [],
    );
  }

  /// `Discovery`
  String get pageHomeDiscovery {
    return Intl.message(
      'Discovery',
      name: 'pageHomeDiscovery',
      desc: '',
      args: [],
    );
  }

  /// `Identity`
  String get pageHomeIdentity {
    return Intl.message(
      'Identity',
      name: 'pageHomeIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get pageHomeMe {
    return Intl.message(
      'Me',
      name: 'pageHomeMe',
      desc: '',
      args: [],
    );
  }

  /// `You have not added an identity, please go to the "Identity" page to add an identity`
  String get pageHomeNoIdentity {
    return Intl.message(
      'You have not added an identity, please go to the "Identity" page to add an identity',
      name: 'pageHomeNoIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Go Now`
  String get pageHomeGoNow {
    return Intl.message(
      'Go Now',
      name: 'pageHomeGoNow',
      desc: '',
      args: [],
    );
  }

  /// `Discovery`
  String get pageDiscoveryDiscovery {
    return Intl.message(
      'Discovery',
      name: 'pageDiscoveryDiscovery',
      desc: '',
      args: [],
    );
  }

  /// `Health Cert`
  String get pageDiscoveryHealthCert {
    return Intl.message(
      'Health Cert',
      name: 'pageDiscoveryHealthCert',
      desc: '',
      args: [],
    );
  }

  /// `More VC`
  String get pageDiscoveryMoreVc {
    return Intl.message(
      'More VC',
      name: 'pageDiscoveryMoreVc',
      desc: '',
      args: [],
    );
  }

  /// `Verification Senario`
  String get pageDiscoveryVerificationSenario {
    return Intl.message(
      'Verification Senario',
      name: 'pageDiscoveryVerificationSenario',
      desc: '',
      args: [],
    );
  }

  /// `Identity`
  String get pageIdentityIdentity {
    return Intl.message(
      'Identity',
      name: 'pageIdentityIdentity',
      desc: '',
      args: [],
    );
  }

  /// `New Identity`
  String get pageIdentityNewIdentity {
    return Intl.message(
      'New Identity',
      name: 'pageIdentityNewIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Copy successfully`
  String get pageIdentityCopySuccessfully {
    return Intl.message(
      'Copy successfully',
      name: 'pageIdentityCopySuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get pageMeMyProfile {
    return Intl.message(
      'My Profile',
      name: 'pageMeMyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Offline Payment`
  String get pageMeOfflinePayment {
    return Intl.message(
      'Offline Payment',
      name: 'pageMeOfflinePayment',
      desc: '',
      args: [],
    );
  }

  /// `My Chat`
  String get pageMeMyChat {
    return Intl.message(
      'My Chat',
      name: 'pageMeMyChat',
      desc: '',
      args: [],
    );
  }

  /// `Clear Data`
  String get pageMeClearData {
    return Intl.message(
      'Clear Data',
      name: 'pageMeClearData',
      desc: '',
      args: [],
    );
  }

  /// `Please be careful, all data would be deleted permanently and cannot be recovered`
  String get pageMeWarningOnClear {
    return Intl.message(
      'Please be careful, all data would be deleted permanently and cannot be recovered',
      name: 'pageMeWarningOnClear',
      desc: '',
      args: [],
    );
  }

  /// `Created Successfully`
  String get pageNewIdentityCreatedSuccessfully {
    return Intl.message(
      'Created Successfully',
      name: 'pageNewIdentityCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get pageNewIdeneityPersonalInformation {
    return Intl.message(
      'Personal Information',
      name: 'pageNewIdeneityPersonalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Name*`
  String get pageNewIdentityName {
    return Intl.message(
      'Name*',
      name: 'pageNewIdentityName',
      desc: '',
      args: [],
    );
  }

  /// `Please input name`
  String get pageNewIdeneityNameHint {
    return Intl.message(
      'Please input name',
      name: 'pageNewIdeneityNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get pageNewIdentityEmail {
    return Intl.message(
      'Email',
      name: 'pageNewIdentityEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please input email`
  String get pageNewIdentityEmailHint {
    return Intl.message(
      'Please input email',
      name: 'pageNewIdentityEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get pageNewIdentityMobile {
    return Intl.message(
      'Mobile',
      name: 'pageNewIdentityMobile',
      desc: '',
      args: [],
    );
  }

  /// `Please input phone number`
  String get pageNewIdentityMobileHint {
    return Intl.message(
      'Please input phone number',
      name: 'pageNewIdentityMobileHint',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get pageNewIdentityBirthday {
    return Intl.message(
      'Birthday',
      name: 'pageNewIdentityBirthday',
      desc: '',
      args: [],
    );
  }

  /// `YYYY-MM-DD`
  String get pageNewIdentityBirthdayHint {
    return Intl.message(
      'YYYY-MM-DD',
      name: 'pageNewIdentityBirthdayHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get pageNewIdentityConfirm {
    return Intl.message(
      'Confirm',
      name: 'pageNewIdentityConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to {appName}`
  String pageInputPinWelcome(Object appName) {
    return Intl.message(
      'Welcome to $appName',
      name: 'pageInputPinWelcome',
      desc: '',
      args: [appName],
    );
  }

  /// `Please create your PIN`
  String get pageInputPinCreatePin {
    return Intl.message(
      'Please create your PIN',
      name: 'pageInputPinCreatePin',
      desc: '',
      args: [],
    );
  }

  /// `- Usage -`
  String get pageInputPinUsage {
    return Intl.message(
      '- Usage -',
      name: 'pageInputPinUsage',
      desc: '',
      args: [],
    );
  }

  /// `Unlock`
  String get pageInputPinUnlock {
    return Intl.message(
      'Unlock',
      name: 'pageInputPinUnlock',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get pageInputPinTransaction {
    return Intl.message(
      'Transaction',
      name: 'pageInputPinTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get pageInputPinSettings {
    return Intl.message(
      'Settings',
      name: 'pageInputPinSettings',
      desc: '',
      args: [],
    );
  }

  /// `Please input 6 digits PIN`
  String get pageInputPinInput {
    return Intl.message(
      'Please input 6 digits PIN',
      name: 'pageInputPinInput',
      desc: '',
      args: [],
    );
  }

  /// `Please input 6 digits PIN again`
  String get pageInputPinAgain {
    return Intl.message(
      'Please input 6 digits PIN again',
      name: 'pageInputPinAgain',
      desc: '',
      args: [],
    );
  }

  /// `* Please input the same PIN `
  String get pageInputPinInconsist {
    return Intl.message(
      '* Please input the same PIN ',
      name: 'pageInputPinInconsist',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get pageInputPinNext {
    return Intl.message(
      'Next',
      name: 'pageInputPinNext',
      desc: '',
      args: [],
    );
  }

  /// `You can`
  String get pageNewWalletYouCan {
    return Intl.message(
      'You can',
      name: 'pageNewWalletYouCan',
      desc: '',
      args: [],
    );
  }

  /// `Create wallet`
  String get pageNewWalletCreate {
    return Intl.message(
      'Create wallet',
      name: 'pageNewWalletCreate',
      desc: '',
      args: [],
    );
  }

  /// `Restore wallet`
  String get pageNewWalletRestore {
    return Intl.message(
      'Restore wallet',
      name: 'pageNewWalletRestore',
      desc: '',
      args: [],
    );
  }

  /// `Web2.0 wallet`
  String get pageNewWalletWeb2 {
    return Intl.message(
      'Web2.0 wallet',
      name: 'pageNewWalletWeb2',
      desc: '',
      args: [],
    );
  }

  /// `Backup mnemonics`
  String get pageCreateWalletBackupTitle {
    return Intl.message(
      'Backup mnemonics',
      name: 'pageCreateWalletBackupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please copy the mnemonics below`
  String get pageCreateWalletBackupDescriptionSecOne {
    return Intl.message(
      'Please copy the mnemonics below',
      name: 'pageCreateWalletBackupDescriptionSecOne',
      desc: '',
      args: [],
    );
  }

  /// `We will verify them in the next step`
  String get pageCreateWalletBackupDescriptionSecTwo {
    return Intl.message(
      'We will verify them in the next step',
      name: 'pageCreateWalletBackupDescriptionSecTwo',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get pageCreateWalletBackupNext {
    return Intl.message(
      'Next',
      name: 'pageCreateWalletBackupNext',
      desc: '',
      args: [],
    );
  }

  /// `Backup Hint`
  String get pageCreateWalletBackupHintTitle {
    return Intl.message(
      'Backup Hint',
      name: 'pageCreateWalletBackupHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mnemonics are account credentials. To avoid account theft, please do not take screenshots`
  String get pageCreateWalletBackupWarning {
    return Intl.message(
      'Mnemonics are account credentials. To avoid account theft, please do not take screenshots',
      name: 'pageCreateWalletBackupWarning',
      desc: '',
      args: [],
    );
  }

  /// `Use paper and pen to copy the mnemonics correctly. \nDo not share the mnemonic with anyone and keep it in a safe place on an isolated network. \nIf your phone is lost, stolen, or damaged, the mnemonic can restore your assets.`
  String get pageCreateWalletBackupHintDescription {
    return Intl.message(
      'Use paper and pen to copy the mnemonics correctly. \nDo not share the mnemonic with anyone and keep it in a safe place on an isolated network. \nIf your phone is lost, stolen, or damaged, the mnemonic can restore your assets.',
      name: 'pageCreateWalletBackupHintDescription',
      desc: '',
      args: [],
    );
  }

  /// `I have copied it`
  String get pageBackupHintNext {
    return Intl.message(
      'I have copied it',
      name: 'pageBackupHintNext',
      desc: '',
      args: [],
    );
  }

  /// `Verify mnemonics`
  String get pageCreateWalletConfirmTitle {
    return Intl.message(
      'Verify mnemonics',
      name: 'pageCreateWalletConfirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `Click on the mnemonic words below in order`
  String get pageCreateWalletConfirmDescription {
    return Intl.message(
      'Click on the mnemonic words below in order',
      name: 'pageCreateWalletConfirmDescription',
      desc: '',
      args: [],
    );
  }

  /// `finish`
  String get pageCreateWalletConfirmNext {
    return Intl.message(
      'finish',
      name: 'pageCreateWalletConfirmNext',
      desc: '',
      args: [],
    );
  }

  /// `Backup Hint`
  String get pageCreateWalletConfirmHintTitle {
    return Intl.message(
      'Backup Hint',
      name: 'pageCreateWalletConfirmHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Use paper and pen to copy the mnemonics correctly. \nDo not share the mnemonic with anyone and keep it in a safe place on an isolated network. \nIf your phone is lost, stolen, or damaged, the mnemonic can restore your assets.`
  String get pageCreateWalletConfirmHintDescription {
    return Intl.message(
      'Use paper and pen to copy the mnemonics correctly. \nDo not share the mnemonic with anyone and keep it in a safe place on an isolated network. \nIf your phone is lost, stolen, or damaged, the mnemonic can restore your assets.',
      name: 'pageCreateWalletConfirmHintDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter mnemonics`
  String get pageRestoreWalletTitle {
    return Intl.message(
      'Enter mnemonics',
      name: 'pageRestoreWalletTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the mnemonic you backed up when you created your wallet.`
  String get pageRestoreWalletDescription {
    return Intl.message(
      'Please enter the mnemonic you backed up when you created your wallet.',
      name: 'pageRestoreWalletDescription',
      desc: '',
      args: [],
    );
  }

  /// `Backup Hint`
  String get pageRestoreWalletHintTitle {
    return Intl.message(
      'Backup Hint',
      name: 'pageRestoreWalletHintTitle',
      desc: '',
      args: [],
    );
  }

  /// `Use paper and pen to copy the mnemonics correctly. \nDo not share the mnemonic with anyone and keep it in a safe place on an isolated network. \nIf your phone is lost, stolen, or damaged, the mnemonic can restore your assets.`
  String get pageRestoreWalletHintDescription {
    return Intl.message(
      'Use paper and pen to copy the mnemonics correctly. \nDo not share the mnemonic with anyone and keep it in a safe place on an isolated network. \nIf your phone is lost, stolen, or damaged, the mnemonic can restore your assets.',
      name: 'pageRestoreWalletHintDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
