import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/api_error.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/identity/account_info.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/identity/health_info.dart';
import 'package:tw_wallet_ui/models/identity/profile_info.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/models/send_transaction_response.dart';
import 'package:tw_wallet_ui/models/ssi/verifiable_presentation.dart';
import 'package:tw_wallet_ui/models/ssi/verified.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/models/webview/create_account_param.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_close.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_error_msg.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_hint.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_input.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_title.dart';
import 'package:tw_wallet_ui/models/webview/send_transaction_request.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/parameter.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/sign_transaction.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/transaction_info.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/health_certificate/health_certificate_page_store.dart';

part 'serializer.g.dart';

@SerializersFor([
  ApiResponse,
  ApiError,
  Contract,
  DecentralizedIdentity,
  AccountInfo,
  HealthInfo,
  ProfileInfo,
  Transaction,
  TwBalance,
  TxStatus,
  HealthCertification,
  HealthCertificationSub,
  HealthCertificationToken,
  HealthyStatus,
  Verified,
  SelectOption,
  WebviewRequest,
  WebviewRequestMethod,
  WebviewParameter,
  WebviewParameterType,
  WebviewTransactionInfo,
  WebviewSignTransaction,
  WebviewPincodeDialogStyle,
  WebviewPincodeDialogClose,
  WebviewPincodeDialogErrorMsg,
  WebviewPincodeDialogHint,
  WebviewPincodeDialogInput,
  WebviewPincodeDialogTitle,
  CreateAccountParam,
  Command,
  CommandType,
  Dcep,
  DcepType,
  TxReceive,
  TxSend,
  SendTransactionRequest,
  SendTransactionResponse,
  IssuerResponse,
  VcType,
  VerifiablePresentation,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(AmountSerializer())
      ..add(Iso8601DateTimeSerializer())
      ..addBuilderFactory(const FullType(Dcep), () => DcepBuilder())
      ..addBuilderFactory(const FullType(TxReceive), () => TxReceiveBuilder())
      ..addBuilderFactory(const FullType(TxSend), () => TxSendBuilder())
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Dcep)]),
        () => ListBuilder<Dcep>(),
      )
      ..addBuilderFactory(const FullType(Command), () => CommandBuilder())
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Transaction)]),
        () => ListBuilder<Transaction>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(Contract)]),
        () => ApiResponseBuilder<Contract>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(Dcep)]),
        () => ApiResponseBuilder<Dcep>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(SendTransactionResponse)]),
        () => ApiResponseBuilder<SendTransactionResponse>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [
          FullType(BuiltList, [FullType(Dcep)])
        ]),
        () => ApiResponseBuilder<BuiltList<Dcep>>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(Transaction)]),
        () => ApiResponseBuilder<Transaction>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [
          FullType(BuiltList, [FullType(Transaction)])
        ]),
        () => ApiResponseBuilder<BuiltList<Transaction>>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(TwBalance)]),
        () => ApiResponseBuilder<TwBalance>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(Verified)]),
        () => ApiResponseBuilder<Verified>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(HealthCertificationToken)]),
        () => ApiResponseBuilder<HealthCertificationToken>(),
      )
      ..addBuilderFactory(
        const FullType(WebviewRequest),
        () => WebviewRequestBuilder(),
      )
      ..addBuilderFactory(
        const FullType(WebviewParameter, [FullType(WebviewParameterType)]),
        () => WebviewParameterBuilder(),
      )
      ..addBuilderFactory(
        const FullType(
          WebviewTransactionInfo,
          [FullType(BuiltList), FullType(WebviewParameter)],
        ),
        () => WebviewTransactionInfoBuilder(),
      )
      ..addBuilderFactory(
        const FullType(
          WebviewSignTransaction,
          [
            FullType(WebviewTransactionInfo),
            FullType(WebviewPincodeDialogStyle),
          ],
        ),
        () => WebviewSignTransactionBuilder,
      )
      ..addBuilderFactory(
        const FullType(
          WebviewPincodeDialogStyle,
          [
            FullType(WebviewPincodeDialogClose),
            FullType(WebviewPincodeDialogErrorMsg),
            FullType(WebviewPincodeDialogHint),
            FullType(WebviewPincodeDialogInput),
            FullType(WebviewPincodeDialogTitle)
          ],
        ),
        () => WebviewPincodeDialogStyleBuilder,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(IssuerResponse)]),
        () => ListBuilder<IssuerResponse>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(IssuerResponse)]),
        () => ApiResponseBuilder<IssuerResponse>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [
          FullType(BuiltList, [FullType(IssuerResponse)])
        ]),
        () => ApiResponseBuilder<BuiltList<IssuerResponse>>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(VcType)]),
        () => ListBuilder<VcType>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(VcType)]),
        () => ApiResponseBuilder<VcType>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [
          FullType(BuiltList, [FullType(VcType)])
        ]),
        () => ApiResponseBuilder<BuiltList<VcType>>(),
      )
      ..addBuilderFactory(
        const FullType(ApiResponse, [FullType(VerifiablePresentation)]),
        () => ApiResponseBuilder<VerifiablePresentation>(),
      ))
    .build();
