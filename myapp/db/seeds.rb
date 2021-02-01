User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end

Property.create!(house_name: "心家 渋谷うすき",
                 area_name: "青山・渋谷",
                 house_adress: "東京都渋谷区東2丁目",
                 house_station: "恵比寿",
                 house_skill: "Web制作エンジニア",
                 house_distance: 9,
                 rent: 50000)

Property.create!(house_name: "リバーサイドテラス青葉代官山",
                 area_name: "青山・渋谷",
                 house_adress: "東京都目黒区青葉台3",
                 house_station: "池尻大橋",
                 house_skill: "声優",
                 house_distance: 7,
                 rent: 32000)

Property.create!(house_name: "恵比寿の家",
                 area_name: "青山・渋谷",
                 house_adress: "東京都渋谷区恵比寿2丁目",
                 house_station: "渋谷",
                 house_skill: "弁護士",
                 house_distance: 15,
                 rent: 79000)

Property.create!(house_name: "ARDEN 新宿",
                 area_name: "新宿・中野",
                 house_adress: "東京都新宿区",
                 house_station: "新大久保",
                 house_skill: "俳優",
                 house_distance: 3,
                 rent: 77000)

Property.create!(house_name: "Modelia Colors WAKAMATSUCHO",
                 area_name: "新宿・中野",
                 house_adress: "東京都新宿区若松町36",
                 house_station: "早稲田",
                 house_skill: "通訳（英語）",
                 house_distance: 6,
                 rent: 69000)

Property.create!(house_name: "コンパルティード 中野",
                 area_name: "新宿・中野",
                 house_adress: "東京都中野区",
                 house_station: "沼袋",
                 house_skill: "公務員",
                 house_distance: 3,
                 rent: 52000)

Property.create!(house_name: "RYOZAN PARK",
                 area_name: "池袋・赤羽",
                 house_adress: "東京都豊島区",
                 house_station: "巣鴨",
                 house_skill: "会計士",
                 house_distance: 2,
                 rent: 78000)

Property.create!(house_name: "東京シェア＋",
                 area_name: "池袋・赤羽",
                 house_adress: "東京都北区",
                 house_station: "西日暮里",
                 house_skill: "起業家",
                 house_distance: 7,
                 rent: 69000)

Property.create!(house_name: "TerraceCamp 洗足池",
                 area_name: "品川・蒲田",
                 house_adress: "東京都大田区東雪谷４",
                 house_station: "洗足池",
                 house_skill: "通訳（英語）",
                 house_distance: 15,
                 rent: 40000)

Property.create!(house_name: "COURI025 下目黒",
                 area_name: "青山・渋谷",
                 house_adress: "目黒区下目黒5丁目",
                 house_station: "目黒",
                 house_skill: "Web開発エンジニア",
                 house_distance: 18,
                 rent: 64000)