import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  CredentialCubit() : super(CredentialInitial());
}
