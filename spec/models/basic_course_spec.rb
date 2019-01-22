# frozen_string_literal: true

require 'rails_helper'

describe BasicCourse do
  let(:flags) { nil }
  let(:subject) { create(:basic_course, flags: flags) }

  describe '#assignment_edits_enabled?' do
    it 'should return true by default' do
      expect(subject.assignment_edits_enabled?).to eq(true)
    end

    context 'with edit_settings flag' do
      let(:flags) do
        {
          'edit_settings' => { 'assignment_edits_enabled' => false }
        }
      end

      it 'should return the value of the set flag' do
        expect(subject.assignment_edits_enabled?).to eq(false)
      end
    end
  end
end
