class List < ActiveResource::Base

  schema do
    attribute 'ingredients', 'string'
  end

  def set(user, ingredients)
    ingredients.each do |i|
      REDIS.hmset(user.to_s + "_list", i)
    end
  end

  def delete(user)
    REDIS.hdel(user.to_s + "_list")
  end

  def self.get(user)
    REDIS.hgetall(user.to_s + "_list")
  end

end
