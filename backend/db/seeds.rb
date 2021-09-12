user_list = [
  [
    "のぶやん", 
    "こんにちは、のぶやんです。
    全国のマラソン大会に参加しています。
    いつかは47都道府県全てのマラソン大会に参加したいです。
    
    目指せ全国統一！！"
  ], 
  [
    "信玄",
    "ランニングを始めて２年目の初心者です。

    ダイエット目的で始めたランニングでしたが、
    今ではすっかりランニング好きに！
    ゆっくりマイペースに頑張ってます。"
  ],
  [
    "すぎちゃん",
    "学生時代からサッカーをしていて、今もやっています。
    週末は近所をランニングしています。"
  ],
  [
    "秀吉",
    "朝ラン専門です。

    職場が皇居付近ということで早朝皇居ランニングをやっています。"
  ], 
  [
    "徳さん",
    "トライアスロンを始めて2年目
    週3回くらい、マイペースに競技を楽しんでいます。
    荒川あたりをサイクリングしているので、近くにいる方一緒にはしりましょう！！"
  ], 
  [
    "あけちっち",
    "一児の父
    最近は育児が落ち着いてきたので、練習再開！！
    
    まずは突き出たお腹を引っ込めるべく、ランニングメインでやっていきます。
    水泳とバイク練もやりたいな〜"
  ],
  [
    "ゴエモン",
    "サイクリングメインですが、トライアスロンに興味があります。"
  ],
  [
    "三成", 
    "横浜在住。
    三浦半島をよくサイクリングしています。
    "
  ],
  [
    "小次郎",
    "神奈川県西エリアに住んでいます。
    一年前にまあまあ大きな膝の怪我をしました。
    復帰後のリハビリで始めたランニング、無理をしないで、徐々に自分のペースでいきます。"
  ],
  [
    "Run丸",
    "多摩川ランナー、ひたすらラン
    ランランラン~"
  ]
]
n=0
user_list.each do |name, profile|
  User.create!(
    name: name, email: "test-#{n+1}@example.com", 
    password: "password-#{n+1}", password_confirmation: "password-#{n+1}",
    icon: Rails.root.join("app/assets/images/user/icon/image-#{n+1}.jpg").open,
    birth_year: "198#{n}", birth_month: "#{n+1}", birth_day: "#{10+n}",
    sex: "男性", profile: profile
  )
  n += 1
end

user_name_list = ["イッチー", "ねね", "おくに"]
user_name_list.each_with_index do |name, n|
  User.create!(
    name: name, email: "test-#{n+11}@example.com", 
    password: "password-#{n+11}", password_confirmation: "password-#{n+11}",
    icon: Rails.root.join("app/assets/images/user/icon/image-#{n+11}.jpg").open,
    birth_year: "198#{n+5}", birth_month: "#{n+1}", birth_day: "#{10+n}",
    sex: "女性"
  )
end

User.create!(
  name: "ゲストユーザー", email: "guest-user123@example.com", 
  password: "guest_password", password_confirmation: "guest_password",
  icon: Rails.root.join("app/assets/images/user/icon/image-14.jpg").open,
  birth_year: "1990", birth_month: "5", birth_day: "10",
  sex: "男性",
  profile: "こんにちは、トライアスロン好きな30代、男です。
  平日に関しては職場から皇居が近いので、出社前に皇居を走っています。
  週末はロードバイクで遠征に行くことが多いです。
  多摩川や尾根幹線を走ることが多いので、近くにお住まいの方はぜひ一緒に練習したいです。
  
  それからスイムは最近サボり気味なので、一緒に練習できる仲間を募集しております。"
)

Plan.create!(
  user_id: 1, 
  title: "スカイツリー見ながら隅田川ランニング", 
  detail: "ランナーの皆さんこんにちは。走っていますか？

  両国駅あたりをスタートして浅草方向に片道5km（往復10km）を予定しています。
  スカイツリーを横目に6:00m/kmくらいでゆったりと！

  一緒にいかがでしょうか？", 
  start_ymd: "2021-10-21", start_time: "2000-01-01 18:00:00", 
  duration: "1", 
  event_cls: "Run", 
  train_strength: "fun", 
  place: "両国駅付近", 
  prefecture: "東京都", 
  join_limit: 5
)

Plan.create!(
  user_id: 2, 
  title: "横浜みなとみらいナイトランニング", 
  detail: "こんにちは、みなさん楽しくランニングしていますか。
  まだまだ暑い日が続いて、ランニングが億劫なっていませんか？
  
  なので日が暮れて少し涼しくなる頃に、みなとみらい周辺をランニングしようと計画しています。
  横浜のランナーあつまれ～！一緒に走りましょう！", 
  start_ymd: "2021-09-25", start_time: "2000-01-01 19:30:00", 
  duration: "1", 
  event_cls: "Run", 
  train_strength: "fun", 
  place: "みなとみらい駅", 
  prefecture: "神奈川県", 
  join_limit: 5
)

Plan.create!(
  user_id: 4, 
  title: "早朝、皇居ランニング！！！", 
  detail: "出社前に一汗かきませんか？？
  最近のランニングのモチベーションが下がっていて、
  一緒にトレーニングできる仲間を探しています。
  
  練習内容としては皇居2周10kmを予定しています。
  スピードは5:30~6:00m/kmくらいを想定しています。
  
  ともに頑張る市民ランナーの方々、朝活しましょう！", 
  start_ymd: "2021-10-21", start_time: "2000-01-01 07:30:00", 
  duration: "1", 
  event_cls: "Run", 
  train_strength: "fun", 
  place: "竹橋駅付近", 
  prefecture: "東京都", 
  join_limit: 5
)

Plan.create!(
  user_id: 5, 
  title: "荒川サイクリングロードを一緒に走りませんか？", 
  detail: "こんにちは徳さんです。
  9月21日に荒川サイクリングロードを一緒に走ってくれる方を募集しています。
  河口からスタートして片道20km往復40kmくらいを目安にサイクリングしようかと計画しています。
  河川敷の緑を感じながらゆったりと走りたいです。
  
  ぜひ一緒にサイクリングしましょう！！", 
  start_ymd: "2021-09-21", start_time: "2000-01-01 09:00:00", 
  duration: "1", 
  event_cls: "Bike", 
  train_strength: "fun", 
  place: "北千住駅　北口", 
  prefecture: "東京都", 
  join_limit: 5
)

Plan.create!(
  user_id: 6, 
  title: "仕事終わりにサクッとスイム", 
  detail: "仕事終わりに新宿で水泳の練習しませんか？
  特に何をするわけでもありませんが、もくもくと練習しましょう。

  最近モチベーションが下がっているので、ぜひ練習仲間になってくれる方募集しています。
  ぜひ一緒に練習しましょう！", 
  start_ymd: "2021-09-25", start_time: "2000-01-01 19:30:00", 
  duration: "1", 
  event_cls: "Swim", 
  train_strength: "fun", 
  place: "新宿コズミックスポーツセンター", 
  prefecture: "東京都", 
  join_limit: 5
)

Plan.create!(
  user_id: 8, 
  title: "三浦半島一周サイクリング！！", 
  detail: "三浦半島の海岸線をぐるり一周ともにはしりませんか？
  三浦半島は変化に富んだ地形で、海岸や程よい高さの眺めのよい丘が連続するコースです。
  お昼は三崎マグロ丼を食べてエネルギー補修しましょう！
  150キロの長丁場になりますの、完走の自信がある方ぜひ一緒にはサイクリングしましょう！", 
  start_ymd: "2021-10-02", start_time: "2000-01-01 09:00:00", 
  duration: "6", 
  event_cls: "Bike", 
  train_strength: "hard", 
  place: "横浜駅　南口", 
  prefecture: "神奈川県", 
  join_limit: 5
)

Plan.create!(
  user_id: 10, 
  title: "多摩川ハーフマラソン企画", 
  detail: "こんにちはRun丸です。
  最近マラソン大会もあまり開催されず、練習のモチベーションが下げっていませんか？
  ということで、プチマラソン大会を企画します！
  小田急線の登戸あたりをスタートして河口向かって走り、往復21キロのコース。
  個人企画なので、水分補給などは個人で行っていただく形になります。
  よろしくお願いします！", 
  start_ymd: "2021-10-02", start_time: "2000-01-01 09:00:00", 
  duration: "3", 
  event_cls: "Run", 
  train_strength: "fun", 
  place: "小田急線　登戸駅", 
  prefecture: "神奈川県", 
  join_limit: 15
)

Plan.create!(
  user_id: 14, 
  title: "皇居を一緒に走りましょう！", 
  detail: "サクッと一周5キロ走りませんか？
  平日の9時という微妙な時間ですが、都合の合う方一緒にどうですか？", 
  start_ymd: "2021-10-04", start_time: "2000-01-01 09:00:00", 
  duration: "1", 
  event_cls: "Run", 
  train_strength: "fun", 
  place: "皇居　桜田門", 
  prefecture: "東京都", 
  join_limit: 3
)

Plan.create!(
  user_id: 14, 
  title: "多摩川サイクリング！", 
  detail: "多摩川サイクリングを企画しています！
  二子玉川を出発して羽村市あたりまで走ります。（70キロくらい）
  ", 
  start_ymd: "2021-10-09", start_time: "2000-01-01 09:00:00", 
  duration: "4", 
  event_cls: "Bike", 
  train_strength: "fun", 
  place: "二子玉川駅", 
  prefecture: "東京都", 
  join_limit: 3 
)

plan_1 = Plan.find(1)
plan_1.joins.create(
  [
    { user_id: 5 },
    { user_id: 8 },
    { user_id: 9 },
    { user_id: 14 }
  ]
)

plan_1.message.create(
  [
    {user_id: 14, content: "参加します！！"},
    {user_id: 1, content: "おっ！ありがとうございます！"},
    {user_id: 14, content: "具体的にどの辺りに集まりますか？"},
    {user_id: 1, content: "両国駅横のNewDays前にしましょう！よろしくお願いします。"},
  ]
)

plan_2 = Plan.find(2)
plan_2.joins.create(
  [
    { user_id: 5 },
    { user_id: 4 },
    { user_id: 11 },
    { user_id: 12 }
  ]
)
plan_2.message.create(
  [
    {user_id: 3, content: "ナイトランいいですね〜"},
    {user_id: 1, content: "くそー近かったら参加したかったです！"},
    {user_id: 2, content: "今度は皇居あたりで練習開催しますね！"},
    {user_id: 1, content: "その時は参加させてもらいますね！！"},
  ]
)

plan_3 = Plan.find(3)
plan_3.joins.create(
  [
    { user_id: 1 },
    { user_id: 14 }
  ]
)

plan_5 = Plan.find(5)
plan_5.joins.create(
  [
    { user_id: 13 },
    { user_id: 14 }
  ]
)
plan_5.message.create(
  [
    {user_id: 14, content: "職場が新宿で近いので、参加させてください！よろしくお願いします！"},
    {user_id: 6, content: "参加ありがとうございます。"},
    {user_id: 5, content: "プール混んでます？"},
    {user_id: 6, content: "最近は空いてることが多い気がします！"},
  ]
)

plan_7 = Plan.find(7)
plan_7.joins.create(
  [
    { user_id: 1 },
    { user_id: 2 },
    { user_id: 3 },
    { user_id: 5 },
    { user_id: 11 },
    { user_id: 12 },
    { user_id: 13 },
    { user_id: 14 }
  ]
)
plan_7.message.create(
  [
    {user_id: 10, image: Rails.root.join("app/assets/images/message/image-1.png").open},
    {user_id: 10, content: "↑この辺りをスタートします！"},
    {user_id: 10, content: "気軽にメッセージください！"},
    {user_id: 8, content: "いいですね、参加させてください！"},
    {user_id: 14, content: "自分も参加します！よろしくお願いします！"},
  ]
)

plan_8 = Plan.find(8)
plan_8.joins.create(
  [
    { user_id: 4 },
    { user_id: 5 },
    { user_id: 11 },
    { user_id: 12 },
  ]
)
plan_8.message.create(
  [
    {user_id: 4, content: "朝ラン仲間です。一緒に走りたいです！"},
    {user_id: 14, content: "こちらこそ、よろしくお願いします！"},
    {user_id: 4, content: "お手柔にお願いしますね〜"},
  ]
)

plan_9 = Plan.find(9)
plan_9.joins.create(
  [
    { user_id: 10 },
    { user_id: 9 },
  ]
)
plan_9.message.create(
  [
    {user_id: 14, content: "多摩川のサイクリングロードは道幅が狭いので募集は3人までとします。"},
    {user_id: 14, content: "よろしくお願いします。"},
    {user_id: 10, content: "確かに道狭いですよね。ランなら参加したかった、、"},
    {user_id: 14, content: "また、企画しますね！"},
    {user_id: 12, content: "参加したいです！遅いですが、大丈夫でしょうか？"},
    {user_id: 14, content: "メッセージありがとうございます！大丈夫ですよ。私も遅いので！笑"},
  ]
)
Relationship.create!(
  [
    {user_id: 1, follow_id: 2},
    {user_id: 1, follow_id: 3},
    {user_id: 1, follow_id: 7},
    {user_id: 1, follow_id: 10},
    {user_id: 1, follow_id: 14},
  ]
)

Relationship.create!(
  [
    {user_id: 2, follow_id: 1},
    {user_id: 2, follow_id: 4},
    {user_id: 2, follow_id: 8},
    {user_id: 2, follow_id: 11},
    {user_id: 2, follow_id: 14},
  ]
)

Relationship.create!(
  [
    {user_id: 3, follow_id: 1},
    {user_id: 3, follow_id: 2},
    {user_id: 3, follow_id: 3},
    {user_id: 3, follow_id: 5},
    {user_id: 3, follow_id: 6},
    {user_id: 3, follow_id: 8},
    {user_id: 3, follow_id: 14},
  ]
)

Relationship.create!(
  [
    {user_id: 4, follow_id: 2},
    {user_id: 4, follow_id: 14},
  ]
)

Relationship.create!(
  [
    {user_id: 5, follow_id: 9},
    {user_id: 5, follow_id: 12},
    {user_id: 5, follow_id: 11},
    {user_id: 5, follow_id: 10},
    {user_id: 5, follow_id: 14},
  ]
)


Relationship.create!(
  [
    {user_id: 6, follow_id: 9},
    {user_id: 6, follow_id: 14},
  ]
)

Relationship.create!(
  [
    {user_id: 7, follow_id: 9},
    {user_id: 7, follow_id: 14},
  ]
)

Relationship.create!(
  [
    {user_id: 8, follow_id: 3},
    {user_id: 8, follow_id: 4},
    {user_id: 8, follow_id: 10},
    {user_id: 8, follow_id: 14},
    {user_id: 8, follow_id: 12},
    {user_id: 8, follow_id: 13},
  ]
)

Relationship.create!(
  [
    {user_id: 9, follow_id: 3},
    {user_id: 9, follow_id: 4},
    {user_id: 9, follow_id: 10},
    {user_id: 9, follow_id: 14},
    {user_id: 9, follow_id: 12},
    {user_id: 9, follow_id: 13},
  ]
)

Relationship.create!(
  [
    {user_id: 10, follow_id: 3},
    {user_id: 10, follow_id: 4},
    {user_id: 10, follow_id: 11},
    {user_id: 10, follow_id: 14},
    {user_id: 10, follow_id: 12},
    {user_id: 10, follow_id: 13},
  ]
)

Relationship.create!(
  [
    {user_id: 14, follow_id: 3},
    {user_id: 14, follow_id: 4},
    {user_id: 14, follow_id: 5},
    {user_id: 14, follow_id: 6},
    {user_id: 14, follow_id: 7},
    {user_id: 14, follow_id: 8},
    {user_id: 14, follow_id: 11},
    {user_id: 14, follow_id: 10},
    {user_id: 14, follow_id: 12},
    {user_id: 14, follow_id: 13},
  ]
)

Interest.create!(
  [
    {user_id: 1, plan_id: 2},
    {user_id: 5, plan_id: 2},
    {user_id: 7, plan_id: 2},
  ]
)

Interest.create!(
  [
    {user_id: 2, plan_id: 1},
    {user_id: 6, plan_id: 1},
    {user_id: 8, plan_id: 1},
  ]
)

Interest.create!(
  [
    {user_id: 2, plan_id: 3},
    {user_id: 3, plan_id: 3},
    {user_id: 4, plan_id: 3},
  ]
)

Interest.create!(
  [
    {user_id: 14, plan_id: 4},
    {user_id: 13, plan_id: 4},
    {user_id: 12, plan_id: 4},
  ]
)
Interest.create!(
  [
    {user_id: 14, plan_id: 5},
    {user_id: 13, plan_id: 5},
    {user_id: 12, plan_id: 5},
  ]
)
Interest.create!(
  [
    {user_id: 2, plan_id: 8},
    {user_id: 13, plan_id: 8},
    {user_id: 12, plan_id: 8},
  ]
)
Interest.create!(
  [
    {user_id: 1, plan_id: 9},
  ]
)




