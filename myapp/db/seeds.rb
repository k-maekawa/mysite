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
                 house_skill: "プログラミング",
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
            