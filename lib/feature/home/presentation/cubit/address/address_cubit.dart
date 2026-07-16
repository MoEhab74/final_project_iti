import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/feature/home/data/repos/address_repo.dart';
import 'package:final_project/feature/home/presentation/cubit/address/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitialState());


  Future<void> getAllAddresses() async {
    emit(AddressLoadingState());

    final result = await locator<AddressRepo>().getAllAddresses();

    result.fold(
      (error) {
        emit(AddressFailureState(error));
      },
      (addresses) {
        emit(AddressSuccessState(addresses));
      },
    );
  }
}