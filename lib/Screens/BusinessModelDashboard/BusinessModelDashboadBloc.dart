import 'package:bloc/bloc.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcOverviewDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcCustomerDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMarketDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMoneyDashboard.dart';
import 'package:iventure001/Screens/BusinessModelDashboard/BcMetricsDashboard.dart';

enum ConceptDashboardEvents {
  overviewClicked,
  customerClicked,
  strategyClicked,
  moneyClicked,
  metricsClicked
}

abstract class ConceptDashboardStates {}


class BcConceptDashboardNavigationBloc extends Bloc<ConceptDashboardEvents, ConceptDashboardStates> {
  @override
  ConceptDashboardStates get initialState => BcOverviewDashboard();

  @override
  Stream<ConceptDashboardStates> mapEventToState(
      ConceptDashboardEvents event) async* {
    switch (event) {
      case ConceptDashboardEvents.overviewClicked:
        yield BcOverviewDashboard();
        break;
      case ConceptDashboardEvents.customerClicked:
        yield BcCustomerDashboard();
        break;
      case ConceptDashboardEvents.strategyClicked:
        yield BcMarketStrategy();
        break;
      case ConceptDashboardEvents.moneyClicked:
        yield BcMoneyDashboard();
        break;
      case ConceptDashboardEvents.metricsClicked:
        yield BcMetricsDashboard();
        break;
    }
  }
}
