require 'rails_helper'

RSpec.describe Photo do 

  before(:each) do 
    @photo_data = {
                    "id": "5DfGmkLdl90",
                    "created_at": "2017-09-05T11:14:40-04:00",
                    "updated_at": "2022-04-24T06:02:16-04:00",
                    "promoted_at": 'null',
                    "width": 4928,
                    "height": 3264,
                    "color": "#260c0c",
                    "blur_hash": "LaEyMO4nofof~q9Ft8of%MMxt7t7",
                    "description": "Mug by Bezalel & Babel.",
                    "alt_description": "beverage pouring on white mug",
                    "urls": {
                        "raw": "https://images.unsplash.com/photo-1504624244670-373b7257e140?ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx&ixlib=rb-1.2.1",
                        "full": "https://images.unsplash.com/photo-1504624244670-373b7257e140?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx&ixlib=rb-1.2.1&q=85",
                        "regular": "https://images.unsplash.com/photo-1504624244670-373b7257e140?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx&ixlib=rb-1.2.1&q=80&w=1080",
                        "small": "https://images.unsplash.com/photo-1504624244670-373b7257e140?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx&ixlib=rb-1.2.1&q=80&w=400",
                        "thumb": "https://images.unsplash.com/photo-1504624244670-373b7257e140?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx&ixlib=rb-1.2.1&q=80&w=200",
                        "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1504624244670-373b7257e140"
                    },
                    "links": {
                        "self": "https://api.unsplash.com/photos/5DfGmkLdl90",
                        "html": "https://unsplash.com/photos/5DfGmkLdl90",
                        "download": "https://unsplash.com/photos/5DfGmkLdl90/download?ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx",
                        "download_location": "https://api.unsplash.com/photos/5DfGmkLdl90/download?ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx"
                    },
                    "categories": [],
                    "likes": 211,
                    "liked_by_user": false,
                    "current_user_collections": [],
                    "sponsorship": 'null',
                    "topic_submissions": {},
                    "user": {
                        "id": "SDH2ogT6LBI",
                        "updated_at": "2022-04-22T19:40:08-04:00",
                        "username": "wildandinlove",
                        "name": "Alisha Hieb",
                        "first_name": "Alisha",
                        "last_name": "Hieb",
                        "twitter_username": 'null',
                        "portfolio_url": 'null',
                        "bio": 'null',
                        "location": "Denver, CO",
                        "links": {
                            "self": "https://api.unsplash.com/users/wildandinlove",
                            "html": "https://unsplash.com/@wildandinlove",
                            "photos": "https://api.unsplash.com/users/wildandinlove/photos",
                            "likes": "https://api.unsplash.com/users/wildandinlove/likes",
                            "portfolio": "https://api.unsplash.com/users/wildandinlove/portfolio",
                            "following": "https://api.unsplash.com/users/wildandinlove/following",
                            "followers": "https://api.unsplash.com/users/wildandinlove/followers"
                        },
                        "profile_image": {
                            "small": "https://images.unsplash.com/profile-1490372196541-6a21ab698b2d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                            "medium": "https://images.unsplash.com/profile-1490372196541-6a21ab698b2d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                            "large": "https://images.unsplash.com/profile-1490372196541-6a21ab698b2d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                        },
                        "instagram_username": "wildandinlove",
                        "total_collections": 2,
                        "total_likes": 29,
                        "total_photos": 12,
                        "accepted_tos": false,
                        "for_hire": false,
                        "social": {
                            "instagram_username": "wildandinlove",
                            "portfolio_url": 'null',
                            "twitter_username": 'null',
                            "paypal_email": 'null'
                        }
                    },
                    "tags": [
                        {
                            "type": "search",
                            "title": "colorado"
                        }
                    ]
                  }
  end

  it 'will create a HourlyWeather object' do 
    photo = Photo.new(@photo_data)

    expect(photo).to be_a Photo
  end
  
  it 'has all required attributes' do 
    photo = Photo.new(@photo_data)
  
    expect(photo.id).to eq(nil)
    expect(photo.source).to eq('unsplash.com')
    expect(photo.image_url).to eq('https://images.unsplash.com/photo-1504624244670-373b7257e140?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb2xvcmFkbyUyMGV2ZW5pbmclMjBjbG91ZHl8ZW58MHx8fHwxNjUwODI2ODkx&ixlib=rb-1.2.1&q=85')
    expect(photo.photographer).to eq('Alisha Hieb')
    expect(photo.photographer_profile).to eq('https://unsplash.com/@wildandinlove?utm_source=Sweater_Weather&utm_medium=referral')
  end
end