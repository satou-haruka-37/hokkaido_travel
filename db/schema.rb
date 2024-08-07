# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_240_116_133_027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookmarks', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'post_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_bookmarks_on_post_id'
    t.index ['user_id'], name: 'index_bookmarks_on_user_id'
  end

  create_table 'developer_notices', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'body', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'address', null: false
    t.float 'latitude', null: false
    t.float 'longitude', null: false
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.json 'images'
    t.index ['address'], name: 'index_posts_on_address', unique: true
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'posts_seasons', force: :cascade do |t|
    t.bigint 'post_id'
    t.bigint 'season_id'
    t.index ['post_id'], name: 'index_posts_seasons_on_post_id'
    t.index ['season_id'], name: 'index_posts_seasons_on_season_id'
  end

  create_table 'posts_tags', force: :cascade do |t|
    t.bigint 'post_id'
    t.bigint 'tag_id'
    t.index ['post_id'], name: 'index_posts_tags_on_post_id'
    t.index ['tag_id'], name: 'index_posts_tags_on_tag_id'
  end

  create_table 'seasons', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'uid', null: false
    t.string 'name'
    t.integer 'role', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar'
  end

  add_foreign_key 'bookmarks', 'posts'
  add_foreign_key 'bookmarks', 'users'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'posts_seasons', 'posts'
  add_foreign_key 'posts_seasons', 'seasons'
  add_foreign_key 'posts_tags', 'posts'
  add_foreign_key 'posts_tags', 'tags'
end
