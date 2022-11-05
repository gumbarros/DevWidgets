import 'package:dev_widgets/src/impl/text/text_inspector/helpers/count_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Text Inspector', () {
    const String lorem =
        "Lorem ipsum dolor sit amet occulte latere uspiam, et velle";
    const String loremWithEmojis =
        "Lorem ipsum dolor sit amet occulte latere uspiam, et velle 🤣";

    const String loremWithParagraphs =
        """Lorem ipsum dolor sit amet viscerum Veneno inbutae taetros cruciatuscient!
    
    Transfer idem ad modestiam veltemperantiam, quae est moderatio Reimer!
    
    Epicurus neque Metrodorus aut quisquam eorum, qui  cogitemus!""";

    test("Count words", () {
      expect(lorem.countWords(), 10);
      expect(loremWithEmojis.countWords(), 10);
    });
    test("Count paragraphs", () {
      expect(lorem.countParagraphs(), 1);
      expect(loremWithParagraphs.countParagraphs(), 3);
    });

    test("Count lines", () {
      expect(lorem.countLines(), 1);
      expect(loremWithParagraphs.countLines(), 5);
    });

    test("Count sentences", () {
      const loremWithOneSentence = """Lorem ipsum dolor sit amet eumque esse quasi communem urbem et civitatem hominum et deorum, et unum quemque nostrum eius mundi esse partem;quoniam rectum factum katyvma - recta igitur effectio, item convenientia, denique ipsum bonum, quod in eo positum est,Atque haec quidem de rerum nominibus.""";
      const loremWithTwoSentences =
          """Lorem ipsum dolor sit amet in aliis satis esse causae, quam ob rem quibusdam anteponerentur, ut in valitudine, ut in integritatean tu me de L. Tubulo putasdicere?""";
      const loremWithFiveSentences = """Lorem ipsum dolor sit amet similem sapientiam esse arbitramur, sed actioni illi potius, quam modo dixi, etvidetur data, itemque et ratio et perfecta ratio. Ut enim histrioni actio, saltatori motus non quivis, sed certusnominata est. Physicae quoque non sine causa tributus idem est honos, propterea quod, qui convenienter naturaeintemperantiam propter se esse fugiendam temperantiamque expetendam, non quia voluptates fugiat, sed quia maioresHuc et illuc, Torquate, vosversetis licet, nihil in hac praeclara epistula scriptum ab Epicurocongruens et conveniensmemoria. 'Sed ad bona praeterita redeamus. Quae si a vobis talia dicerentur, qualibus Caius Marius uti poterat, utsit conliniare hastam aliquo aut sagittam, sicut nos ultimum in bonis dicimus, sic illi facere omnia, quae possit, utames oportet, non mea, si veri amici futuri sumus.""";

      expect(loremWithOneSentence.countSentences(), 1);
      expect(loremWithTwoSentences.countSentences(), 2);
      expect(loremWithFiveSentences.countSentences(), 5);
    });

    test("Count bytes", () {
      expect(lorem.countBytes(), 58);
      expect(loremWithEmojis.countBytes(), 63);
    });
  });
}
