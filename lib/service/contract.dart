import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/util.dart';
import 'package:tw_wallet_ui/models/contract.dart' as model;
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';
import 'package:tw_wallet_ui/service/identity.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

const maxGas = 300000;
const contractsOnChain = ['token', 'identities', 'nft-dcep'];

class ContractService {
  const ContractService(this.contracts);

  final Map<String, Contract> contracts;

  Contract? get tokenContract => contracts[contractsOnChain[0]];

  Contract? get identitiesContract => contracts[contractsOnChain[1]];

  Contract? get nftTokenContract => contracts[contractsOnChain[2]];

  static Future<ContractService> init() async {
    final Map<String, Contract> contracts = {};
    for (final name in contractsOnChain) {
      contracts[name] = await Contract.fromApi(name);
    }
    return ContractService(contracts);
  }

  static List<Identity> assemble(List<dynamic> callResult) {
    final rawList = callResult.map((e) => e as List).toList();
    return Util.zip(Util.expand(rawList))
        .map(
          (c) => Identity(
            name: c[0] as String,
            did: c[1] as String,
            dappId: c[2] as String?,
            index: (c[3] as BigInt).toInt(),
            extraInfo: c[4] as String?,
            publicKey: c[5] as String,
          ),
        )
        .toList();
  }
}

class Contract {
  Contract(this.contract);

  final DeployedContract contract;
  final Web3Client web3Client =
      Web3Client(Application.globalEnv.web3RpcGatewayUrl, Client());

  static Future<Contract> fromApi(String contractName) async {
    return Get.find<ApiProvider>()
        .fetchContractAbiV1(contractName: contractName)
        .then((contract) {
      if (contractName == contractsOnChain[0]) {
        rebuildTokenEnv(contract);
      }

      return Contract(
        DeployedContract(
          ContractAbi.fromJson(contract.abi, contractName),
          EthereumAddress.fromHex(contract.address),
        ),
      );
    });
  }

  static void rebuildTokenEnv(model.Contract contract) {
    Application.globalEnv.rebuild((builder) {
      builder.tokenName = contract.name;
      if (null != contract.symbol) {
        builder.tokenSymbol = contract.symbol;
      }
      if (null != contract.decimal) {
        builder.tokenPrecision = contract.decimal;
      }
      Application.globalEnv = builder.build();
    });
  }

  Future<int> getTransactionCount(EthereumAddress address) async {
    return web3Client.getTransactionCount(address);
  }

  List<dynamic> decodeParameters(String funcName, Uint8List data) {
    return TupleType(
      contract
          .function(funcName)
          .parameters
          .map((param) => param.type)
          .toList(),
    ).decode(data.buffer, 4).data;
  }

  Transaction makeTransaction(
    String functionName,
    List<dynamic> parameters, {
    int? nonce,
  }) {
    return Transaction.callContract(
      contract: contract,
      function: contract.function(functionName),
      parameters: parameters,
      gasPrice: EtherAmount.zero(),
      maxGas: maxGas,
      nonce: nonce,
    );
  }

  void eventStream(String eventName, Function(List<dynamic>) onListen) {
    final listenedEvent = contract.event(eventName);
    web3Client
        .events(
          FilterOptions.events(
            contract: contract,
            event: contract.event(eventName),
          ),
        )
        .listen(
          (event) =>
              onListen(listenedEvent.decodeResults(event.topics!, event.data!)),
        );
  }

  Future<List<dynamic>> callFunction(
    String publicKey,
    String functionName,
    List<dynamic>? parameters,
  ) async {
    return web3Client
        .call(
      sender: EthereumAddress.fromHex(
        BlockChainService.publicKeyToAddress(publicKey.substring(2)),
      ),
      contract: contract,
      function: contract.function(functionName),
      params: parameters ?? [],
    )
        .then((res) {
      return res;
    });
  }

  Future<bool> sendTransaction(
    Credentials credentials,
    String functionName,
    List<dynamic> parameters,
  ) async {
    TransactionReceipt? receipt;
    final String hash = await web3Client.sendTransaction(
      credentials,
      makeTransaction(functionName, parameters),
      chainId: null,
      fetchChainIdFromNetworkId: true,
    );

    while (true) {
      await Future.delayed(const Duration(seconds: 2)).then((_) async {
        receipt = await web3Client.getTransactionReceipt(hash);
      });

      break;
    }

    return receipt!.status!;
  }

  Future<String> signContractCall(
    String privateKey,
    String functionName,
    List<dynamic> parameters, {
    int? nonce,
  }) async {
    return web3Client
        .signTransaction(
          EthPrivateKey.fromHex(privateKey),
          makeTransaction(functionName, parameters, nonce: nonce),
          chainId: 10,
        )
        .then((rawTx) => '0x${bytesToHex(rawTx)}');
  }
}
