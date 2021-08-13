FactoryBot.define do
  factory :plan do
    user_id { '1' }
    title { 'こんにちは！一緒に走りませんか！？' }
    detail { 'ご閲覧ありがとうございます。test太郎と申します。皇居を一緒に走りませんか？？' }
    event_cls { 'Run' }
    train_strength { 'fun' }
    start_ymd { '2021-01-01T09:00:00.000Z' }
    start_time { '2021-01-01T010:00:00.000Z' }
    duration { '2' }
    place { '皇居' }
    prefecture { '東京都' }
    join_limit { 5 }
    association :user
  end
end