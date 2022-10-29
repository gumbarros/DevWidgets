//Based on https://github.com/mrdziuban/sql-formatter/blob/e8065c29af8c8fa4af7318a46b01205f6389e6c9/dart/src/sql_formatter.dart;

import 'package:dev_widgets/src/impl/formatters/sql_formatter/formatter/sql_formatter.dart';
import 'package:dev_widgets/src/impl/helpers.dart';

class T {
  String str;
  List<String> shiftArr;
  String tab;
  List<String> arr;
  int parensLevel;
  int deep;

  T(this.str, this.shiftArr, this.tab, this.arr, this.parensLevel, this.deep);
}

class Out {
  String str;
  int deep;

  Out(this.str, this.deep);
}

class Replacement {
  RegExp pattern;
  String replacement;

  Replacement(this.pattern, this.replacement);
}

class GenericSqlFormatter implements SqlFormatter {
  static const String sep = '~::~';

  @override
  String format(String sql, {int numSpaces = 1}) {
    sql = applyWebSpaceFix(sql);
    String tab = ' ' * numSpaces;
    List<String> splitByQuotes = transformString(sql, [
      (s) => s.replaceAll(RegExp(r'\s+'), ' '),
      (s) => s.replaceAll("'", "$sep'")
    ]).split(sep);
    T input =
        T('', createShiftArr(tab), tab, genArray(splitByQuotes, tab), 0, 0);
    T output = List<int>.generate(input.arr.length, (int i) => i)
        .fold(input, updateOutput);

    return transformString(output.str, [
      (s) => s.replaceAll(RegExp(r'\s+\n'), '\n'),
      (s) => s.replaceAll(RegExp(r'\n+'), '\n'),
      (s) => s.trim()
    ]);
  }

  T updateOutput(T acc, int i) {
    String originalEl = acc.arr[i];
    int parensLevel = subqueryLevel(originalEl, acc.parensLevel);
    List<String> arr = List<String>.from(acc.arr);
    if (originalEl.contains(RegExp('SELECT|SET'))) {
      arr[i] =
          originalEl.replaceAll(RegExp(r'\,\s+'), ',\n${acc.tab}${acc.tab}');
    }
    String el = arr[i];
    Out out = el.contains(RegExp(r'\(\s*SELECT'))
        ? Out('${acc.str}${acc.shiftArr[acc.deep + 1]}$el', acc.deep + 1)
        : Out(
            el.contains("'")
                ? '${acc.str}$el'
                : '${acc.str}${acc.shiftArr[acc.deep]}$el',
            parensLevel < 1 && acc.deep != 0 ? acc.deep - 1 : acc.deep,
          );

    return T(out.str, acc.shiftArr, acc.tab, arr, parensLevel, out.deep);
  }

  String transformString(String str, List<Function> fns) =>
      fns.fold(str, (acc, fn) => fn(acc));

  List<String> createShiftArr(String tab) =>
      List<String>.generate(100, (int i) => '\n${tab * i}');
  List<String> genArray(List<String> splitByQuotes, String tab) {
    return List<List<String>>.generate(
      splitByQuotes.length,
      (int i) => splitIfEven(i, splitByQuotes[i], tab),
    ).expand((x) => x).toList();
  }

  int subqueryLevel(String str, int level) {
    return level -
        (str.replaceAll('(', '').length - str.replaceAll(')', '').length);
  }

  List<Replacement> allReplacements(String tab) {
    return [
      Replacement(RegExp(' AND ', caseSensitive: false), '$sep${tab}AND '),
      Replacement(
        RegExp(' BETWEEN ', caseSensitive: false),
        '$sep${tab}BETWEEN ',
      ),
      Replacement(RegExp(' CASE ', caseSensitive: false), '$sep${tab}CASE '),
      Replacement(RegExp(' ELSE ', caseSensitive: false), '$sep${tab}ELSE '),
      Replacement(RegExp(' END ', caseSensitive: false), '$sep${tab}END '),
      Replacement(RegExp(' FROM ', caseSensitive: false), '${sep}FROM '),
      Replacement(
        RegExp(r' GROUP\s+BY ', caseSensitive: false),
        '${sep}GROUP BY ',
      ),
      Replacement(RegExp(' HAVING ', caseSensitive: false), '${sep}HAVING '),
      Replacement(RegExp(' IN ', caseSensitive: false), ' IN '),
      Replacement(RegExp(' JOIN ', caseSensitive: false), '${sep}JOIN '),
      Replacement(
        RegExp(' CROSS(~::~)+JOIN ', caseSensitive: false),
        '${sep}CROSS JOIN ',
      ),
      Replacement(
        RegExp(' INNER(~::~)+JOIN ', caseSensitive: false),
        '${sep}INNER JOIN ',
      ),
      Replacement(
        RegExp(' LEFT(~::~)+JOIN ', caseSensitive: false),
        '${sep}LEFT JOIN ',
      ),
      Replacement(
        RegExp(' RIGHT(~::~)+JOIN ', caseSensitive: false),
        '${sep}RIGHT JOIN ',
      ),
      Replacement(RegExp(' ON ', caseSensitive: false), '$sep${tab}ON '),
      Replacement(RegExp(' OR ', caseSensitive: false), '$sep${tab}OR '),
      Replacement(
        RegExp(r' ORDER\s+BY ', caseSensitive: false),
        '${sep}ORDER BY ',
      ),
      Replacement(RegExp(' OVER ', caseSensitive: false), '$sep${tab}OVER '),
      Replacement(
        RegExp(r'\(\s*SELECT ', caseSensitive: false),
        '$sep(SELECT ',
      ),
      Replacement(
        RegExp(r'\)\s*SELECT ', caseSensitive: false),
        ')${sep}SELECT ',
      ),
      Replacement(RegExp(' THEN ', caseSensitive: false), ' THEN$sep$tab'),
      Replacement(RegExp(' UNION ', caseSensitive: false), '${sep}UNION$sep'),
      Replacement(RegExp(' USING ', caseSensitive: false), '${sep}USING '),
      Replacement(RegExp(' WHEN ', caseSensitive: false), '$sep${tab}WHEN '),
      Replacement(RegExp(' WHERE ', caseSensitive: false), '${sep}WHERE '),
      Replacement(RegExp(' WITH ', caseSensitive: false), '${sep}WITH '),
      Replacement(RegExp(' SET ', caseSensitive: false), '${sep}SET '),
      Replacement(RegExp(' ALL ', caseSensitive: false), ' ALL '),
      Replacement(RegExp(' AS ', caseSensitive: false), ' AS '),
      Replacement(RegExp(' ASC ', caseSensitive: false), ' ASC '),
      Replacement(RegExp(' DESC ', caseSensitive: false), ' DESC '),
      Replacement(RegExp(' DISTINCT ', caseSensitive: false), ' DISTINCT '),
      Replacement(RegExp(' EXISTS ', caseSensitive: false), ' EXISTS '),
      Replacement(RegExp(' NOT ', caseSensitive: false), ' NOT '),
      Replacement(RegExp(' NULL ', caseSensitive: false), ' NULL '),
      Replacement(RegExp(' LIKE ', caseSensitive: false), ' LIKE '),
      Replacement(RegExp(r'\s*SELECT ', caseSensitive: false), 'SELECT '),
      Replacement(RegExp(r'\s*UPDATE ', caseSensitive: false), 'UPDATE '),
      Replacement(RegExp(r'\s*DELETE ', caseSensitive: false), 'DELETE '),
      Replacement(RegExp('($sep)+'), sep)
    ];
  }

  List<String> splitSql(String str, String tab) {
    return allReplacements(tab).fold(str.replaceAll(RegExp(r'\s+'), ' '),
        (String acc, Replacement r) {
      return acc.replaceAll(r.pattern, r.replacement);
    }).split(sep);
  }

  List<String> splitIfEven(int i, String str, String tab) =>
      i % 2 == 0 ? splitSql(str, tab) : [str];
}
