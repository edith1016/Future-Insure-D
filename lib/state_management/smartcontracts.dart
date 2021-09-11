// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/account.dart';
// import '../Models/accounts/contract.dart';
// import '../Models/accounts/delegate.dart';
// import '../Models/accounts/empty.dart';
// import '../Models/accounts/user.dart';
// import '../Models/operations.dart';
// import '../Networking/networking.dart';
// import '../ui/pages/import_account.dart';
// import 'package:tezster_dart/tezster_dart.dart';
// import 'package:insured/homepage.dart';

// class SmartState{
// var server = '';

// var contract = """parameter string;
//     storage string;
//     code { AMOUNT; PUSH mutez 500000;
//            COMPARE; LE; IF{} {FAILWITH};                      
// }""";

// var storage = '"Sample"';

// var keyStore = KeyStoreModel(
//       publicKey: 'edpkvQtuhdZQmjdjVfaY9Kf4hHfrRJYugaJErkCGvV3ER1S7XWsrrj',
//       secretKey:
//           'edskRgu8wHxjwayvnmpLDDijzD3VZDoAH7ZLqJWuG4zg7LbxmSWZWhtkSyM5Uby41rGfsBGk4iPKWHSDniFyCRv3j7YFCknyHH',
//       publicKeyHash: 'tz1QSHaKpTFhgHLbqinyYRjxD5sLcbfbzhxy',
//     );

// var signer = await TezsterDart.createSigner(
//         TezsterDart.writeKeyWithHint(keyStore.secretKey, 'edsk'));

// var result = await TezsterDart.sendContractOriginationOperation(
//       server,
//       signer,
//       keyStore,
//       0,
//       null,
//       100000,
//       1000,
//       100000,
//       contract,
//       storage,
//       codeFormat: TezosParameterFormat.Michelson,
//     );

// print("Operation groupID ===> $result['operationGroupID']");
// }