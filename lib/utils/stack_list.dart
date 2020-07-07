import 'dart:collection';

class StackList<T> {
  final ListQueue<T> _list = ListQueue();

  StackList({T init}) {
    if (init != null) push(init);
  }

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;

  void push(T e) => _list.addLast(e);

  T pop() {
    if (isEmpty) return null;

    final T last = _list.last;
    _list.removeLast();
    return last;
  }

  T get top => isEmpty ? null : _list.last;

  void clear() => _list.clear();
}
