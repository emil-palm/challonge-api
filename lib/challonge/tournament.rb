class Challonge::Tournament < Challonge::API
  self.site = "https://challonge.com/api"

  def description
    if self.attributes.include?('description_source')
      self.description_source
    end
  end

  def description=(val)
    self.description_source = val
  end

  def publish!
    validated_post(:publish)
  end

  def start!
    validated_post(:start)
  end

  def reset!
    validated_post(:reset)
  end

  def participants(scope = :all)
    Challonge::Participant.find(scope, :params => {:tournament_id => self.id})
  end

  def matches(options={})
    Challonge::Match.find((options[:scope] ? options[:scope] : :all), :params => {:tournament_id => self.id}.merge(options))
  end

  protected

  def readonly_attributes
    %w/description_source subdomain full_challonge_url live_image_url sign_up_url/
  end

  def writable_attribute_hash
    attr_h = super
    attr_h['description'] = description
    attr_h
  end
end
