require 'spec_helper'

describe DeschutesDocument do
  def load_fixture(name)
      File.read(File.join('.', 'spec', 'fixtures', "#{name}.fixture"))
  end

  before(:each) do
    @document = DeschutesDocument.new(load_fixture('record_root'))
    @document.parse
  end

  describe "#verify_or_create_nokogiri_document" do
    it "verifies the document's class is Nokogiri or creates a Nokogiri object" do
      @document.nokogiri_document.should be_a_kind_of(Nokogiri::HTML::Document)
    end
  end

  describe "#parse_and_set_id_vol_page" do
    it "should set the document id,vol, and page" do
      @document.parse_and_set_id_vol_page
      @document.id.should_not be_nil
      @document.vol.should_not be_nil
      @document.page.should_not be_nil
    end
  end

  describe "#root?" do
    it "returns true when document is root" do
      document = DeschutesDocument.new(load_fixture('record_root'))
      document.parse
      document.should be_root
    end

    it "returns true when document is not root" do
      document = DeschutesDocument.new(load_fixture('record_not_root'))
      document.parse
      document.should_not be_root
    end
  end

  describe "#parse_and_set_are_referenced" do
    it "parses the document and sets an array of documents that are referenced" do
      document = DeschutesDocument.new(load_fixture('record_not_root'))
    end
  end
end