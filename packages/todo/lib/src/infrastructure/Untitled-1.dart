// import 'package:core/core.dart';
// import 'package:data/src/common/cursor_pagination_resolver.dart';
// import 'package:domain/domain.dart';
// import 'package:network_info/network_info.dart';

// class SectionRepositoryImpl implements SectionRepository {
//   const SectionRepositoryImpl({
//     required this.networkInfo,
//     required this.sectionLocalDataSource,
//     required this.sectionApi,
//   });
//   final NetworkInfo networkInfo;
//   final SectionLocalDataSource sectionLocalDataSource;
//   final SectionApi sectionApi;
//   @override
//   Stream<Either<Failure, Section>> watchSectionById(
//     SectionId sectionId,
//   ) {
//     return sectionLocalDataSource.watchById(sectionId).orElse(
//           (failure) => networkInfo.onlineOrFailure
//               .andThen(() => sectionApi.getSectionById(sectionId))
//               .flatMap(sectionLocalDataSource.createOrUpdate),
//         );
//   }

//   @override
//   Stream<Either<Failure, List<Section>>> watchSectionPathByLastId(
//     SectionId sectionId,
//   ) {
//     Stream<Either<Failure, List<Section>>> watchRecursive(
//       SectionId recursiveSectionId, [
//       List<Section> sections = const [],
//     ]) {
//       return watchSectionById(recursiveSectionId).switchFlatMap(
//         (section) {
//           final newSections = [
//             if (!section.isRoot || sectionId == section.id) section,
//             ...sections,
//           ];
//           return section.parentId.fold(
//             () => Stream.value(right(newSections)),
//             (parentId) => watchRecursive(parentId, newSections),
//           );
//         },
//       );
//     }

//     return watchRecursive(sectionId);
//   }

//   @override
//   TaskEither<Failure, Unit> syncByOrganisationUserId(
//     OrganisationUserId organisationUserRemoteId,
//   ) {
//     return networkInfo.onlineOrFailure
//         .andThen(
//           () => cursorPaginationResolver(
//             (cursor) => sectionApi.getAllSectionsByUser(
//               userId: organisationUserRemoteId,
//               cursor: cursor,
//             ),
//           ),
//         )
//         .flatMap(
//           (sections) => sections.elementAtOrNull(0).fold(
//                 () => tRight(unit),
//                 (first) => sectionLocalDataSource.replaceAllByOrganisationId(
//                   organisationId: first.organisationId,
//                   sections: sections,
//                 ),
//               ),
//         )
//         .map((_) => unit);
//   }

//   @override
//   Stream<Either<Failure, SectionTree>> watchSectionTreeByOrganisationId(
//     OrganisationId organisationId,
//   ) {
//     return sectionLocalDataSource
//         .watchAllByOrganisationId(organisationId)
//         .mapRight(SectionTree.new);
//   }
// }
