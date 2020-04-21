enum TxStatus { succeeded, transferring, failed }

const TxStatusSucceededStr = "succeeded";
const TxStatusTransferringStr = "transferring";
const TxStatusFailedStr = "failed";

const TxStatusFromString = {
  TxStatusSucceededStr: TxStatus.succeeded,
  TxStatusTransferringStr: TxStatus.transferring,
  TxStatusFailedStr: TxStatus.failed,
};