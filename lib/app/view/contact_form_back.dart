import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:primeiro_app/app/domain/entities/contact.dart';
import 'package:primeiro_app/app/domain/services/contact_service.dart';


class ContactFormBack{
  Contact contact;
  var _service = GetIt.I<ContactService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _phoneIsValid;

  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  //Diferenciar novo com alteração
  ContactFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null)?Contact() : parameter;
  }

  //Salvar
  save(BuildContext context) async{
    await _service.save(contact);
    Navigator.of(context).pop();
  }

  //Validações
  String validateName(String name){
    try{
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    }catch(e){
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateEmail(String email){
    try{
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    }catch(e){
      _emailIsValid = false;
      return e.toString();
    }
  }

String validatePhone(String phone){
  try{
    _service.validatePhone(phone);
    _phoneIsValid = true;
    return null;
  }catch(e){
    _phoneIsValid = false;
    return e.toString();
  }
}
  
}
