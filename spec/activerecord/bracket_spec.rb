require File.expand_path('../../spec_helper', __FILE__)

describe ActiveRecord::Bracket do
  context "sample class" do
    let(:sample_class){
      # pseudo-activerecord
      Class.new do
        include ActiveRecord::Bracket::Method
        attr_accessor :name, :slug
        def initialize (arg)
          @name = arg[:name]
          @slug = arg[:slug]
          self.class.instances[@slug.intern] = self
        end
        def == (other)
          [self.name.to_s, self.slug.to_s] == [other.name.to_s, other.slug.to_s]
        end
        def self.find_by_slug (key)
          instances[key.intern]
        end
        def self.instances; @@instances ||= {} ; end
      end
    }
    before(:each){ @sample = sample_class.new(name: "Foo", slug: "foo") }
    it{ expect(sample_class.find_by_slug(:foo)).to eq @sample }
    it{ expect(sample_class[:foo]).to eq @sample }
    it{ expect(sample_class[:foo]).to eq sample_class.find_by_slug(:foo) }
  end
end
