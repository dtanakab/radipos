# frozen_string_literal: true

require "rails_helper"

RSpec.describe Program, type: :model do
  before do
    common_set_up
    @program1, @program2, @program3 = create(:program1), create(:program2), create(:program3)
    @corner1, @corner2, @corner3, @corner4, @corner5 = create(:corner1), create(:corner2), create(:corner3), create(:corner4), create(:corner5)
    @post1, @post2, @post3, @post4, @post5 = create(:post1), create(:post2), create(:post3), create(:post4), create(:post5)
  end

  describe "output program info" do
    it "airtime" do
      expect(@program1.airtime).to eq("03:05-13:30")
    end
    it "on_timetable" do
      expect(@program1.on_timetable?("1", "1")).to eq(true)
      expect(@program2.on_timetable?("1", "1")).to eq(false)
    end
  end

  describe "output program lists" do
    it "search results" do
      expect(Program.search("TEST")).to eq([@program1, @program2, @program3])
      expect(Program.search("太郎3")).to eq([@program3])
    end
    it "corner attached lists" do
      expect(Program.corner_attached_list).to eq([@program1, @program2])
    end
  end
end
