class BlackDomain < ActiveRecord::Migration
  def self.up
    create_table :black_domains do |t|
      t.string :domain_name
      t.timestamps
    end
  end

  def self.down
    drop_table :black_domains
  end
end
