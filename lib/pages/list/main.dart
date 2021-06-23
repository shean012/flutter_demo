import 'package:flutter_demo/common/utils/main.dart';

// 列表页页面
class ListPage extends StatelessWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _listCount;

    return Container(

        /// shouldRebuild： 判断是否需要更新
        /// selector：判断需要监听的参数
        /// builder: 组件
        child: Column(
      children: [
        Expanded(
          child: Selector<GoodsList, GoodsList>(
            shouldRebuild: (pre, next) {
              print('_listCount --- $_listCount');
              print('curLength --- ${next.total}');
              return _listCount != next.total;
            },
            selector: (context, listProvider) {
              return listProvider;
            },
            builder: (context, provider, child) {
              _listCount = provider.total;
              print('run build list');
              return ListView.builder(
                  itemCount: provider.total,
                  itemBuilder: (context, index) {
                    return Selector<GoodsList, Goods>(
                        selector: (context, goodProvide) {
                      return goodProvide.goodsList[index];
                    }, builder: (context, goodsData, child) {
                      print('run build item');
                      return GestureDetector(
                          onTap: () => provider.collect(index),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(goodsData.goodsName),
                              Icon(goodsData.isCollection
                                  ? Icons.favorite
                                  : Icons.favorite_border)
                            ],
                          ));
                    });
                  });
            },
          ),
        ),
        SizedBox(height: 5.h),
        Expanded(child:
            Consumer<GoodsList>(builder: (context, GoodsList value, child) {
          return TextButton(
              onPressed: () {
                value.addNewGoods();
              },
              child: Text('加一条商品'));
        }))
      ],
    ));
  }
}
