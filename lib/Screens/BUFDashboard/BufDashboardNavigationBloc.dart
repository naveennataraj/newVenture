import 'package:bloc/bloc.dart';
import 'package:iventure001/Screens/BUFDashboard/OverviewDashboard/BufOverviewDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/CustomerDashboard/customerDashboard.dart';
import 'package:iventure001/Screens/BUFDashboard/ProductDashboard/ProductDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/FeedbackDashboard/feedbackDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/NextStepsDashboard/nextStepsDashboard.dart';
import 'package:iventure001/Screens/BUFDashboard/MarketDashboard/BufMarketDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/OverviewDashboard/overViewDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/SolutionDashboard/solutionDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMarketDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMoneyDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMetricsDashboard.dart';

enum BufDashboardEvents {
  overviewClicked,
  customerClicked,
  solutionClicked,
  productClicked,
  strategyClicked,
  feedbackClicked,
  moneyClicked,
  metricsClicked,
  nextStepsClicked
}

abstract class BufDashboardStates {}

class BufDashboardNavigationBloc
    extends Bloc<BufDashboardEvents, BufDashboardStates> {
  @override
  BufDashboardStates get initialState => BufOverviewDashboard();

  @override
  Stream<BufDashboardStates> mapEventToState(
      BufDashboardEvents event) async* {
    switch (event) {
      case BufDashboardEvents.overviewClicked:
        yield BufOverviewDashboard();
        break;
      case BufDashboardEvents.customerClicked:
        yield customerDashBoard();
        break;
      case BufDashboardEvents.solutionClicked:
        yield solutionDashBoard();
        break;
      case BufDashboardEvents.productClicked:
        yield BufProductDashboard();
        break;
      case BufDashboardEvents.strategyClicked:
        yield BUFMarketDashboard();
        break;
      case BufDashboardEvents.feedbackClicked:
        yield feedbackDashBoard();
        break;
      case BufDashboardEvents.moneyClicked:
        yield BcMoneyDashboard();
        break;
      case BufDashboardEvents.metricsClicked:
        yield BcMetricsDashboard();
        break;
      case BufDashboardEvents.nextStepsClicked:
        yield nextStepsDashBoard();
        break;
    }
  }
}
