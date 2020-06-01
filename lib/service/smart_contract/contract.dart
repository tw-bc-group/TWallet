import 'package:http/http.dart' show Client;
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

const tokenContractName = 'token';
const identityRegistryContractName = 'identity-registry';

class ContractService {
  const ContractService(this.contracts);

  final Map<String, Contract> contracts;

  Contract get identityRegistryContract =>
      contracts[identityRegistryContractName];

  Contract get twPointContract => contracts[tokenContractName];

  static Future<ContractService> init() async {
    final Map<String, Contract> contracts = {};
    for (final name in [identityRegistryContractName, tokenContractName]) {
      (await Contract.fromApi(name))
          .ifPresent((contract) => contracts[name] = contract);
    }
    return ContractService(contracts);
  }
}

class Contract {
  Contract(this.contract);
  final DeployedContract contract;
  final Web3Client web3Client =
      Web3Client(globalEnv().web3RpcGatewayUrl, Client());

  static Future<Optional<Contract>> fromApi(String contractName) async {
    return getIt<ApiProvider>()
        .fetchContractAbiV1(contractName: contractName)
        .then((res) {
      res.ifPresent((contract) {
        if (contractName == tokenContractName) {
          globalEnv().rebuild((builder) {
            builder.tokenName = contract.name;
            if (null != contract.symbol) {
              builder.tokenSymbol = contract.symbol;
            }
            if (null != contract.decimal) {
              builder.tokenPrecision = contract.decimal;
            }
            getIt<EnvStore>().env = builder.build();
          });
        }
      });

      return res.map((contract) => Contract(DeployedContract(
          ContractAbi.fromJson(contract.abi, contractName),
          EthereumAddress.fromHex(contract.address))));
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
                parameters: parameters,
                gasPrice: EtherAmount.zero(),
                maxGas: 3000000,
              ),
              fetchChainIdFromNetworkId: true)
          .then((rawTx) => '0x${bytesToHex(rawTx)}');
    });
  }
}
