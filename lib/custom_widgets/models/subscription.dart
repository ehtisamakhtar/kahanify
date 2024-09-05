/// id : 12
/// name : "audio monthly"
/// Description : "this is audio monthly pckage \r\nvery nice package"
/// Permissions : "2"
/// image : "packages/2vd5DzBuYayprvUvXQYDImGUQdlYWR97tcThlhhR.jpg"
/// price : 300
/// validity : "quarter"
/// created_at : "2024-09-04T04:37:27.000000Z"
/// updated_at : "2024-09-04T04:37:27.000000Z"

class Subscription {
  Subscription({
      num? id, 
      String? name, 
      String? description, 
      String? permissions, 
      String? image, 
      num? price, 
      String? validity, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _description = description;
    _permissions = permissions;
    _image = image;
    _price = price;
    _validity = validity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Subscription.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['Description'];
    _permissions = json['Permissions'];
    _image = json['image'];
    _price = json['price'];
    _validity = json['validity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _permissions;
  String? _image;
  num? _price;
  String? _validity;
  String? _createdAt;
  String? _updatedAt;
Subscription copyWith({  num? id,
  String? name,
  String? description,
  String? permissions,
  String? image,
  num? price,
  String? validity,
  String? createdAt,
  String? updatedAt,
}) => Subscription(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  permissions: permissions ?? _permissions,
  image: image ?? _image,
  price: price ?? _price,
  validity: validity ?? _validity,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get permissions => _permissions;
  String? get image => _image;
  num? get price => _price;
  String? get validity => _validity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['Description'] = _description;
    map['Permissions'] = _permissions;
    map['image'] = _image;
    map['price'] = _price;
    map['validity'] = _validity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}