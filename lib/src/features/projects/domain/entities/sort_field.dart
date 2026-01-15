enum ProjectSortField {
  createdAt,
  updatedAt,
  title,
  budget,
  startDate,
  endDate,
}

enum SortOrder { asc, desc }

class ProjectFilter {
  final ProjectSortField sortField;
  final SortOrder sortOrder;
  final int? limit;
  final int? offset;
  final int? agencyId; 
  final int? ministryId;
  final int? stateId; 
  final bool? isSynced;
  final DateTime? startDate;
  final DateTime? endDate;

  const ProjectFilter({
    this.sortField = ProjectSortField.createdAt,
    this.sortOrder = SortOrder.desc,
    this.limit = 100,
    this.offset = 0,
    this.agencyId,
    this.ministryId,
    this.stateId,
    this.isSynced,
    this.startDate,
    this.endDate,
  });

  ProjectFilter copyWith({
    ProjectSortField? sortField,
    SortOrder? sortOrder,
    int? limit,
    int? offset,
    int? agencyId,
    int? ministryId,
    int? stateId,
    bool? isSynced,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ProjectFilter(
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      agencyId: agencyId ?? this.agencyId,
      ministryId: ministryId ?? this.ministryId,
      stateId: stateId ?? this.stateId,
      isSynced: isSynced ?? this.isSynced,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}

