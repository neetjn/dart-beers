void main() {
  String v = 'hello world';
  assert(v.length == 11);
  assert(v.startsWith('hello'));
  assert(v.endsWith('world'));
  List<String> h = v.split(' ');
  assert(h.length == 2);
  // string interpolation
  String r = '"${v}" is ${v.length} characters long';
  print(r);
  String t = ' trimmed ';
  assert(t.trim().length == 7);
  assert(t.trimRight().length == 8);
  assert(t.trimLeft().length == 8);
  String m = 'hello' ' world';
  assert(m.length == 11);
  String ml = '''
  this
  is
  a
  multline
  test''';
  print(ml);
}
