json.extract! friend_rec, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url friend_rec_url(friend_rec, format: :json)
