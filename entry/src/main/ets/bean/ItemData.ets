/**
 * 列表item数据
 */
export default class ItemData {

  title: Resource|string;
  img: Resource;
  others?: Resource|string;

  constructor(title: Resource|string, img: Resource, others?: Resource|string) {
    this.title = title;
    this.img = img;
    this.others = others;
  }
}