// // ignore_for_file: inference_failure_on_instance_creation, inference_failure_on_function_invocation

// import 'dart:io';

// import 'package:core/core.dart';
// import 'package:database/src/isar/isar.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../../isar_common.dart';

// class _TestIsarDao extends IsarDao<TestLocalEntity> {
//   const _TestIsarDao({super.isar});
// }

// void main() async {
//   await Isar.initializeIsarCore(download: true);
//   TestWidgetsFlutterBinding.ensureInitialized();

//   group('default isar instance', () {
//     late Isar isar;

//     setUp(() async {
//       final dir = Directory.systemTemp;

//       isar = await Isar.open([TestLocalEntitySchema], directory: dir.path);
//     });

//     tearDown(() async {
//       await isar.close(deleteFromDisk: true);
//     });

//     test('should use default isar instance', () async {
//       const dao = _TestIsarDao();
//       final result = await dao.createOrUpdate(TestLocalEntity()).run();

//       final r = result.getRight().toNullable();
//       expect(r?.localId, 1);
//       expect(r?.name, '');
//     });
//   });

//   group('Random Isar instance', () {
//     late Isar isar;
//     late IsarDao<TestLocalEntity> dao;

//     setUp(() async {
//       final dir = Directory.systemTemp;

//       isar = await Isar.open([TestLocalEntitySchema],
//           name: const Uuid().v4(), directory: dir.path);
//       dao = _TestIsarDao(isar: isar);
//     });

//     tearDown(() async {
//       await isar.close(deleteFromDisk: true);
//     });

//     group('createOrUpdate', () {
//       test('should create a new entity', () async {
//         final entity = TestLocalEntity()..name = 'test';
//         final result = await dao.createOrUpdate(entity).run();

//         final r = result.getRight().toNullable();
//         expect(r?.localId, 1);
//         expect(r?.name, 'test');
//       });

//       test('should update an existing entity', () async {
//         final entity1 = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test 1';
//         await dao.createOrUpdate(entity1).run();

//         final entity2 = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test 2';
//         final result = await dao.createOrUpdate(entity2).run();

//         final r = result.getRight().toNullable();
//         expect(r?.localId, 1);
//         expect(r?.name, 'test 2');
//       });

//       test('should create a new entity with a specified id', () async {
//         final entity = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test';
//         final result = await dao.createOrUpdate(entity).run();

//         final r = result.getRight().toNullable();
//         expect(r?.localId, 1);
//         expect(r?.name, 'test');
//       });
//     });

//     group('createOrUpdateAll', () {
//       test('should create all entities when they have no ids set', () async {
//         final entities = List.generate(
//           10,
//           (index) => TestLocalEntity()..name = 'test $index',
//         );
//         await dao.createOrUpdateAll(entities).run();
//         final all = await dao.findAll(includeSoftDeleted: false).get().run();

//         final r = all.getRight().toNullable();
//         expect(r, hasLength(10));
//         expect(
//           r?.map((e) => e.localId).toSet(),
//           {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
//         );
//       });

//       test('should update all entities with set ids', () async {
//         final entities = [
//           TestLocalEntity()..name = 'test 3',
//           TestLocalEntity()
//             ..localId = 5
//             ..name = 'test 5',
//           TestLocalEntity()..name = 'test 1',
//         ];
//         await dao.createOrUpdateAll(entities).run();
//         final all = await dao.findAll(includeSoftDeleted: false).get().run();

//         final r = all.getRight().toNullable();
//         expect(r, hasLength(3));
//         expect(
//           r,
//           unorderedEquals([
//             TestLocalEntity()
//               ..localId = 1
//               ..name = 'test 3',
//             TestLocalEntity()
//               ..localId = 5
//               ..name = 'test 5',
//             TestLocalEntity()
//               ..localId = 6
//               ..name = 'test 1',
//           ]),
//         );
//       });
//     });

//     group('deleteById', () {
//       test("should return not found if the entity doesn't exists", () async {
//         final result = await dao
//             .deleteById(const TestId(localId: 1), softDelete: true)
//             .run();

//         expect(result, const Left<Failure, Unit>(Failures.notFound));
//       });

//       test('should delete entity', () async {
//         final entity = TestLocalEntity()..localId = 1;
//         await dao.createOrUpdate(entity).run();

//         final deleteResult = await dao
//             .deleteById(const TestId(localId: 1), softDelete: true)
//             .run();
//         final byId = await dao
//             .findById(const TestId(localId: 1), includeSoftDeleted: false)
//             .get()
//             .run();

//         expect(deleteResult, const Right<Failure, Unit>(unit));
//         expect(byId, const Left<Failure, TestLocalEntity>(Failures.notFound));
//       });
//     });

//     group('getAll', () {
//       test('should return empty list when no entities exist', () async {
//         final result = await dao.findAll(includeSoftDeleted: false).get().run();

//         final r = result.getRight().toNullable();
//         expect(r, isNotNull);
//         expect(r, isEmpty);
//       });

//       test('should return all entities', () async {
//         final entities = List.generate(
//           10,
//           (index) => TestLocalEntity()
//             ..localId = index
//             ..name = 'test $index',
//         );
//         await dao.createOrUpdateAll(entities).run();
//         final result = await dao.findAll(includeSoftDeleted: false).get().run();

//         final r = result.getRight().toNullable();
//         expect(r, unorderedEquals(entities));
//       });
//     });

//     group('getById', () {
//       test("should return notFound when the entity doesn't exist", () async {
//         final result = await dao
//             .findById(const TestId(localId: 1), includeSoftDeleted: false)
//             .get()
//             .run();

//         result.match(
//           (l) => expect(l, Failures.notFound),
//           (r) => fail('should not be right'),
//         );
//       });

//       test('should return entity', () async {
//         final entity = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test';
//         await dao.createOrUpdate(entity).run();
//         final result = await dao
//             .findById(const TestId(localId: 1), includeSoftDeleted: false)
//             .get()
//             .run();

//         result.match(
//           (l) => fail('should not be left'),
//           (r) => expect(
//               r,
//               TestLocalEntity()
//                 ..localId = 1
//                 ..name = 'test'),
//         );
//       });
//     });

//     group('watchAll', () {
//       test('should emit empty list when no entities exist', () async {
//         final result =
//             await dao.findAll(includeSoftDeleted: false).watch().first;

//         expect(result.getRight().toNullable(), isEmpty);
//       });

//       test('should emit all entities', () async {
//         final entities = List.generate(
//           10,
//           (index) => TestLocalEntity()
//             ..localId = index
//             ..name = 'test $index',
//         );
//         await dao.createOrUpdateAll(entities).run();
//         final stream = dao.findAll(includeSoftDeleted: false).watch();

//         expect(
//           stream.map((event) => event.getRight().toNullable()),
//           emits(equals(entities)),
//         );
//       });

//       test('should update when collection changes', () async {
//         final expectation = expectLater(
//           dao
//               .findAll(includeSoftDeleted: false)
//               .watch()
//               .map((event) => event.getRight().toNullable()),
//           emitsInOrder([
//             isEmpty,
//             equals([
//               TestLocalEntity()
//                 ..localId = 1
//                 ..name = 'test 1',
//               TestLocalEntity()
//                 ..localId = 2
//                 ..name = 'test 2',
//             ]),
//             equals([
//               TestLocalEntity()
//                 ..localId = 1
//                 ..name = 'test 1',
//               TestLocalEntity()
//                 ..localId = 2
//                 ..name = 'test 2',
//               TestLocalEntity()
//                 ..localId = 3
//                 ..name = 'test 3',
//             ]),
//             equals([
//               TestLocalEntity()
//                 ..localId = 2
//                 ..name = 'test 2',
//               TestLocalEntity()
//                 ..localId = 3
//                 ..name = 'test 3',
//             ]),
//           ]),
//         );

//         await dao.createOrUpdateAll([
//           TestLocalEntity()
//             ..localId = 1
//             ..name = 'test 1',
//           TestLocalEntity()
//             ..localId = 2
//             ..name = 'test 2',
//         ]).run();
//         await dao
//             .createOrUpdate(TestLocalEntity()
//               ..localId = 3
//               ..name = 'test 3')
//             .run();
//         await dao.deleteById(const TestId(localId: 1), softDelete: true).run();

//         await expectation;
//       });
//     });

//     group('watchById', () {
//       test("should emit notFound when the entity doesn't exist", () async {
//         final result = await dao
//             .findById(const TestId(localId: 1), includeSoftDeleted: false)
//             .watch()
//             .first;

//         expect(result, const Left(Failures.notFound));
//       });

//       test('should emit entity', () async {
//         final entity = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test';
//         await dao.createOrUpdate(entity).run();

//         final stream = dao
//             .findById(const TestId(localId: 1), includeSoftDeleted: false)
//             .watch();

//         expect(stream, emits(Right(entity)));
//       });

//       test('should emit entity when it is updated', () async {
//         final expectation = expectLater(
//           dao
//               .findById(const TestId(localId: 1), includeSoftDeleted: false)
//               .watch(),
//           emitsInOrder([
//             const Left(Failures.notFound),
//             Right(TestLocalEntity()
//               ..localId = 1
//               ..name = 'test'),
//             Right(TestLocalEntity()
//               ..localId = 1
//               ..name = 'updated'),
//           ]),
//         );

//         final entity = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test';
//         await dao.createOrUpdate(entity).run();

//         final updatedEntity = TestLocalEntity()
//           ..localId = 1
//           ..name = 'updated';
//         await dao.createOrUpdate(updatedEntity).run();

//         await expectation;
//       });

//       test('should emit notFound after entity is deleted', () async {
//         final expectation = expectLater(
//           dao
//               .findById(const TestId(localId: 1), includeSoftDeleted: false)
//               .watch(),
//           emitsInOrder([
//             const Left(Failures.notFound),
//             Right(TestLocalEntity()
//               ..localId = 1
//               ..name = 'test'),
//             const Left(Failures.notFound),
//           ]),
//         );

//         final entity = TestLocalEntity()
//           ..localId = 1
//           ..name = 'test';
//         await dao.createOrUpdate(entity).run();
//         await dao.deleteById(const TestId(localId: 1), softDelete: true).run();

//         await expectation;
//       });
//     });

//     group('replaceAll', () {
//       test('should emit new entity on replace', () async {
//         await dao.createOrUpdate(TestLocalEntity()).run();

//         final expectation = expectLater(
//           dao
//               .findById(const TestId(localId: 1), includeSoftDeleted: false)
//               .watch(),
//           emitsInOrder([
//             Right(TestLocalEntity()..localId = 1),
//             Right(TestLocalEntity()
//               ..localId = 1
//               ..name = 'test 1'),
//           ]),
//         );

//         await dao.replaceAll([
//           TestLocalEntity()
//             ..localId = 1
//             ..name = 'test 1',
//         ]).run();

//         await expectation;
//       });
//     });
//   });

//   group('Isar instance closed', () {
//     late IsarDao<TestLocalEntity> dao;

//     setUp(() {
//       dao = const _TestIsarDao();
//     });

//     test('createOrUpdate should return Failures.database', () async {
//       final result = await dao
//           .createOrUpdate(TestLocalEntity()
//             ..localId = 1
//             ..name = '')
//           .run();

//       result.match(
//         (l) => expect(l, Failures.database),
//         (r) => fail('should not be right'),
//       );
//     });

//     test('createOrUpdateAll should return Failures.database', () async {
//       final result = await dao.createOrUpdateAll([
//         TestLocalEntity()
//           ..localId = 1
//           ..name = ''
//       ]).run();

//       result.match(
//         (l) => expect(l, Failures.database),
//         (r) => fail('should not be right'),
//       );
//     });

//     test('deleteById should return Failures.database', () async {
//       final result = await dao
//           .deleteById(const TestId(localId: 1), softDelete: true)
//           .run();

//       result.match(
//         (l) => expect(l, Failures.database),
//         (r) => fail('should not be right'),
//       );
//     });

//     test('getAll should return Failures.database', () async {
//       final result = await dao.findAll(includeSoftDeleted: false).get().run();

//       result.match(
//         (l) => expect(l, Failures.database),
//         (r) => fail('should not be right'),
//       );
//     });

//     test('getById should return Failures.database', () async {
//       final result = await dao
//           .findById(const TestId(localId: 1), includeSoftDeleted: false)
//           .get()
//           .run();

//       result.match(
//         (l) => expect(l, Failures.database),
//         (r) => fail('should not be right'),
//       );
//     });

//     test('watchById should return Failures.database', () async {
//       final result = dao
//           .findById(const TestId(localId: 1), includeSoftDeleted: false)
//           .watch();

//       expect(
//         result,
//         emits(const Left<Failure, TestLocalEntity>(Failures.database)),
//       );
//     });
//   });
// }
