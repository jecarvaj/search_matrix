# frozen_string_literal: true

require 'search_in_matrix'
# rubocop:disable Metrics/BlockLength
RSpec.describe SearchInMatrix do
  subject(:search_in_matrix) do
    described_class.new(matrix, target)
  end

  let(:target) { 'E' }

  describe '#invalid_matrix?' do
    context 'when matrix is not an array' do
      let(:matrix) { '' }

      it 'returns true' do
        expect(search_in_matrix.invalid_matrix?).to eq(true)
      end
    end

    context 'when is not a matrix' do
      let(:matrix) { [[1, 2, 3], 1, '2'] }

      it 'returns true' do
        expect(search_in_matrix.invalid_matrix?).to eq(true)
      end
    end

    context 'when matrix is not rectangle' do
      let(:matrix) { [[1, 2, 3], [1, 2]] }

      it 'returns true for invalid_matrix?' do
        expect(search_in_matrix.invalid_matrix?).to eq(true)
      end
    end

    context 'when matrix is valid' do
      let(:matrix) do
        [
          ['S', ' ', 'X', ' ', ' ', ' '],
          [' ', ' ', 'X', ' ', 'X', ' '],
          ['X', ' ', 'X', ' ', 'X', ' '],
          ['X', ' ', ' ', ' ', ' ', ' '],
          ['X', 'X', 'X', 'X', 'X', ' '],
          [' ', ' ', ' ', ' ', ' ', 'E']
        ]
      end

      it 'returns false' do
        expect(search_in_matrix.invalid_matrix?).to eq(false)
      end
    end
  end

  describe '#exists_path?' do
    context 'when path exists' do
      let(:matrix) do
        [
          ['S', ' ', 'X', ' ', ' ', ' '],
          [' ', ' ', 'X', ' ', 'X', ' '],
          ['X', ' ', 'X', ' ', 'X', ' '],
          ['X', ' ', ' ', ' ', ' ', ' '],
          ['X', 'X', 'X', 'X', 'X', ' '],
          [' ', ' ', ' ', ' ', ' ', 'E']
        ]
      end

      it 'returns true' do
        expect(search_in_matrix.exists_path?).to eq(true)
      end

      it 'calls find_target' do
        allow(search_in_matrix).to receive(:find_target)
        search_in_matrix.exists_path?

        expect(search_in_matrix).to have_received(:find_target)
      end
    end

    context 'when path does not exist' do
      let(:matrix) do
        [
          ['S', ' ', 'X', ' ', ' ', ' '],
          [' ', ' ', 'X', ' ', 'X', ' '],
          ['X', ' ', 'X', ' ', 'X', ' '],
          ['X', ' ', ' ', ' ', ' ', ' '],
          ['X', 'X', 'X', 'X', 'X', 'X'],
          [' ', ' ', ' ', ' ', 'X', 'E']
        ]
      end

      it 'returns false' do
        expect(search_in_matrix.exists_path?).to eq(false)
      end

      it 'does not call show_info' do
        allow(search_in_matrix).to receive(:show_info)
        search_in_matrix.exists_path?

        expect(search_in_matrix).not_to have_received(:show_info)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
