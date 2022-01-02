import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messanger_app/models/user_model.dart';
import 'package:messanger_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class UsersCubit extends Cubit <UsersStates> {
  UsersCubit() : super(AppInitialState());

  static UsersCubit get(context) => BlocProvider.of(context);
  UserModel? model;

  Database? database;

  // create and open database
  void createDatabase() async {
    openDatabase(
        'user.db',
        version: 1,
        onCreate: (database, version) {
          print('database created');
          database.execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, '
                  'email TEXT, password TEXT, phone TEXT)'
          ).then((value) {
            print('Table Created');
          }).catchError((error) {
            print('Error When Creating Table');
          });
        },

        onOpen: (database) {
          print('database opened');
          // getDataFromDatabase(database);
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  // insert to database
  void insertToDatabase(UserModel model) async {
    await database!.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO users (name, email, password, phone) VALUES ("${model
              .name}", "${model.email}", "${model.password}", "${model
              .phone}")').then((value) {
        print('$value inserted successfully');
        emit(AppInsertDataToDatabaseState());
        // getDataFromDatabase(database!);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  // Get all data from database
  Future login({
    required dynamic email,
    required dynamic pass,
  }) async {
    emit(AppGetDatabaseLoadingState());
    await database!.rawQuery(
        'select * from users where email=? and password=?', [email, pass])
        .then((value) {
      List<Map> result = value;
      if (result.length > 0) {
        print(result.length);
        result.forEach((element) {
          model = UserModel(
              element['name'], element['email'], element['password'],
              element['phone']);
        });
        print(model!.phone);
        emit(AppGetDataFromDatabaseState());
      }
    }).catchError((error){
      print(error.toString());
      emit(AppErrorGettingDatabaseState());
    });
  }

  bool userIsExisted = false;
  Future register({
    required UserModel model
  }) async {
    emit(AppGetDatabaseLoadingState());
    await database!.rawQuery(
        'select * from users where email=? or phone=?', [model.email, model.phone])
        .then((value) {
      List<Map> result = value;
      if (result.length > 0) {
        userIsExisted = true;
        print(result.length);
        emit(AppUserIsExistedState());
      }else{
        insertToDatabase(model);
      }
    });
  }

}
        
    
    

    //database!.rawQuery('select * from users ').then((value) {


      //print(result[0]['email']);

      // value.forEach((element) {
      //   if(element['status'] == 'new')
      //     newTasks.add(element);
      //   else if(element['status'] == 'Done')
      //     doneTasks.add(element);
      //   else archivedTasks.add(element);
      // });

    // database!.query(
    //     "users",
    //   where: "email = ?",
    //   whereArgs: [email]
    // ).then((value) {
    //   print("Done");
    //   print(value.length);
    //   emit(AppGetDataFromDatabaseState());
    // });
  






