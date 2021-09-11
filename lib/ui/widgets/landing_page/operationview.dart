import 'package:flutter/material.dart';
import 'package:insured/Models/accounts/delegate.dart';
import 'package:insured/Models/operations.dart';
import 'package:insured/Models/operations/activation.dart';
import 'package:insured/Models/operations/baking.dart';
import 'package:insured/Models/operations/ballot.dart';
import 'package:insured/Models/operations/double_baking.dart';
import 'package:insured/Models/operations/endorsements.dart';
import 'package:insured/Models/operations/nonce_revelation_operation.dart';
import 'package:insured/Models/operations/origination_operation.dart';
import 'package:insured/Models/operations/proposal.dart';
import 'package:insured/Models/operations/reveal_operation.dart';
import 'package:insured/Models/operations/revelation_penalty.dart';
import 'package:insured/Models/operations/transaction_operation.dart';
import 'package:insured/state_management/appstate.dart';
import 'package:insured/ui/widgets/operationview/activation_operation_view.dart';
import 'package:insured/ui/widgets/operationview/baking_operation.dart';
import 'package:insured/ui/widgets/operationview/ballotview.dart';
import 'package:insured/ui/widgets/operationview/delegation_view.dart';
import 'package:insured/ui/widgets/operationview/double_baker.dart';
import 'package:insured/ui/widgets/operationview/endorsements.dart';
import 'package:insured/ui/widgets/operationview/nonce_revalation.dart';
import 'package:insured/ui/widgets/operationview/origination_operation.dart';
import 'package:insured/ui/widgets/operationview/proposal.dart';
import 'package:insured/ui/widgets/operationview/reveal_operation.dart';
import 'package:insured/ui/widgets/operationview/revelation.dart';
import 'package:insured/ui/widgets/operationview/transaction_opration.dart';

class OperationsView extends StatelessWidget {
  const OperationsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppState.instance.getSelectedAccountOperations().isEmpty) {
      return Center(child: Text('NO Operations found on this account'));
    }
    return Column(
      children: [
        for (var operation in AppState.instance.getSelectedAccountOperations())
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getView(operation),
          )
      ],
    );
  }

  Widget getView(Operation o) {
    if (o.getType == ActivationOperation.type) {
      return ActivationOperationView(
        operation: o,
      );
    }
    if (o.getType == BakingOperation.type) {
      return BakingView(
        operation: o,
      );
    }

    if (o.getType == BallotOperation.type) return BallotView(operation: o);

    if (o.getType == DelegateAccount.type) {
      return DelegationView(
        operation: o,
      );
    }

    if (o.getType == DoubleBakingOperation.type) {
      return DoubleBakerView(
        operation: o,
      );
    }

    if (o.getType == EndorsementOperation.type) {
      return EndorsementsView(
        operation: o,
      );
    }

    if (o.getType == NonceRevelationOperation.type) {
      return NonceRevelationView(
        operation: o,
      );
    }
    if (o.getType == OriginationOperation.type) {
      return OriginationView(
        operation: o,
      );
    }
    if (o.getType == ProposalOperation.type) {
      return ProposalView(
        operation: o,
      );
    }

    if (o.getType == RevealOperation.type) {
      return RevealView(
        operation: o,
      );
    }
    if (o.getType == RevelationPenaltyOperation.type) {
      return RevelationView(operation: o);
    }
    if (o.getType == TransactionOperation.type) {
      return TransactionView(
        operation: o,
      );
    }
  }
}
