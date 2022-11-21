# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed tractors start....
Tractor.create([
{
  name: 'Mahindra.',
  photo:
    'https://res.cloudinary.com/nayo/image/upload/v1668488822/tract2_xvrerm.png',
  demand: 0,
  completion: 7,
  price: 98000,
  new_farm_price: 108000,
  description:
    'printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'Massey Ferguson',
  photo: 'https://res.cloudinary.com/nayo/image/upload/v1668488825/trac1_zxbl4k.png',
  demand: 0,
  completion: 5,
  price: 73000,
  new_farm_price: 83000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'New Holland.',
  photo: 'https://res.cloudinary.com/nayo/image/upload/v1668488823/trac4_p54f1b.png',
  demand: 0,
  completion: 10,
  price: 85000,
  new_farm_price: 95000,
  description:
    'Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'John Deere.',
  photo: 'https://res.cloudinary.com/nayo/image/upload/v1668488822/tract8_fuypdu.png',
  demand: 0,
  completion: 6,
  price: 92000,
  new_farm_price: 102000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'Sonalika.',
  photo: 'tractor',
  demand: 0,
  completion: 9,
  price: 107000,
  new_farm_price: 117000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'Swaraj.',
  photo: 'https://res.cloudinary.com/nayo/image/upload/v1668488823/trac3_khqlds.png',
  demand: 0,
  completion: 7,
  price: 64000,
  new_farm_price: 74000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'Powertrac.',
  photo: 'tractor',
  demand: 0,
  completion: 8,
  price: 57000,
  new_farm_price: 67000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'Eicher.',
  photo: 'https://res.cloudinary.com/nayo/image/upload/v1668488821/trac6_elrouh.png',
  demand: 0,
  completion: 6,
  price: 45000,
  new_farm_price: 55000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
},
{
  name: 'Reform Metrac',
  photo: 'https://res.cloudinary.com/nayo/image/upload/v1668488821/trac5_ziokxk.png',
  demand: 0,
  completion: 10,
  price: 113000,
  new_farm_price: 123000,
  description:
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the',
}
])
# Seed tractors End....