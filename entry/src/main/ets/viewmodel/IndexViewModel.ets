
import ItemData from '../bean/ItemData';

/**
 * 将数据绑定到组件并提供接口
 */
export class IndexViewModel {

  /**
   * 获取轮播图数据
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.fig1'),
      $r('app.media.fig2'),
      $r('app.media.fig3'),
      $r('app.media.fig4')
    ]
    return swiperImages
  }

  /**
   * 获取第一个网格数据
   */
  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData('我的最爱', $r('app.media.love')),
      new ItemData('历史记录', $r('app.media.record')),
      new ItemData('消息', $r('app.media.message')),
      new ItemData('购物车', $r('app.media.shopping')),
      new ItemData('我的目标', $r('app.media.target')),
      new ItemData('圈子', $r('app.media.circle')),
      new ItemData('收藏', $r('app.media.favorite')),
      new ItemData('回收站', $r('app.media.recycle'))
    ]
    return firstGridData
  }


  /**
   * 获取第二个网格数据
   */
  getSecondGridData(): Array<ItemData> {
    let secondGridData: ItemData[] = [
      new ItemData('排行榜', $r('app.media.top'), '当前热品尽在掌握'),
      new ItemData('新品首发', $r('app.media.new'), '最新潮牌，马上发布'),
      new ItemData('大牌闪购', $r('app.media.brand'), '更多大牌敬请期待'),
      new ItemData('发现好物', $r('app.media.found'), '更多内容等您探索')
    ]
    return secondGridData
  }


  /**
   * 获取设置列表数据
   */
  getSettingListData(): Array<ItemData> {
    let settingListData: ItemData[] = [
      new ItemData('推送通知', $r('app.media.news'), '开关'),
      new ItemData('数据管理', $r('app.media.data'), null),
      new ItemData('菜单设置', $r('app.media.menu'), null),
      new ItemData('关于', $r('app.media.about'), null),
      new ItemData('清除缓存', $r('app.media.storage'), null),
      new ItemData('隐私协议', $r('app.media.privacy'), null)
    ]
    return settingListData
  }
}

export default new IndexViewModel()