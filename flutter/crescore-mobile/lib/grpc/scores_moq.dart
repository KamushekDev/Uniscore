class ScoresMoq {
  Future<int> homeMethod() {
    return Future<int>.delayed(const Duration(milliseconds: 600), () => 1);
  }
}
