import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentNotifier extends Notifier<String> {
  @override
  String build() {
    return "No Comment";
  }

  void setComment(String rating) {
    state = rating;
  }
}


final commentNotifierProvider = NotifierProvider<CommentNotifier, String>((){
  return CommentNotifier();
});