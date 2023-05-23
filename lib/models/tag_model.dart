

class TagModel{

  String? id;
  String? title;



  TagModel({
    required this.id ,
    required this.title ,


});

  TagModel.fromJson(Map<String , dynamic>element){
    id=element["id"];
    title=element["title"];

  }


}

// "id": "1",
// "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
// "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
// "cat_id": "1",
// "cat_name": "اخبار و مقالات",
// "author": "بهرام امینی",
// "view": "2007",
// "status": "1",
// "created_at": "۱۴۰۱/۲/۱۶"