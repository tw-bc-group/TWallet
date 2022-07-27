<h1 align="center">
  <br>
  <a href="https://blockchain.thoughtworks.cn/twallet/"><img src="./assets/images/t-wallet.png" alt="TWallet" width="200"></a>
  <br>
  TWallet
  <br>
  <p align="center">
    <img src="https://img.shields.io/badge/contributions-welcome-orange.svg" alt="Contributions welcome">
    <img src="https://img.shields.io/badge/flutter-1.20.0-informational" alt="Flutter">
    <img src="https://img.shields.io/badge/License-BSD%203--Clause-blue.svg" alt="License">
  </p>
</h1>

<h4 align="center">一个基于区块链的行业领先的数字钱包项目，包含名为 DC/EP 的通证，具备 DID（去中心化身份）和 DApp 浏览器的功能。</h4>

<p align="center">
  <img src="https://blockchain.thoughtworks.cn/wp-content/uploads/2020/06/ScreenCut_Pay.svg">
</p>

## TWallet 四问

### 什么是数字钱包？

***引用自维基百科:***

> 数字钱包也称为“电子钱包”，是指一种电子设备、在线服务或软件程序，允许一方与另一方进行电子交易，以数字货币单位交换商品和服务，包括使用计算机在线购买商品或使用智能手机在商店购买商品。用户可以在将钱存入数字钱包，或者把你的个人银行账户链接到数字钱包。用户还可能将他们的驾驶执照、健康卡、会员卡和其他身份证件存储在钱包中，这些个人凭证可以通过近场通信 (NFC) 以无线方式传递信息到商家的终端。越来越多的数字钱包不仅用于基本的金融交易，而且还用于验证持有人的凭据，例如，数字钱包可以在购买酒类时向商店验证买家的年龄，该系统已经在日本流行起来，在日本，数字钱包被称为“wallet mobiles”。加密货币钱包是一种数字钱包，其中存储了比特币等加密货币的私钥。

### 什么是 DID (去中心化身份)？

<img width="400px" src="https://blockchain.thoughtworks.cn/wp-content/uploads/2020/06/ScreenCut_Identity.svg" align="right">

***引用自维基百科:***

> 去中心化身份 (DID) 是一种用来实现可验证的去中心化数字身份的标识符，它们基于自我主权身份规范。DID 可以标识任何主体（例如，人、组织、事物、数据模型、抽象实体等），这些标识旨在使 DID 的控制者能够证明对其的控制，并独立于任何集中式注册机构、身份提供者或证书颁发机构。DID 的表现形式是 URL，它将 DID 主题（Subject）与 DID 文档（Document）相关联以实现可信的交互方式。每个 DID 文档都含有加密内容、验证方式或服务端点，它们提供了一组机制，使 DID 控制器能够证明它拥有对该 DID 的控制权。服务端点可以与 DID 主题进行可信交互。DID 文档可能包含有关它所标识的主题的语义，也可能包含 DID 主题本身（例如数据模型）。

### 什么是 DApp？

***引用自维基百科:***

> 去中心化应用程序（DApp、dApp、Dapp 或 dapp）是运行在分布式计算系统上的计算机应用程序。DApps 已被分布式账本技术 (DLT) 普及，例如以太坊区块链，其中 DApps 通常被称为智能合约。

### 什么是 DApp 浏览器？

> 去中心化应用程序 (DApp) 浏览器是封装了 web3 能力的用户界面，可以让用户与去中心化应用程序进行交互。

## 使用指南

### 如何试用 TWallet

现阶段，我们没有在各大应用市场上架该 App 的计划，如果你有兴趣，[请在此页面发起申请](https://blockchain.thoughtworks.cn/twallet/)。

### 反馈收集

请不要吝啬你的任何反馈，你可以[到这个 issue 页面](https://github.com/tw-bc-group/TWallet/issues)提交 issue，记得带上一些 label 以帮助我们识别 issue 类型，我们会尽快处理。

## 如何开发

### 本地启动

1. 确保你已安装 ```flutter```
```
Flutter 3.0.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision f1875d570e (2 weeks ago) • 2022-07-13 11:24:16 -0700
Engine • revision e85ea0e79c
Tools • Dart 2.17.6 • DevTools 2.12.2
```

2. 使用 ```flutter doctor``` 检查 `flutter` 环境，并查看是否有已经安装的模拟器可以运行 TWallet
3. ```flutter run -d ${device}``` 在指定设备中运行。如果你想使用模拟器运行，预先运行下`flutter emulators`以查看可用的模拟器。

### 如何贡献

🎉🎉🎉 TWallet 项目欢迎你的加入！你可以通过以下方式参与进来，帮助我们一起贡献 TWallet：

- 负责一些带有特定标签的 issue 处理
- 提出新功能或需要提高的地方的建议
- 提交一个 bug
- 修复一个 bug
- 参与讨论并且帮助制订决策
- 提交任何 pull request 并被 approve 😃

## 注意事项

<p style="color: darkred;">该代码仓库遵循 BSD 3-Clause 许可，请不要随意打包上传此代码到应用市场！</p>
