# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # This class handles comparing and initializing from hash classes which
  # represent model objects from SABnzbd+
  class Response

    public

    # Set the attributes from a hash into the attributes of this object, so
    # @example
    #   {"total_size" => "bla"}
    # is equivalent to
    # @example
    #   total_size = "bla"
    #
    # @param [Hash<String, Hash>, Hash<String, String>]
    # @return [SabnzbdPlusModel::Response]
    def self.from_hash(response)
      item = self.new

      response.each { |key, value|
        unless self.parameter_mapping.key? key
          item.send(key.to_s+"=", value)
        else
          item.send(self.parameter_mapping[key].to_s+"=", value)
        end

      }

      return item
    end

    # Compare the class type and the values within it
    #
    # @param [SabnzbdPlusModel::Response] item
    # @return [Boolean]
    def eql?(item)
      return false unless item.class == self.class

      return self == item
    end


    # Get the parameter mapping that maps the SABnzbd+ API parameter names to
    # their Rubyish equivalent
    #
    # Over-ridden in child classes
    #
    # @return [Hash<String, Label>]
    def self.parameter_mapping
      return {
      }
    end
  end
end
