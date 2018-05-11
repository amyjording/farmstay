require 'rails_helper'

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

  context "for farmie viewing other farmies' profiles or editing their own profile" do
    let(:profile) {FactoryBot.create(:profile)}
    let(:farmie) {FactoryBot.create(:farmie)}

    permissions :index?, :show?, :new?, :create? do
      it "grants access to farmie" do
        expect(subject).to permit(farmie, profile)
      end
    end

    permissions :edit?, :update?, :destroy? do
      it "denies access to farmie for whom the profile does not belong" do
        expect(subject).not_to permit(farmie, profile)
      end
    end
  end

  context "for farmie editing their own profile" do
    let(:farmie) { FactoryBot.create(:farmie) }

    permissions :edit?, :update?, :destroy? do
      it "grants access if profile belongs to farmie" do
        expect(subject).to permit(farmie,farmie.profile)#, Profile.create!(farmie_id: farmie.id))
      end
    end
  end
end