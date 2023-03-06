class ResurceViewModel<T> {
  final List<T> items;
  final int currentPage, totalPage;

  ResurceViewModel(
      {this.items = const [], this.currentPage = 1, this.totalPage = 1});
}
