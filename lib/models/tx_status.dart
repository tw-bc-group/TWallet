enum TxStatus { succeeded, transferring, failed }

const TxStatusSucceededStr = "succeeded";
const TxStatusTransferringStr = "transferring";
const TxStatusFailedStr = "failed";

const TxStatusFromString = {
  TxStatusSucceededStr: TxStatus.succeeded,
  TxStatusTransferringStr: TxStatus.transferring,
  TxStatusFailedStr: TxStatus.failed,
};

String statusNameCN(TxStatus status) {
  final s = {
    TxStatus.succeeded: "成功",
    TxStatus.transferring: "处理中",
    TxStatus.failed: "失败",
  }[status];
  return s;
}