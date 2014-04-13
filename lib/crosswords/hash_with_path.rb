module Crosswords
  class HashWithPath < Hash
    def traverse_path(path, separator = '.')
      path.split(separator).inject( self ) do |hsh, path_portion|
        if hsh.has_key?(path_portion)
          hsh[path_portion]
        else
          return nil
        end
      end
    end

    def deep_merge(second)
      merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
      self.merge(second, &merger)
    end
  end
end