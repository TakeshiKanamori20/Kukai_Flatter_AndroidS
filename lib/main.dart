import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // AdMob 初期化
  await MobileAds.instance.initialize();
  runApp(const KukaiApp());
}

class KukaiApp extends StatelessWidget {
  const KukaiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '空海の言葉',
      theme: ThemeData(useMaterial3: true),
      home: const QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});
  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final FlutterTts tts = FlutterTts();
  final List<String> quotes = [
    '一切唯心造（いっさいゆいしんぞう）— すべては心がつくる。',
    '即身成仏（そくしんじょうぶつ）— この身のままで悟りに至る。',
    '三密（さんみつ）— 身・口・意を整えることが道となる。',
    '心暗ければ即ち行くところ、みなやみなり。',
    '物の興廃は必ず人に由る。人の昇沈は定めて道にあり。',
  'すべての人は仏の本質を持っている。生きたこの身のままで仏になることができる。',
  '人にとって最大の事は、この身このままで仏になることである。',
  '仏の真実の姿は虚空のようにあまねく広がり、生きとし生けるものの心に応じて現れる。',
  '学ぶことは智慧の芽を育てる種である。',
  '“あ”の一音は、すべてが本来生じないことを示している。',
  '心を清めることによって、本来の智慧が自然に現れてくる。',
  '小さな善も積み重ねれば、大きな功徳となる。',
  '迷いは実体を持たず、心が映し出す影にすぎない。',
  '言葉は心を映す鏡であり、声は仏の光である。',
  'この世のありとあらゆる存在は、一つの大きな命の流れに抱かれている。',
  '善も悪も、心の中に生じては消えていく雲のようなものだ。',
  '知識は器を満たす水であり、智慧はその水を澄ませる光である。',
  '仏を遠くに求めるな、あなたの心が仏である。',
  '真実は言葉の外にあり、しかし言葉を通しても伝わる。',
  '仏の慈悲は尽きることがなく、すべての命に注がれている。',
  '自己を忘れるとき、真の自己に出会う。',
  '虚空に限りがないように、心の広がりにも限りはない。',
  '智慧を求める者は、まず心を柔らかくしなさい。',
  '悟りは突然に現れるものではなく、日々の行いの積み重ねの中にある。',
  '煩悩はそのまま智慧に転ずることができる。',
  '目に見えるものすべてが仏の姿である。',
  '声に耳を澄ませれば、すべてが仏の言葉となる。',
  '一滴の水の中にも大海と同じ真理が宿る。',
  '山川草木に至るまで、仏のいのちが満ちている。',
  '仏の教えは、手を合わせるその瞬間に成就する。',
  '一つの灯火が千の灯をともしても、その光は減らない。',
  '善を行えば、その響きは遠くまで広がる。',
  '仏とは、真理と慈悲の名である。',
  '一人ひとりの心の中に宇宙全体が映っている。',
  '修行とは、すでに備わるものを明らかにする道である。',
  '慈悲は行いの中にあらわれる。',
  '言葉は刃にも薬にもなる。',
  '仏の智慧は、雨が大地を潤すように等しくすべてに注がれる。',
  '心を照らす灯火は、外にはなく内にある。',
  'この世の苦しみは、仏に近づくための道でもある。',
  '一歩進めば一歩分、仏に近づく。',
  '心を縛るものは外ではなく、自らの執着である。',
  '何を見ても仏を感じられるとき、悟りはそこにある。',
  'すべての存在は互いに支えあって生きている。',
  '智慧ある者は、自らを語らず、行いで示す。',
  '心を鎮めれば、宇宙の声が聞こえてくる。',
  '本当の自由は、欲望の果てにはなく、欲望を離れたところにある。',
  '怒りを抱けば、まず自分が焼かれる。',
  '喜びは与えることで倍になり、奪うことで半分になる。',
  '心に仏を描けば、世界は仏の光で満ちる。',
  '己を正すことが世を正す第一歩である。',
  '命あるものすべてが、同じ光の中に生きている。',
  '苦しみは智慧を呼び覚ます鍵となる。',
  '何事も始まりがあれば終わりがある。終わりはまた始まりである。',
  '人は己を忘れるとき、真に大きな存在となる。',
  '慈悲はよわさではなく、最も強い力である。',
  '仏とは遠い彼方にいるのではなく、今ここにいる。',
  '一瞬の心が永遠を映す。',
  '小さな行いが大きな変化を生む。',
  '他人の幸福を願う心が、己の幸福を満たす。',
  '道を歩む者は、常に学び続ける者である。',
  '真の知恵は言葉よりも沈黙に宿る。',
  '心を澄ませば、そこにすでに答えがある。',
  '闇が深ければ深いほど、一つの灯火は輝く。',
  '仏の慈悲は、罪人にも聖人にも等しく注がれる。',
  '迷いは心に映る影であり、影は光があってこそ生じる。',
  '人の心は虚空のように広く、無限に可能性を持つ。',
  '求めよ、さすれば必ず見出すであろう。',
  '耳を澄ませれば、風も川も仏の声となる。',
  '己を知る者は、すでに仏を知る者である。',
  '大きな功徳は、ひとつの念から始まる。',
  '心を縛るのは他人ではなく自分自身である。',
  '真の豊かさは、持つことではなく与えることにある。',
  '道を照らす灯は、すでに自分の内にある。',
  '人の命は限られているが、仏の命は限りない。',
  '善悪は本来空であり、ただ人が分け隔てしているにすぎない。',
  '真の学びは書物の中ではなく、行いの中にある。',
  '智慧は生まれつきではなく、修行の中で育まれる。',
  '仏に祈ることは、己の中の仏に呼びかけることでもある。',
  '一念にすべての宇宙が宿る。',
  '心を見つめることが最も大切な修行である。',
  '自らを変えれば、世界もまた変わる。',
  '真実は常にここにあり、ただ気づいていないだけだ。',
  '仏の光は昼も夜も絶えることがない。',
  '一度の深い気づきが、千年の迷いを晴らす。',
  '真の平和は心の中から始まる。',
  '欲望は満たしても尽きることはない。手放すことでのみ安らぎがある。',
  '怒りを鎮めることが最も勇気ある行いである。',
  '人は生まれながらに仏であり、ただそれを知らぬだけだ。',
  'この世界は幻のようでありながら、同時に真実である。',
  '仏の心を学ぶことは、人の心を学ぶことだ。',
  '道を求める者は、まず自らを省みよ。',
  '言葉よりも行いが真実を示す。',
  '小さな灯があれば、闇は闇でなくなる。',
  '心に光を見出す者は、どこにいても安らぎを得る。',
  'すべての命は互いに影響しあい、離れて存在するものはない。',
  '真理は常にシンプルである。',
  '己の心を澄ませば、宇宙の響きが聞こえてくる。',
  '心を静めることは、千の経を読むことに勝る。',
  '仏の智慧は、すべての人に平等に宿っている。',
  'この瞬間を仏として生きよ。',
  '求めるものは外にあるのではなく、自らの内にある。',
  'すべての存在は光の中で生きている。',
  '心に慈悲を抱けば、世界はやさしく変わる。',
  '悟りとは、特別な境地ではなく日常そのものである。',
  ];
  int idx = 0;
  final _rand = Random();

  // --- AdMob バナー（テスト用ユニットID）---
  BannerAd? _banner;
  final _adUnitId = 'ca-app-pub-3940256099942544/6300978111'; // テスト用

  @override
  void initState() {
    super.initState();
    _initTts();
    _loadBanner();
  }

  Future<void> _initTts() async {
    await tts.setLanguage('ja-JP');
    await tts.setSpeechRate(0.45);
    await tts.setPitch(1.0);
  }

  void _next() {
    setState(() {
      var next = _rand.nextInt(quotes.length);
      if (next == idx && quotes.length > 1) next = (next + 1) % quotes.length;
      idx = next;
    });
  }

  Future<void> _speak() async {
    await tts.stop();
    await tts.speak(quotes[idx]);
  }

  void _share() {
    final text = '【今日の空海の言葉】\n${quotes[idx]}\n#空海 #名言';
    Share.share(text);
  }

  void _loadBanner() {
    final ad = BannerAd(
      adUnitId: _adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _banner = ad as BannerAd),
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          debugPrint('Banner failed to load: $err');
        },
      ),
    );
    ad.load();
  }

  @override
  void dispose() {
    tts.stop();
    _banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = quotes[idx];
    return Scaffold(
      appBar: AppBar(title: const Text('空海の言葉')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/kukai.png"), // ✅ 背景画像
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    q,
                    style: const TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      color: Colors.white, // ✅ 背景に映える文字色
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // シェア & 読み上げ & 次へ
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(onPressed: _speak, child: const Text('読み上げ')),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(onPressed: _share, child: const Text('シェア')),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton(onPressed: _next, child: const Text('次へ')),
                  ),
                ],
              ),
            ),
            // バナー広告（テスト）
            if (_banner != null)
              SizedBox(
                width: _banner!.size.width.toDouble(),
                height: _banner!.size.height.toDouble(),
                child: AdWidget(ad: _banner!),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}