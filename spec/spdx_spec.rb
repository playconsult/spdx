require 'spec_helper'

describe Spdx do
  describe 'find' do
    it "should return know license from short code" do
      expect(Spdx.find('Apache-2.0').name).to eq("Apache License 2.0")
    end

    it "should work with case-insentive short codes" do
      expect(Spdx.find('apache-2.0').name).to eq("Apache License 2.0")
    end

    it "should return know license from full name" do
      expect(Spdx.find('Apache License 2.0').name).to eq("Apache License 2.0")
    end

    it "should return nil for garbage" do
      expect(Spdx.find('foo bar baz')).to be_nil
      expect(Spdx.find('Copyright Zendesk. All Rights Reserved.')).to be_nil
      expect(Spdx.find('https://github.com/AuthorizeNet/sdk-ruby/blob/master/license.txt')).to be_nil
    end

    it "should return know license from an alias" do
      expect(Spdx.find('The Apache Software License, Version 2.0').name).to eq("Apache License 2.0")
      expect(Spdx.find('Apache 2.0').name).to eq("Apache License 2.0")
      expect(Spdx.find('Apache2').name).to eq("Apache License 2.0")
      expect(Spdx.find('Apache License, Version 2.0').name).to eq("Apache License 2.0")
      expect(Spdx.find('Educational Community License, Version 2.0').name).to eq("Educational Community License v2.0")
      expect(Spdx.find('CDDL + GPLv2 with classpath exception').name).to eq("GNU General Public License v2.0 w/Classpath exception")
      expect(Spdx.find('The MIT License').name).to eq("MIT License")
      expect(Spdx.find('UNLICENSE').name).to eq("The Unlicense")
    end
  end
end
