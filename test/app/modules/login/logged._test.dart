import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilience_muscle/app/data/datasources/firebase_remote_datasource.dart';
import 'package:resilience_muscle/app/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'package:resilience_muscle/app/data/models/user_model.dart';
import 'package:resilience_muscle/app/data/repositories/get_current_uid_repository_imp.dart';
import 'package:resilience_muscle/app/domain/repositories/get_current_uid_repository.dart';
import 'package:resilience_muscle/app/domain/usecases/get_current_uid/get_current_uid_usecase.dart';
import 'package:resilience_muscle/app/domain/usecases/get_current_uid/get_current_uid_usecase_imp.dart';
import 'package:resilience_muscle/firebase_options.dart';

void main() {
  late GetCurrentUIdUseCaseImp getCurrentUId;
  late GetCurrentUIdRepository getCurrentUIdRepository;
  late FirebaseRemoteDataSource firebaseRemoteDataSource;

  setUp(() async {
    // firebaseRemoteDataSource = FirebaseRemoteDataSourceImp();
    // getCurrentUIdRepository = GetCurrentUIdRepositoryImp(
    // firebaseRemoteDataSource: firebaseRemoteDataSource);
    // getCurrentUId =
    // GetCurrentUIdImp(getCurrentUIdRepository: getCurrentUIdRepository);
  });

  test(
    '',
    () async {},
  );
}
