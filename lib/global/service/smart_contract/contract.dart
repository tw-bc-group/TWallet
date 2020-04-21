import 'package:http/http.dart' show Client;
import 'package:tw_wallet_ui/global/common/env.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

const IDENTITY_REGISTRY_CONTRACT_NAME = 'identity-registry';
const TW_POINT_CONTRACT_NAME = 'tw-point';

class ContractService {
  const ContractService(this.contracts);

  final Map<String, Contract> contracts;

  Contract get identityRegistryContract =>
      contracts[IDENTITY_REGISTRY_CONTRACT_NAME];

  Contract get twPointContract => contracts[TW_POINT_CONTRACT_NAME];

  static Future<ContractService> init() async {
    Map<String, Contract> contracts = Map();
    [IDENTITY_REGISTRY_CONTRACT_NAME, TW_POINT_CONTRACT_NAME]
        .forEach((name) async {
      contracts[name] = await Contract.fromApi(name);
    });
    return ContractService(contracts);
  }
}

class Contract {
  Contract(this.contract);

  final Web3Client web3Client = Web3Client(QUORUM_RPC_GATEWAY, Client());
  final DeployedContract contract;

  static Future<Contract> fromApi(String contractName) async {
    return getIt<ApiProvider>()
        .fetchContractAbiV1(contractName: contractName)
        .then((contract) {
      return Contract(DeployedContract(
          ContractAbi.fromJson(contract.abi, contractName),
          EthereumAddress.fromHex(contract.address)));
    });
  }

  Future<String> signContractCall(
      String privateKey, String functionName, List<dynamic> parameters) async {
    return web3Client.credentialsFromPrivateKey(privateKey).then((credentials) {
      return web3Client
          .signTransaction(
              credentials,
              Transaction.callContract(
                  contract: contract,
                  function: contract.function(functionName),
                  parameters: parameters),
              fetchChainIdFromNetworkId: true)
          .then((rawTx) => '0x${bytesToHex(rawTx)}');
    });
  }
}
