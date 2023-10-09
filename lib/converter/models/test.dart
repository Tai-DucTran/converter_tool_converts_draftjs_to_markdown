void main() {
  const sample = 'Who we are';
  final list = sample.split('').toList();

  list.add('**');
  final result = list.join();
  print(result.toString());
}
