import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_consumer_event.dart';
part 'bloc_consumer_state.dart';

class BlocConsumerBloc extends Bloc<BlocConsumerEvent, BlocConsumerState> {
  BlocConsumerBloc() : super(BlocConsumerInitial()) {
    on<BlocConsumerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
