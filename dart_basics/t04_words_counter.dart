// Task 04

/// Class to count words entrances in collection.
/// Input collections should be iterable strings
class WordsCounter {
  late final Map<String, int> wordMap;
  final Iterable<String> param;

  WordsCounter(this.param){
    Map<String, int> m = {};
    for (var el in param)  m[el] = m.putIfAbsent(el, () => 0) +1;
    wordMap = Map.from(m);
  }
}