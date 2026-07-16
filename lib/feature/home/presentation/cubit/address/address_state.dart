import 'package:final_project/feature/home/data/models/address_model.dart';

abstract class AddressState {}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressSuccessState extends AddressState {
  final List<AddressModel> addresses;

  AddressSuccessState(this.addresses);
}

class AddressFailureState extends AddressState {
  final String errorMessage;

  AddressFailureState(this.errorMessage);
}