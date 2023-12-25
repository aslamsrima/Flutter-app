import 'package:mockito/annotations.dart';
import 'package:the_character_viewer/data/data_sources/remote_data_source.dart';
import 'package:the_character_viewer/domain/repositories/character_repository.dart';
import 'package:http/http.dart' as http;
import 'package:the_character_viewer/domain/usecases/get_characters.dart';

@GenerateMocks(
  [CharacterRepository, CharacterRemoteDataSource, GetCharactersUseCase],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
