module ApiKey
  def self.generator
    SecureRandom.hex
  end
end