import 'package:devtoys/domain/helpers/encoders/encoder.dart';

import '../tool.dart';

abstract class EncoderTool implements Tool{

  final Encoder encoder;

  EncoderTool(this.encoder);
}