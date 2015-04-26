class Order < ActiveRecord::Base
  has_many :order_products
  has_many :products, :through => :order_products 
  belongs_to :user
  
  def self.today
    self.where("created_at >= ?", Time.zone.now.beginning_of_day).order(:created_at)
  end
  
  def self.this_week
   self.where('created_at >= ?', 1.week.ago).order(:created_at)
  end
  
  def self.this_month
    self.where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month).order(:created_at)
  end
  
  def self.current_status
    self.status
  end
  
  def self.total_on(date)
    where("date(created_at) = ?",date).sum(:total_price)
  end
end
