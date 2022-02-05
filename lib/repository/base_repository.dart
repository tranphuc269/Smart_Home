import 'dart:async';

import 'package:api_example_app/model/base_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepositoryInterface {
  int get timeoutInterval;

  Future<String> create(BaseEntity entity);

  Future<void> createByDocumentId(BaseEntity entity, String documentId);

  Future<void> updateByDocumentId(BaseEntity entity, String documentId);

  Future<void> deleteByDocumentId(String documentId);

  Future<List<T>> getAll<T extends BaseEntity>(T Function(dynamic e) convert);

  Future<List<T>> getByListDatas<T extends BaseEntity>(
      String key, List<dynamic> datas, T Function(dynamic e) convert);

  Future<T> getByDocumentId<T extends BaseEntity>(
      String documentId, T Function(dynamic e) convert);

  Future<List<T>> getByKeyValue<T extends BaseEntity>(
      String key, String value, T Function(dynamic e) convert);

  Future<List<T>> getByPageAndOrderKey<T extends BaseEntity>(
      int page, int per, String orderKey, T Function(dynamic e) convert);
}

///
class BaseRepository extends BaseRepositoryInterface {
  ///
  BaseRepository({this.collectionName});

  @override
  int get timeoutInterval => 15;

  String collectionName;

  DocumentSnapshot _lastDocumentSnapShot;

  final _firestore = FirebaseFirestore.instance;

  @override
  Future<String> create(BaseEntity entity) async {
    final data = entity.beforeCreate();
    final document = await _firestore.collection(collectionName).add(data);
    return document.id;
  }

  @override
  Future<void> createByDocumentId(BaseEntity entity, String documentId) async {
    await _firestore
        .collection(collectionName)
        .doc(documentId)
        .set(entity.beforeCreate());
  }

  @override
  Future<void> updateByDocumentId(BaseEntity entity, String documentId) async {
    await _firestore
        .collection(collectionName)
        .doc(documentId)
        .update(entity.beforeUpdate());
  }

  @override
  Future<void> deleteByDocumentId(String documentId) async {
    await _firestore.collection(collectionName).doc(documentId).delete();
  }

  @override
  Future<List<T>> getAll<T extends BaseEntity>(T Function(dynamic e) convert) {
    final refs = _firestore.collection(collectionName);
    return _getDocuments(refs, convert);
  }

  @override
  Future<List<T>> getByListDatas<T extends BaseEntity>(
      String key, List<dynamic> datas, T Function(dynamic e) convert) async {
    dynamic keyPath;
    if (key == null) {
      keyPath = FieldPath.documentId;
    } else {
      keyPath = key;
    }
    // if(datas.length <= 10){
    //   final refs =
    //   _firestore.collection(collectionName).where(keyPath, whereIn: datas);
    //   return _getDocuments(refs, convert);
    // }
    final distinctDatas = datas.toSet().toList();
    final List<Future<List<T>>> listQuery = [];
    for (int i = 0; i < distinctDatas.length; i += 10) {
      final refs = _firestore.collection(collectionName).where(keyPath,
          whereIn: distinctDatas
              .getRange(
                  i,
                  i + 10 > distinctDatas.length
                      ? i + (distinctDatas.length % 10)
                      : i + 10)
              .toList());
      final query = _getDocuments(refs, convert);
      listQuery.add(query);
    }
    final arrayResults = await Future.wait(listQuery);
    final result = arrayResults.expand((element) => element).toList();
    return result;
  }

  @override
  Future<T> getByDocumentId<T extends BaseEntity>(
      String documentId, T Function(dynamic e) convert) {
    final ref = _firestore.collection(collectionName).doc(documentId);
    return _getDocument<T>(ref, convert);
  }

  @override
  Future<List<T>> getByKeyValue<T extends BaseEntity>(
      String key, String value, T Function(dynamic e) convert) {
    final ref =
        _firestore.collection(collectionName).where(key, isEqualTo: value);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getByContainIn<T extends BaseEntity>(String key, String value,
      String orderKey, T Function(dynamic e) convert) async {
    final ref =
        _firestore.collection(collectionName).where(key, arrayContains: value);
    // .orderBy(orderKey, descending: false);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getByContainInWithKey<T extends BaseEntity>(
      String key,
      String value,
      String key2,
      dynamic value2,
      String orderKey,
      T Function(dynamic e) convert) async {
    final ref = _firestore
        .collection(collectionName)
        .where(key, arrayContains: value)
        .where(key2, isEqualTo: value2)
        .orderBy(orderKey, descending: true);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getByTwoKeyOrderBy<T extends BaseEntity>(
      String key,
      String value,
      String key2,
      String value2,
      String orderKey,
      T Function(dynamic e) convert) async {
    final ref = _firestore
        .collection(collectionName)
        .where(key, isEqualTo: value)
        .where(key2, isEqualTo: value2)
        .orderBy(orderKey, descending: true);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getOneKeyOrderByTwoKey<T extends BaseEntity>(
      String key,
      dynamic value,
      String orderKey1,
      String orderKey2,
      T Function(dynamic e) convert) async {
    final ref = _firestore
        .collection(collectionName)
        .where(key, isEqualTo: value)
        .orderBy(orderKey1, descending: true)
        .orderBy(orderKey2, descending: true);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getByTwoKey<T extends BaseEntity>(String key, String value,
      String key2, String value2, T Function(dynamic e) convert) async {
    final ref = _firestore
        .collection(collectionName)
        .where(key, isEqualTo: value)
        .where(key2, isEqualTo: value2);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getByKeyValueOrder<T extends BaseEntity>(String key,
      String value, String orderKey, T Function(dynamic e) convert) {
    final ref = _firestore
        .collection(collectionName)
        .where(key, isEqualTo: value)
        .orderBy(orderKey, descending: true);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getByKeyDynamicValueOrder<T extends BaseEntity>(String key,
      dynamic value, String orderKey, T Function(dynamic e) convert) {
    final ref = _firestore
        .collection(collectionName)
        .where(key, isEqualTo: value)
        .orderBy(orderKey, descending: true);
    return _getDocuments(ref, convert);
  }

  Future<List<T>> getLimit<T extends BaseEntity>(
      String key,
      String value,
      String orderKey,
      bool isFirst,
      int limitCount,
      T Function(dynamic e) convert) {
    if (isFirst) {
      _lastDocumentSnapShot = null;
    }

    if (_lastDocumentSnapShot != null) {
      final ref = _firestore
          .collection(collectionName)
          .where(key, isEqualTo: value)
          .orderBy(orderKey, descending: true)
          .startAfterDocument(_lastDocumentSnapShot)
          .limit(limitCount);
      return _getDocuments(ref, convert);
    } else {
      final ref = _firestore
          .collection(collectionName)
          .where(key, isEqualTo: value)
          .orderBy(orderKey, descending: true)
          .limit(limitCount);
      return _getDocuments(ref, convert);
    }
  }

  Future<List<T>> getLimitWithOnlyOrderKey<T extends BaseEntity>(
      String orderKey,
      bool isFirst,
      int limitCount,
      T Function(dynamic e) convert) {
    if (isFirst) {
      _lastDocumentSnapShot = null;
    }

    if (_lastDocumentSnapShot != null) {
      final ref = _firestore
          .collection(collectionName)
          .orderBy(orderKey, descending: true)
          .startAfterDocument(_lastDocumentSnapShot)
          .limit(limitCount);
      return _getDocuments(ref, convert);
    } else {
      final ref = _firestore
          .collection(collectionName)
          .orderBy(orderKey, descending: true)
          .limit(limitCount);
      return _getDocuments(ref, convert);
    }
  }

  Future<List<T>> getFilter<T extends BaseEntity>(String key, dynamic value,
      String filterKey, dynamic filterValue, T Function(dynamic e) convert) {
    final ref = _firestore
        .collection(collectionName)
        .where(key, isEqualTo: value)
        .where(filterKey, isEqualTo: filterValue);
    return _getDocuments(ref, convert);
  }

  @override
  Future<List<T>> getByPageAndOrderKey<T extends BaseEntity>(
      int page, int per, String orderKey, T Function(dynamic e) convert) {
    final ref = _firestore
        .collection(collectionName)
        .startAt([page]).endAt([page + per]).orderBy(orderKey);
    return _getDocuments(ref, convert);
  }

  Future<T> _getDocument<T extends BaseEntity>(
      DocumentReference ref, T Function(dynamic e) convert) async {
    try {
      final snapShot = await ref
          .get()
          .timeout(Duration(seconds: timeoutInterval), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      final listObj = _decode<T>(snapShot, convert);
      return listObj;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<List<T>> _getDocuments<T extends BaseEntity>(
      Query ref, T Function(dynamic e) convert) async {
    try {
      final snapShot = await ref
          .get()
          .timeout(Duration(seconds: timeoutInterval), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      final listObj =
          snapShot.docs.map((document) => _decode(document, convert)).toList();
      return listObj;
    } catch (e) {
      rethrow;
    }
  }

  T _decode<T extends BaseEntity>(DocumentSnapshot document, T convert(e)) {
    try {
      final dynamic json = document.data();
      if (json == null) {
      } else {
        json['id'] = document.id;
        return convert(json);
      }
    } on Exception catch (e) {}
  }
}
