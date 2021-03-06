class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer  :number,        null: false     # 背番号
      t.string   :name,          null: false     # ニックネーム
      t.string   :full_name                      # 本名
      t.string   :email                          # メールアドレス
      t.date     :birthday                       # 生年月日
      t.integer  :gender,        null: false,
                               defalt: 0         # (0:男, 1:女)
      t.boolean  :administrator, null: false,
                               defalt: false     # 管理者フラグ

      t.timestamps
    end
  end
end
