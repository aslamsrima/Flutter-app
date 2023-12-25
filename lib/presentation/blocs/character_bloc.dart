import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_characters.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase _getCharactersUseCase;

  CharacterBloc(this._getCharactersUseCase) : super(CharacterEmpty()) {
    on<FetchCharactersEvent>((event, emit) async {
      emit(CharacterLoading());
      final result = await _getCharactersUseCase.execute();
      result.fold((failure) {
        emit(CharacterFailure(failure.message));
      }, (data) {
        emit(CharacterLoaded(data));
      });
    });
  }
}
