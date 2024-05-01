class Pagination {
  Pagination({
    allCount = 0,
    page = 0,
    pageSize = 8,
  })  : _allCount = allCount,
        _page = page,
        _pageSize = pageSize;
  final int _allCount;
  int _page;
  final int _pageSize;

  int get allCount => _allCount;

  int get page => _page;

  int get pageSize => _pageSize;

  bool incrementPage() {
    if (pageSize * page + 1 > _allCount) {
      return false;
    }
    _page++;
    return true;
  }

  void decrementPage() {
    _page--;
  }

  Map<String, dynamic> toMap() {
    return {'limit': _pageSize, 'page': page};
  }
}
