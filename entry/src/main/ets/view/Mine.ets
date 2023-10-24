import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import ItemData from '../bean/ItemData';
import mainViewModel from '../viewmodel/IndexViewModel';

/**
 * 我的
 */
@Component
export default struct Mine {

  //接收传递过来的参数
  @State account: string = router.getParams()?.['account'];

  @Builder settingCell(item: ItemData) {
    Row() {
      Row({ space: 12 }) {
        Image(item.img)
          .width(22)
          .height(22)
        Text(item.title)
          .fontSize(16)
      }

      // 设置功能item最右侧的功能项
      if (item.others === null) {
        //可以进入下一级页面
        Image($r('app.media.right_grey'))
          .width(12)
          .height(24)
      } else {
        //开关
        Toggle({ type: ToggleType.Switch, isOn: false })
      }

    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: 8,
      right: 22
    })
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Column() {
          Text('我的')
            .fontWeight(FontWeight.Medium)
            .fontSize(24)
            .margin({ top: 12 })
            .padding({ left: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        // 个人信息
        Row() {
          Image($r('app.media.account'))
            .width(48)
            .height(48)
          Column() {
            Text(this.account)
              .fontSize(20)
            Text('lonelyxxx@qq.com')
              .fontSize(12)
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 24 })
        }
        .margin({ top: 24 })
        .alignItems(VerticalAlign.Center)
        .width('100%')
        .height(96)
        .backgroundColor(Color.White)
        .padding({ left: 24 })
        .borderRadius(16)

        // 功能列表
        List() {
          ForEach(mainViewModel.getSettingListData(), (item: ItemData) => {
            ListItem() {
              //构建每一个item
              this.settingCell(item)
            }
            .height(48)
          }, (item: ItemData) => JSON.stringify(item))
        }
        .backgroundColor(Color.White)
        .width('100%')
        .height('42%')
        // 为列表增加分隔线
        .divider({
          strokeWidth: 1,
          color: Color.Grey,
          startMargin: 42,
          endMargin: 42
        })
        .borderRadius(16)
        .padding({ top: 4, bottom: 4 })

        Blank()

        Button('退出登录', { type: ButtonType.Capsule })
          .width('90%')
          .height(40)
          .fontSize(16)
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({ bottom: 55 })
          .onClick(() => {
            promptAction.showToast({ message: '退出登录' })
            router.replaceUrl({ url: 'pages/Login' })
          })
      }
      .height('100%')
    }
  }
}



