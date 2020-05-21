# frozen_string_literal: true

# == Schema Information
#
# Table name: user_recipes
#
#  id              :bigint           not null, primary key
#  is_favorite     :boolean
#  is_kid_friendly :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  recipe_id       :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_user_recipes_on_recipe_id  (recipe_id)
#  index_user_recipes_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#


class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
end
