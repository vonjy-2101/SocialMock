import 'package:flutter/material.dart';
import 'package:flutter_api_clean_architecture/domain/entities/user_entity.dart';
import 'package:flutter_api_clean_architecture/domain/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {

    final UserRepository _user;
    UserProvider(this._user);

    bool _isLoading = false;
    List<UserEntity> _usersList = [];
    String? _error;

    bool get isLoading => _isLoading;
    List<UserEntity> get usersList => _usersList;

    Future<void> fetchAllUser() async
    {
        _isLoading = true;
        notifyListeners();
        try{
            _usersList = await _user.getAllUser();
            _error = null;  
        }catch(e)
        {
            _error = e.toString();
        }finally{
            _isLoading = false;
            notifyListeners();
        }
    }

}