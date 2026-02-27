import 'package:flutter/material.dart';
import 'product_detail_pape.dart';

class ProductListPage extends StatelessWidget{

  // Map = 이름표가 붙은 데이터 묶음
  // List<Map> = Map이 여러개 담긴 리스트
  final List<Map<String, String>> products = [
    {
      'name': '무선 이어폰',
      'price': '59,000원',
      'image': 'https://picsum.photos/200/200?random=1',
      'desc': '고품질 사운드를 제공하는 무선 블루투스 이어폰입니다. 노이즈 캔슬링 기능이 탑재되어 있습니다.',
    },
    {
      'name': '스테인리스 텀블러',
      'price': '25,000원',
      'image': 'https://picsum.photos/200/200?random=2',
      'desc': '보온/보냉이 뛰어난 스테인리스 텀블러입니다. 500ml 용량으로 휴대가 편리합니다.',
    },
    {
      'name': '기계식 키보드',
      'price': '89,000원',
      'image': 'https://picsum.photos/200/200?random=3',
      'desc': '적축 스위치가 장착된 기계식 키보드입니다. RGB 백라이트를 지원합니다.',
    },
    {
      'name': '무선 마우스',
      'price': '35,000원',
      'image': 'https://picsum.photos/200/200?random=4',
      'desc': '인체공학 디자인의 무선 마우스입니다. 블루투스와 USB 동글 모두 지원합니다.',
    },
    {
      'name': '노트북 거치대',
      'price': '42,000원',
      'image': 'https://picsum.photos/200/200?random=5',
      'desc': '알루미늄 소재의 노트북 거치대입니다. 각도 조절이 가능하고 접이식이라 휴대가 편합니다.',
    },
    {
      'name': 'USB-C 허브',
      'price': '38,000원',
      'image': 'https://picsum.photos/200/200?random=6',
      'desc': 'USB-A, HDMI, SD카드 등 7개 포트를 지원하는 멀티 허브입니다.',
    },
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '쇼핑 앱',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: (){
              print('검색버튼 클릭');
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            // index번째 상품 데이터 꺼내기
            final product = products[index];

            return Column(
              children: [
                ListTile(
                  // 왼쪽: 상품 이미지 (둥근 모서리)
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:Image.network(
                        product['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      )
                  ),
                  // 가운데: 상품명 + 가격
                  title: Text(
                    product['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    product['price']!,
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 14,
                    ),
                  ),
                  // 오른쪽 화살표 아이콘
                  trailing: Icon(Icons.arrow_forward_ios),

                  // 탭 하면 상세 화면으로 이동
                  onTap: (){
                    // 화면 전환 + 데이터 전달
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailPage(
                          name: product['name']!,
                          price: product['price']!,
                          image: product['image']!,
                          desc: product['desc']!,
                        ))
                    );
                  },
                )
              ],
            );
          }
      ),
    );
  }
}