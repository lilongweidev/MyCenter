import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
/**
 * 输入框的通用样式
 */
@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height(45)
  .fontSize(18)
  .backgroundColor($r('app.color.background'))
  .width('100%')
  .padding({ left: 0 })
  .margin({ top: 12 })
}

@Extend(Line) function lineStyle() {
  .width('100%')
  .height(2)
  .backgroundColor($r('app.color.line_color'))
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize(14)
  .fontWeight(FontWeight.Medium)
}

@Entry
@Component
struct Login {
  @State account: string = '';
  @State password: string = '';
  //是否显示加载条
  @State isShowProgress: boolean = false;
  //超时标识
  private timeOutId: number = -1;

  /**
   * 登录
   */
  login(): void {
    if (this.account === '' || this.password === '') {
      //显示Toast
      promptAction.showToast({ message: '账号或密码为空' })
      return
    }
    //内容不为空则显示加载进度条
    this.isShowProgress = true;

    if (this.timeOutId === -1) {
      //设置超时处理，两秒后执行页面跳转到主页
      this.timeOutId = setTimeout(() => {
        this.isShowProgress = false;
        this.timeOutId = -1;
        router.replaceUrl({
          url: 'pages/Index',
          params: {
            account: this.account
          }
        });
      }, 2000);
    }
  }

  /**
   * 组件的生命周期，组件销毁时执行
   */
  aboutToDisappear() {
    console.log('aboutToDisappear')
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }

  build() {
    // 页面纵向布局
    Column() {
      //Logo
      Image($r('app.media.logo'))
        .width(78)
        .height(78)
        .margin({ top: 100, bottom: 16 })
      Text('登录')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      Text('登录帐号以使用更多服务')
        .fontSize(16)
        .fontColor($r('app.color.login_more_text_color'))
        .margin({ top: 16, bottom: 30 })
      //账号输入框
      TextInput({ placeholder: '账号' })
        .maxLength(11)
        .type(InputType.Number)
        .inputStyle()
        .onChange((value: string) => {
          //获取输入的内容
          this.account = value;
        })
      //下划线
      Line().lineStyle()
      //密码输入框
      TextInput({ placeholder: '密码' })
        .maxLength(8)
        .type(InputType.Password)
        .inputStyle()
        .onChange((value: string) => {
          //获取输入的内容
          this.password = value;
        })
      //下划线
      Line().lineStyle()

      Row() {
        Text('短信验证码登录').blueTextStyle()
        Text('忘记密码').blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ top: 8 })
      //登录按钮
      Button('登录', { type: ButtonType.Capsule })
        .width('90%')
        .height(40)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({ top: 80, bottom: 12 })
        .onClick(() => {
          //登录
          this.login();
        })
      Text('注册账号')
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
      //是否显示等待进度条
      if (this.isShowProgress) {
        LoadingProgress()
          .color($r('app.color.loading_color'))
          .width(30)
          .height(30)
          .margin({ top: 20 })
      }
      //空白填充组件，具有自动填充容器空余部分的能力。仅当父组件为Row/Column时生效。
      Blank()
      Text('其他登录方式')
        .fontColor($r('app.color.other_login_text_color'))
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 48, bottom: 12 })
      Row({ space: 44 }) {
        this.imageButton($r('app.media.login_method1'))
        this.imageButton($r('app.media.login_method2'))
        this.imageButton($r('app.media.login_method3'))
      }
    }
    .backgroundColor($r('app.color.background'))
    .height('100%')
    .width('100%')
    .padding({
      left: 12,
      right: 12,
      bottom: 24
    })
  }

  /**
   * 其他登录方式按钮
   * @param src
   */
  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height(48)
    .width(48)
    .backgroundColor($r('app.color.background'))
  }
}