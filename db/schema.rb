ActiveRecord::Schema.define(version: 20_181_213_055_031) do
  create_table 'posts', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4',
                        force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
