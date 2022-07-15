import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eccomerce_bloc/data/models/paymeny_method_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentLoading()) {
    on<LoadPaymentMethod>(_onLoadPaymentMethod);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
  }

  Future<void> _onLoadPaymentMethod(
      LoadPaymentMethod event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    try {
      emit(PaymentLoaded());
    } catch (error) {
      print(error);
    }
  }

  Future<void> _onSelectPaymentMethod(
      SelectPaymentMethod event, Emitter<PaymentState> emit) async {
    try {
      emit(PaymentLoaded(paymentMethod: event.paymentMethod));
    } catch (error ) {
      print(error);
    }
  }
}
