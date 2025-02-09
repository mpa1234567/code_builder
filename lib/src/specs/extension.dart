// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';

import '../../code_builder.dart';
import '../base.dart';
import '../mixins/annotations.dart';
import '../mixins/dartdoc.dart';
import '../mixins/generics.dart';
import '../visitors.dart';
import 'expression.dart';
import 'field.dart';
import 'method.dart';
import 'reference.dart';

part 'extension.g.dart';

@immutable
abstract class Extension extends Object
    with HasAnnotations, HasDartDocs, HasGenerics
    implements Built<Extension, ExtensionBuilder>, Spec {
  factory Extension([void Function(ExtensionBuilder b) updates]) = _$Extension;

  Extension._();

  @override
  BuiltList<Expression> get annotations;

  @override
  BuiltList<String> get docs;

  // On reference class of an extension is not nullable, just the name
  Reference get on;

  @override
  BuiltList<Reference> get types;

  BuiltList<Method> get methods;
  BuiltList<Field> get fields;

  /// Name of the extension - optional.
  String? get name;

  @override
  R accept<R>(
    SpecVisitor<R> visitor, [
    R? context,
  ]) =>
      visitor.visitExtension(this, context);
}

abstract class ExtensionBuilder extends Object
    with HasAnnotationsBuilder, HasDartDocsBuilder, HasGenericsBuilder
    implements Builder<Extension, ExtensionBuilder> {
  factory ExtensionBuilder() = _$ExtensionBuilder;

  ExtensionBuilder._();

  @override
  ListBuilder<Expression> annotations = ListBuilder<Expression>();

  @override
  ListBuilder<String> docs = ListBuilder<String>();

  late Reference on;

  @override
  ListBuilder<Reference> types = ListBuilder<Reference>();

  ListBuilder<Method> methods = ListBuilder<Method>();
  ListBuilder<Field> fields = ListBuilder<Field>();

  /// Name of the extension - optional.
  String? name;
}
