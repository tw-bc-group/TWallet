// mapping between smart contract and our code
class Identity {
  final String name;
  final String did;
  final String? dappId;
  final int index;
  final String? extraInfo;
  final String publicKey;

  Identity({
    required this.name,
    required this.did,
    this.dappId,
    required this.index,
    this.extraInfo,
    required this.publicKey,
  });
}
