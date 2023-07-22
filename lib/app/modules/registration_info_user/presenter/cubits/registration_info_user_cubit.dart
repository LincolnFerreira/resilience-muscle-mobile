// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_email_duplicate_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/cubits/registration_info_user_state.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';

import '../../../../../app_cubit.dart';
import '../../../../core/utils/date_format.dart';
import '../../../login/domain/entities/user_entity.dart';

class RegistrationInfoUserCubit extends Cubit<RegistrationInfoUserState> {
  final IsEmailDuplicateUsecase isEmailDuplicateUsecase;
  final CreateNewUserWithEmailUsecase createNewUserWithEmail;
  final CreateCollectionsInfoUserUsecase createCollectionsInfoUserUsecase;
  final AppCubit appCubit;
  final ImagePicker imagePicker;

  late UserEntity userEntity;

  RegistrationInfoUserCubit({
    required this.isEmailDuplicateUsecase,
    required this.createNewUserWithEmail,
    required this.createCollectionsInfoUserUsecase,
    required this.appCubit,
    required this.imagePicker,
  }) : super(const RegistrationInfoUserInitial(pageInitial: 0)) {
    userEntity = appCubit.state.userEntity;
  }

  void onTapButtonContinue() {
    emit(RegistrationInfoUserSuccess(page: state.page! + 1));
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome.';
    }

    final nameRegExp = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegExp.hasMatch(value) || value.length < 3) {
      return 'Por favor, insira um nome válido.';
    }

    return null;
  }

  String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua data de nascimento.';
    }

    // Aqui você pode adicionar a validação específica para a data de nascimento, se necessário

    return null; // Retorna null se o valor for válido
  }

  String? validateWeight(double value) {
    if (value <= 0) {
      return 'Por favor, insira um peso válido.';
    }

    return null; // Retorna null se o valor for válido
  }

  String? validateHeight(double value) {
    if (value <= 0) {
      return 'Por favor, insira uma altura válida.';
    }

    return null; // Retorna null se o valor for válido
  }

  registerInfoUser({
    required String birthDate,
    required double height,
    required String name,
    required double weight,
  }) async {
    emit(const RegistrationInfoUserLoading());

    final convertStringToDate = convertStringToDateTime(birthDate);
    UserInfoEntity userInfo = UserInfoEntity(
      name: name,
      birthDate: convertStringToDate,
      height: height,
      weight: weight,
      image: null,
    );

    try {
      final createCollectionsInfo = await createCollectionsInfoUserUsecase(
        userInfoEntity: userInfo,
        uid: userEntity.uid,
      );
      createCollectionsInfo.fold(
        (failure) {
          emit(const RegistrationInfoUserFailure());
        },
        (createCollections) {
          emit(RegistrationInfoUserSuccess(
            createdNewColumns: createCollections,
            page: 5,
          ));
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<XFile?> getImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  void onTapImageProfile() async {
    final XFile? newImageProfile = await getImage();
    if (newImageProfile != null) {
      return;
    } else {}
  }

  void onTapContinueToTraing() {
    Modular.to
        .pushNamed('/registration_info_user/onboarding_registration_training');
  }
}
