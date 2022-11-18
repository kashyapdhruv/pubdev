class Dependencies {
  Dependencies({
      this.meta, 
      this.collection, 
      this.freezedAnnotation, 
      this.stateNotifier,});

  Dependencies.fromJson(dynamic json) {
    meta = json['meta'];
    collection = json['collection'];
    freezedAnnotation = json['freezed_annotation'];
    stateNotifier = json['state_notifier'];
  }
  String? meta;
  String? collection;
  String? freezedAnnotation;
  String? stateNotifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meta'] = meta;
    map['collection'] = collection;
    map['freezed_annotation'] = freezedAnnotation;
    map['state_notifier'] = stateNotifier;
    return map;
  }

}