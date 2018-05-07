require 'rails/helper'

describe ProfilePolicy do
  subject { described_class }

  context "for a visitor" do
    let(:farmie) { nil }
    let(:profile) { FactoryBot.create(:profile) }

    permissions :index?, :show?, :new?, :edit?, :create?, :update?, :destroy? do
      it "does not grant access for non logged in visitors" do
        expect(subject).not_to permit(farmie, profile)
      end
    end
end