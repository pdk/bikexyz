class BikeReg < ActiveRecord::Base
  attr_accessible :xyz_code, :alternate_name, :brand, :cell_phone_one, :cell_phone_two, :city, :color, :country, :kind, :model, :name, :notes, :number_of_gears, :primary_email, :second_email, :serial_number, :size, :state, :third_email, :photo_1, :photo_2, :photo_3, :photo_4, :photo_5, :photo_6, :photo_1_cache, :photo_2_cache, :photo_3_cache, :photo_4_cache, :photo_5_cache, :photo_6_cache, :year
  
  validates_presence_of :xyz_code, :name, :country, :primary_email
  
  has_paper_trail

  mount_uploader :photo_1, BikeRegPhotoUploader
  mount_uploader :photo_2, BikeRegPhotoUploader
  mount_uploader :photo_3, BikeRegPhotoUploader
  mount_uploader :photo_4, BikeRegPhotoUploader
  mount_uploader :photo_5, BikeRegPhotoUploader
  mount_uploader :photo_6, BikeRegPhotoUploader

  @@secure_fields = [:primary_email, :second_email, :third_email, :cell_phone_one, :cell_phone_two]

  def to_param
    xyz_code
  end
  
  def as_xml(options={})
    options[:except] ||= @@secure_fields
    super(options)
  end

  # Exclude password info from json output.
  def as_json(options={})
    options[:except] ||= @@secure_fields
    super(options)
  end

  def authorized?(email)
    if email.blank?
      return false
    end
    
    [primary_email.downcase, second_email.downcase, third_email.downcase].include? email.downcase
  end
  
  def lookup_label
    "#{ SITE_TITLE_DOMAIN }/#{xyz_code}/"
  end
  
  def lookup_url
    "http://#{ SITE_TITLE_DOMAIN }/#{xyz_code}/"    
  end

  def BikeReg.text_search(query, limit=100)
    if query.present?
      rank = %{ts_rank(to_tsvector(searchable_text), plainto_tsquery(#{sanitize(query)}))}
      where("searchable_text @@ :q", q: query).order("#{rank} desc").limit(limit)
    else
      scoped.limit(limit)
    end
  end

  before_save :set_searchable_text
  def set_searchable_text
    self.searchable_text = %{
      #{xyz_code        }
      #{serial_number   }
      #{color           }
      #{brand           }
      #{model           }
      #{kind            }
      #{size            }
      #{number_of_gears }
      #{notes           }
      #{name            }
      #{alternate_name  }
      #{city            }
      #{state           }
      #{country         }
      #{primary_email   }
      #{second_email    }
      #{third_email     }
      #{cell_phone_one  }
      #{cell_phone_two  }
      #{created_at      }
      #{updated_at      }
      #{photo_1         }
      #{photo_2         }
      #{photo_3         }
      #{photo_4         }
      #{photo_5         }
      #{photo_6         }
      #{year            }
    }
  end

end
