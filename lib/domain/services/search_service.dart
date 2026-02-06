import '../../data/repositories/customer_repository.dart';
import '../../data/repositories/inspection_repository.dart';
import '../../data/repositories/real_estate_project_repository.dart';
import '../../data/repositories/company_project_repository.dart';
import '../models/customer.dart';
import '../models/inspection.dart';
import '../models/real_estate_project.dart';
import '../models/company_project.dart';

/// Unified search result
class SearchResult {
  final String type;
  final int id;
  final String title;
  final String? subtitle;
  final Map<String, dynamic>? metadata;

  SearchResult({
    required this.type,
    required this.id,
    required this.title,
    this.subtitle,
    this.metadata,
  });
}

class SearchService {
  final CustomerRepository _customerRepo;
  final InspectionRepository _inspectionRepo;
  final RealEstateProjectRepository _realEstateRepo;
  final CompanyProjectRepository _companyRepo;

  SearchService(
    this._customerRepo,
    this._inspectionRepo,
    this._realEstateRepo,
    this._companyRepo,
  );

  /// Global search across all entities
  Future<List<SearchResult>> searchGlobal(String query) async {
    if (query.trim().isEmpty) return [];

    final results = <SearchResult>[];

    // Search in parallel
    final futures = await Future.wait([
      _searchCustomers(query),
      _searchRealEstateProjects(query),
      _searchCompanyProjects(query),
    ]);

    results.addAll(futures[0]);
    results.addAll(futures[1]);
    results.addAll(futures[2]);

    // Sort by relevance (title match first)
    results.sort((a, b) {
      final aExact = a.title.toLowerCase().contains(query.toLowerCase());
      final bExact = b.title.toLowerCase().contains(query.toLowerCase());
      if (aExact && !bExact) return -1;
      if (!aExact && bExact) return 1;
      return a.title.compareTo(b.title);
    });

    return results;
  }

  /// Search customers only
  Future<List<SearchResult>> searchCustomers(String query) async {
    return await _searchCustomers(query);
  }

  /// Search real estate projects only
  Future<List<SearchResult>> searchRealEstateProjects(String query) async {
    return await _searchRealEstateProjects(query);
  }

  /// Search company projects only
  Future<List<SearchResult>> searchCompanyProjects(String query) async {
    return await _searchCompanyProjects(query);
  }

  Future<List<SearchResult>> _searchCustomers(String query) async {
    final customers = await _customerRepo.search(query);
    return customers.map((c) => _customerToResult(c)).toList();
  }

  Future<List<SearchResult>> _searchRealEstateProjects(String query) async {
    final projects = await _realEstateRepo.search(query);
    return projects.map((p) => _realEstateToResult(p)).toList();
  }

  Future<List<SearchResult>> _searchCompanyProjects(String query) async {
    final projects = await _companyRepo.search(query);
    return projects.map((p) => _companyToResult(p)).toList();
  }

  SearchResult _customerToResult(Customer customer) {
    return SearchResult(
      type: 'customer',
      id: customer.id,
      title: customer.customerName,
      subtitle: customer.plotNumber ?? customer.phone,
      metadata: {
        'stage': customer.currentStage,
        'owner': customer.ownerName,
      },
    );
  }

  SearchResult _realEstateToResult(RealEstateProject project) {
    return SearchResult(
      type: 'real_estate_project',
      id: project.id,
      title: project.projectName,
      subtitle: project.currentStatus,
      metadata: {'notes': project.notes},
    );
  }

  SearchResult _companyToResult(CompanyProject project) {
    return SearchResult(
      type: 'company_project',
      id: project.id,
      title: project.projectName,
      subtitle: project.currentStatus,
      metadata: {'notes': project.notes},
    );
  }

  /// Get recent searches (if implemented with local storage)
  Future<List<String>> getRecentSearches() async {
    // TODO: Implement with SharedPreferences or local storage
    return [];
  }

  /// Save search query
  Future<void> saveSearchQuery(String query) async {
    // TODO: Implement with SharedPreferences or local storage
  }

  /// Clear recent searches
  Future<void> clearRecentSearches() async {
    // TODO: Implement with SharedPreferences or local storage
  }

  /// Get search type display name
  String getTypeDisplayName(String type) {
    const types = {
      'customer': 'عميل',
      'real_estate_project': 'مشروع عقاري',
      'company_project': 'مشروع شركة',
      'inspection': 'معاينة',
    };
    return types[type] ?? type;
  }
}
