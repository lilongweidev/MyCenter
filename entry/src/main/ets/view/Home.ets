import mainViewModel from '../viewmodel/IndexViewModel';
import ItemData from '../bean/ItemData';

/**
 * 首页
 */
@Component
export default struct Home {

  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column({ space: 12 }) {
        //首页
        Column() {
          Text('首页')
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        //轮播图
        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius(16)
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .margin({ top: 24 })
        .autoPlay(true)
        //第一个网格布局
        Grid() {
          ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width(24)
                  .height(24)
                Text(item.title)
                  .fontSize(12)
                  .margin({ top: 4 })
              }
            }
          }, (item: ItemData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(8)
        .rowsGap(12)
        .padding({ top: 12, bottom: 12 })
        .height(124)
        .backgroundColor(Color.White)
        .borderRadius(24)

        Text('列表')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .margin({ top: 12 })
        //第二个网格布局
        Grid() {
          ForEach(mainViewModel.getSecondGridData(), (secondItem: ItemData) => {
            GridItem() {
              Column() {
                Text(secondItem.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                Text(secondItem.others)
                  .margin({ top: 4 })
                  .fontSize(12)
                  .fontColor($r('app.color.home_grid_fontColor'))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .padding({ top: 8, left: 8 })
            .borderRadius(12)
            .align(Alignment.TopStart)
            .backgroundImage(secondItem.img)
            .backgroundImageSize(ImageSize.Cover)
            .width('100%')
            .height('100%')
          }, (secondItem: ItemData) => JSON.stringify(secondItem))
        }
        .width('100%')
        .height(260)
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap(8)
        .rowsGap(12)
        .margin({ bottom: 55 })
      }
    }
    .height('100%')
  }
}
