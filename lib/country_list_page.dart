import 'package:flutter/material.dart';
import 'country_detail_page.dart';

class CountryListPage extends StatefulWidget {
  @override
  State<CountryListPage> createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {

  // 검색 컨트롤러
  final TextEditingController _searchController = TextEditingController();

  // 검색어
  String _searchText = '';

  // 나라 데이터
  final List<Map<String, String>> countries = [
    {
      'name': '대한민국',
      'capital': '서울',
      'population': '5,100만 명',
      'continent': '아시아',
      'currency': '원 (KRW)',
      'language': '한국어',
      'image': 'assets/korea.webp',
      'desc': '동아시아에 위치한 나라로, K-POP과 한류 문화, 반도체와 IT 강국으로 세계적으로 유명합니다. 한글이라는 독창적인 문자를 사용합니다.',
    },
    {
      'name': '일본',
      'capital': '도쿄',
      'population': '1억 2,500만 명',
      'continent': '아시아',
      'currency': '엔 (JPY)',
      'language': '일본어',
      'image': 'assets/japan.webp',
      'desc': '아시아 동쪽 섬나라로, 전통 문화와 첨단 기술이 조화를 이루는 나라입니다. 스시, 라멘, 애니메이션으로 유명합니다.',
    },
    {
      'name': '미국',
      'capital': '워싱턴 D.C.',
      'population': '3억 3,100만 명',
      'continent': '북아메리카',
      'currency': '달러 (USD)',
      'language': '영어',
      'image': 'assets/usa.webp',
      'desc': '북아메리카 대륙에 위치한 세계 최대 경제 대국입니다. 다양한 문화와 헐리우드, 실리콘밸리로 유명합니다.',
    },
    {
      'name': '프랑스',
      'capital': '파리',
      'population': '6,700만 명',
      'continent': '유럽',
      'currency': '유로 (EUR)',
      'language': '프랑스어',
      'image': 'assets/france.webp',
      'desc': '서유럽에 위치한 예술과 패션의 나라입니다. 에펠탑, 루브르 박물관, 와인과 치즈로 유명합니다.',
    },
    {
      'name': '브라질',
      'capital': '브라질리아',
      'population': '2억 1,400만 명',
      'continent': '남아메리카',
      'currency': '헤알 (BRL)',
      'language': '포르투갈어',
      'image': 'assets/brazil.webp',
      'desc': '남아메리카 최대 국가로, 삼바 축제와 축구, 아마존 열대우림으로 유명합니다.',
    },
    {
      'name': '호주',
      'capital': '캔버라',
      'population': '2,600만 명',
      'continent': '오세아니아',
      'currency': '호주 달러 (AUD)',
      'language': '영어',
      'image': 'assets/australia.webp',
      'desc': '오세아니아 대륙에 위치한 나라로, 코알라와 캥거루, 시드니 오페라하우스, 그레이트 배리어 리프로 유명합니다.',
    },
  ];

  // 메모리 정리
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    // build() 메서드 안, return Scaffold 위에 넣기
    final filteredCountries = countries.where((country) {
      return country['name']!.contains(_searchText);
    }).toList();
    print('비어있습니까? $filteredCountries.isEmpty}');
    print('검색어 ${_searchText}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🌍 세계 나라 도감',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 검색창
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: '나라 이름을 검색하세요...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchText.isNotEmpty //조건
                    ? IconButton( ///조건이 참일때
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                    _searchText = '';
                    });
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          // 아래에 리스트가 올 자리
// Column의 두 번째 자식
          Expanded(
            child: filteredCountries.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 60, color: Colors.grey[400]),
                  SizedBox(height: 16),
                  Text(
                    '검색 결과가 없습니다',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => CountryDetailPage(
                        name: country['name']!,
                        capital: country['capital']!,
                        population: country['population']!,
                        continent: country['continent']!,
                        currency: country['currency']!,
                        language: country['language']!,
                        image: country['image']!,
                        desc: country['desc']!,
                       ),
                     ),
                   );
                 },
                child: Container(
                  margin: EdgeInsets.only(bottom:16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                         blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // 국기 이미지 (위쪽 모서리만 둥글게)
                ClipRRect(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                ),
                child: Image.asset(
                country['image']!,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
                ),
                ),

                // 텍스트 영역
                Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // 나라 이름
                Text(
                country['name']!,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
                ),
                ),
                SizedBox(height: 4),

                // 수도 + 대륙
                Text(
                '수도: ${country['capital']}  ·  ${country['continent']}',
                style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                ),
                ),
                SizedBox(height: 8),

                // 구분선
                Divider(height: 1),
                SizedBox(height: 8),

                // 설명 미리보기 (최대 1줄)
                Text(
                country['desc']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
                ),
                ),
                ],
                ),
                ),
                ],
                ),
                ),
                );
              },
            ),
          ),

        ],
      ),
      );
  }
}