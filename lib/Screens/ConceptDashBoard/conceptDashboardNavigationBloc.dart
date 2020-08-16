import 'package:bloc/bloc.dart';
import 'package:iventure001/Screens/ConceptDashBoard/customerDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/feedbackDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/nextStepsDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/overViewDashboard.dart';
import 'package:iventure001/Screens/ConceptDashBoard/solutionDashboard.dart';

enum ConceptDashboardEvents {
  overviewClicked,
  customerClicked,
  solutionClicked,
  feedbackClicked,
  nextStepsClicked
}

abstract class ConceptDashboardStates {}

class conceptDashboardNavigationBloc
    extends Bloc<ConceptDashboardEvents, ConceptDashboardStates> {
  @override
  ConceptDashboardStates get initialState => overViewDashBoard();

  @override
  Stream<ConceptDashboardStates> mapEventToState(
      ConceptDashboardEvents event) async* {
    switch (event) {
      case ConceptDashboardEvents.overviewClicked:
        yield overViewDashBoard();
        break;
      case ConceptDashboardEvents.customerClicked:
        yield customerDashBoard();
        break;
      case ConceptDashboardEvents.solutionClicked:
        yield solutionDashBoard();
        break;
      case ConceptDashboardEvents.feedbackClicked:
        yield feedbackDashBoard();
        break;
      case ConceptDashboardEvents.nextStepsClicked:
        yield nextStepsDashBoard();
        break;
    }
  }
}
