# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
 email: 'admin@example.com',
 password: 'password',
 )

users = User.create!(
  [
    {email: 'kaneki@example.com', user_name: 'kaneki', password: 'password',gender: 0, birth_date: '1998-10-13', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.jpg")},
    {email: 'koto@example.com', user_name: 'koto', password: 'password',gender: 1, birth_date: '2003-12-13'},
    {email: 'ai@example.com', user_name: 'ai', password: 'password',gender: 2, birth_date: '1888-12-24'},
    {email: 'rize@example.com', user_name: 'rize', password: 'password',gender: 1, birth_date: '2000-10-15'},
    {email: 'kyan@example.com', user_name: 'kyan', password: 'password',gender: 1, birth_date: '1999-12-16'},
    {email: 'tom@example.com', user_name: 'tom', password: 'password',gender: 0, birth_date: '1997-01-10'},
    {email: 'jery@example.com', user_name: 'jery', password: 'password',gender: 0, birth_date: '1995-02-19'},
    {email: 'ann@example.com', user_name: 'ann', password: 'password',gender: 1, birth_date: '1980-03-13'},
    {email: 'peco@example.com', user_name: 'peco', password: 'password',gender: 2, birth_date: '1975-04-17'},
    {email: 'aaa@example.com', user_name: 'aaa', password: 'password',gender: 2, birth_date: '2005-05-20'},
    {email: 'yu@example.com', user_name: 'yu', password: 'password',gender: 2, birth_date: '2003-06-22'},
    {email: 'boss@example.com', user_name: 'boss', password: 'password',gender: 1, birth_date: '2002-07-24'},
    {email: 'takopi@example.com', user_name: 'takopi', password: 'password',gender: 1, birth_date: '2001-08-25'},
    {email: 'ngu@example.com', user_name: 'ngu', password: 'password',gender: 0, birth_date: '2001-09-26'},
    {email: 'takoyaki@example.com', user_name: 'takoyaki', password: 'password',gender: 1, birth_date: '2003-10-22'},
  ]
)

Book.create!(
 [
   {isbn: "2100013393637", title: "【全巻セット】アオアシ　1〜31巻セット", author: "小林有吾/上野直彦", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3637/2100013393637.jpg", item_url: "https://books.rakuten.co.jp/rb/17440771/"},
   {isbn: "9784592187981", title: "花ざかりの君たちへ（12）愛蔵版", author: "中条比紗也", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5921/59218798.jpg", item_url: "https://books.rakuten.co.jp/rb/4487274/"},
   {isbn: "9784099430450", title: "タッチ完全復刻版BOX（1）", author: "あだち 充", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0450/9784099430450.jpg", item_url: "https://books.rakuten.co.jp/rb/15881062/"},
   {isbn: "9784040705392", title: "この素晴らしい世界に祝福を！　1", author: "渡　真仁/三嶋　くろね", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5392/9784040705392.jpg", item_url: "https://books.rakuten.co.jp/rb/13169596/"},
   {isbn: "9784088705453", title: "この音とまれ！（1）", author: "アミュー", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5453/9784088705453.jpg", item_url: "https://books.rakuten.co.jp/rb/11941877/"},
   {isbn: "2100013431292", title: "【全巻】僕だけがいない街 1-9巻セット", author: "三部　けい", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/1292/2100013431292.jpg", item_url: "https://books.rakuten.co.jp/rb/17480974/"},
   {isbn: "9784088792729", title: "東京喰種（1）", author: "石田スイ", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2729/9784088792729.jpg", item_url: "https://books.rakuten.co.jp/rb/11509360/"},
   {isbn: "9784065177648", title: "転生したらスライムだった件（13）", author: "川上 泰樹/伏瀬", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/7648/9784065177648.jpg", item_url: "https://books.rakuten.co.jp/rb/16128408/"},
   {isbn: "9784065309193", title: "転生したら第七王子だったので、気ままに魔術を極めます　セミカラー版（2）", author: "石沢 庸介/謙虚なサークル", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/9193/9784065309193_1_2.jpg", item_url: "https://books.rakuten.co.jp/rb/17422155/"},
   {isbn: "2100013057713", title: "ゴールデンカムイ 全巻セット(1-31巻)", author: "野田サトル", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/7713/2100013057713.jpg", item_url: "https://books.rakuten.co.jp/rb/17249650/"},
   {isbn: "9784107716835", title: "ウロボロス（14）", author: "神崎裕也", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6835/9784107716835.jpg", item_url: "https://books.rakuten.co.jp/rb/11899601/"},
   {isbn: "2100012500210", title: "鋼の錬金術師 全巻セット(1-27巻)", author: "荒川弘", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0210/2100012500210.jpg", item_url: "https://books.rakuten.co.jp/rb/16870637/"},
   {isbn: "9784086196758", title: "潔く柔く 1", author: "いくえみ 綾", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6758/9784086196758.jpg", item_url: "https://books.rakuten.co.jp/rb/14780952/"},
   {isbn: "9784088442471", title: "月のお気に召すまま 1", author: "木内 ラムネ", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2471/9784088442471.jpg", item_url: "https://books.rakuten.co.jp/rb/16023405/"},
   {isbn: "9784065220061", title: "新装版　頭文字D（8）", author: "しげの 秀一", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/0061/9784065220061.jpg", item_url: "https://books.rakuten.co.jp/rb/16544313/"},
   {isbn: "9784065284209", title: "GTO　パラダイス・ロスト（19）", author: "藤沢 とおる", image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/4209/9784065284209_1_2.jpg", item_url: "https://books.rakuten.co.jp/rb/17179383/"}
 ]
 )

Review.create!(
  [
    {user_id: 1, book_id: 1,
     content:
     "高校サッカーモノが主流の学生漫画の中でユースの状況や環境がわかる作品です。

      プレーの描写だけでなく、
      ひらめき、衝撃、歓喜や落胆などプレーに際した感情表現や変化がとても伝わってくる漫画です。

      また、目線の移り変わりがわかりやすく、
      物語のテーマである「視野」がすごく読み取れるので試合展開が楽しみになります。

      「ジャイキリのETUとユースたちが昇格したエスペリオンが東京ダービーしたら」とか
      「エスペリオンユースと達海が監督の設定のETUユースが戦ったら」
      とか勝手に想像しながら読んでます。",
     rate: 4.0, created_at: '2023-05-20 13:24:01'
    },
    {user_id: 2, book_id: 1,
     content:
     "サッカー好きではない。サッカーもので読んだのは、過去キャプテン翼くらいかな。子供の頃に。だからあまり手が伸びる分野ではないのだけど、なぜかこれは目について気になった。最初は少しだけ試しに？って感じだったのだけど、一転びっくり面白い。ルールや戦術的なことは知らなくても引き寄せられる面白さがあると思います。ひたすらに前進していく姿は勇気をもらえるよね。",
     rate: 5.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "むかーし友人宅で読んでいたのを思い出し、「どういう結末だったっけ…」と気になってしまい読み返す事にしました。

      現実味の無い話が苦手な方はNGかも知れませんが、私の中では個人的TOP3に入るくらい大好きな作品。
      とにかく佐野がカッコイイ！！こんな男前、憧れますね〜♡
      そして中津もイイ漢。
      中条もファン！
      イケメンばっかでキャラの個性も強いので、自分のお気に入りが必ず見つかると思います♡

      単なる恋愛話という訳ではなく、笑いあり・涙ありでとてもグッと来ます。
      人としての優しさとか厳しさ、見えない心の傷、葛藤、そして「人を好きになる」と言う事。
      大人になった今でも色々と考えさせられ、読み終わった後は何だか心が明るくなり、今日…私も頑張ろ！って思えます( ˊ̱˂˃ˋ̱ )",
     rate: 4.0, created_at: '2023-05-17 22:22:22'
    },
    {user_id: 1, book_id: 3,
     content:
     "よい。
      原作でストーリーは知ってるんだけど、それでも感情を揺さぶられる。",
     rate: 4.0, created_at: '2023-05-14 08:25:53'
    },
    {user_id: 6, book_id: 3,
     content:
     "僕は、南ちゃんよりも由加ちゃん派ですから。",
     rate: 3.0, created_at: '2023-05-15 12:40:00'
    },
    {user_id: 2, book_id: 4,
     content:
     "オススメです。アニメ化もしましたが、タイトル見たときはてっきりハーレムのお話だと思って敬遠してました…が、全然違う！純度１００%のギャグだった…（笑）
      うーん…なんかタイトルで絶対損してる気がする(´ｰ｀)
      ポンコツで通称「駄女神」のアクアや変態入ってるダクネスなど…みんないいキャラしていて、いつもドタバタなギャグだらけ（笑）
      特にアクアはおバカだけど良い子で大好きです。なんか回を追うごとにおバカになっていく気がしないでも無いが(´-ω-`)",
     rate: 4.0, created_at: '2023-05-16 17:22:56'
    },
    {user_id: 8, book_id: 5,
     content:
     "アラフォー女ですが、まさかこの年で学園青春モノにハマるとは思いませんでした。笑いあり、涙あり、恋愛ネタ少々あり。高校時代に戻ってもう一回青春やり直したい！と思ってしまったほど。登場人物達の一言にハッとしたり、好きな人の前でぎこちなくなってしまう描写に共感したり、とにかく読んでいて様々な感情が込み上げてきて、年齢関係なく楽しめる作品だと思います。",
     rate: 5.0, created_at: '2023-05-19 14:54:02'
    },
    {user_id: 9, book_id: 5,
     content:
     "学園もので、部活で、青春漫画。

      しかも、元不良が真剣に部活にハマるという、まあまあありがちな話です。

      ですが、部活動が「箏曲部」

      ただ、練習すれば上達するというだけのものじゃなく、人間関係やお家の問題、恋など、部員たちの心の変化や成長とともに、琴の音も変わっていくというのがとても面白いです。",
     rate: 5.0, created_at: '2023-05-13 12:25:43'
    },
    {user_id: 15, book_id: 5,
     content:
     "箏曲部でたった一人になってしまった主人公武蔵が部活として認められる人数を確保しようと訳ありのヤンチャ新入生やその友達、琴の家元の家に生まれ技術はすごいが性格は最悪の美少女に振り回されながら皆と一緒に成長していく物語
      それぞれのキャラクターがとても魅力的でどうしてそうなったのか、何故反発するのか、と背景が丁寧に描かれていて引き込まれます
      琴が龍に見立てて作られていたなんてこの作品で初めて知りました
      身近ではないけれど伝統のある琴の世界に触れることができる素敵な作品なので一人でも多くの方に読んでほしいです",
     rate: 4.0, created_at: '2023-05-18 21:59:18'
    },
    {user_id: 1, book_id: 6,
     content:
     "悶々とした日々が母親の不幸から一転。特殊な能力として自覚しているリバイバルはこの時のために備わったのか？数分前に戻るのが常のその能力のはずが、小学生時代にまで遡った所でもう先が読めない！頭脳は大人(しかも未来の出来事もアレコレ記憶している)身体は子ども、これはもはや無敵なのでは？と期待したものの、真犯人は巧妙に罠を仕掛けてきて…。最後までハラハラドキドキで一気読みしてしまいました。面白かったー！",
     rate: 5.0, created_at: '2023-05-21 23:59:03'
    },
    {user_id: 3, book_id: 7,
     content:
     "まずは表紙で読むタイプの漫画だと思います。
      もともとグロいのが好きで読み始めましたが、キャラにとってもはまります...w
      もちろん戦闘シーンなどはかなり過激ですが...ちなみにアニメのほうはモザイクたっぷりでした。それくらい体はバラバラにされるは、喰べられるはで...

      最初は地味だなーと思っていた主人公の金木君も、かなりの急成長を遂げます。
      この作品のキャラはかなりキャラが個性豊かです。


      東京喰種これで終わり！？っていう方にはぜひ読んでもらいたいのが東京喰種:reです。
      というか、題名が変わったり、キャラが増えたりなだけで、前作の続きでした。",
     rate: 5.0, created_at: '2023-05-11 11:11:03'
    },
    {user_id: 5, book_id: 7,
     content:
     "この物語には、食物連鎖の頂点に君臨する人間と、その人間を喰らう喰種(グール)との間に起こる様々な事件や出来事が描かれています。

      ぱーっとサクサク読んでも十分楽しめます！
      しかし、よくあるアクション漫画・グロい漫画とはちょっと違うのです！

      作者が私たち読者に伝えたいメッセージはとても奥深いと思います。
      食物連鎖の頂点に君臨する私たちが、'生きる' ということは、どういうことか？命とは？

      読めば読むほどハマっていきます！続きが気になって仕方ない、、！",
     rate: 5.0, created_at: '2023-05-14 21:15:13'
    },
    {user_id: 11, book_id: 7,
     content:
     "今までで最高に好きな作品です",
     rate: 5.0, created_at: '2023-05-23 15:53:39'
    },
    {user_id: 13, book_id: 7,
     content:
     "映画化されたり店頭に並んでたりして以前から気になってはいましたが、設定がグロすぎてあまり買う気には慣れなかった作品でした、今回無料分から読み進めてみて、思っていたよりストーリー性もあり、憂いを帯びた登場人物たちのキャラにも魅力を感じました",
     rate: 3.0, created_at: '2023-05-23 10:25:03'
    },
    {user_id: 14, book_id: 7,
     content:
     "読んでみたいなぁと思いつつ、中々読めず、やっと！読み始めました。
      絵や内容が怖くて読めないと思っていましたが、読み始めたら全くそんなことはなく。
      人間とグールの両方から物語が描かれているのが面白いです。",
     rate: 4.0, created_at: '2023-05-01 19:29:08'
    },
    {user_id: 2, book_id: 8,
     content:
     "最初は面白かったんですが、
      共同体が成長していくにつれつまらなくなる不思議な作品…。
      いろんな獲物を狩り、能力を強化し、向かうところ敵なしになった後は配下を増やしレベルアップ…。
      そう、もうやることがないんですよ。
      とってつけたように魔王たちが出てきてちょっと荒れるかと思ったら、スライムの可愛さ共同体の居心地のよさに引き込まれ、仲間化。
      強くてかわいくて、敵はサックリ倒すか自分にメロメロになるか…。
      読み手としてはこんなにつまらないもんないです。
      3巻までは間違いなく面白かった。
      スピンオフなんかしてる場合じゃないよ",
     rate: 2.0, created_at: '2023-05-16 15:56:56'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },
    {user_id: 1, book_id: 2,
     content:
     "",
     rate: 3.0, created_at: '2023-05-17 12:25:03'
    },

  ]
)

Bookmark.create!(
  [
    {user_id:1, book_id: 1}
  ]
)