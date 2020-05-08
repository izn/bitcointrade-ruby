require 'timecop'

require 'spec_helper'

require 'bitcointrade/api'
require 'bitcointrade/api/public'

RSpec.describe Bitcointrade::API::Public, :vcr do
  describe '.ticker' do
    subject { described_class.ticker }

    shared_examples 'a ticker object' do
      it { is_expected.to be_a(Bitcointrade::API::Types::Ticker) }
    end

    it_behaves_like 'a ticker object'

    context 'with BRLETH pair' do
      subject { described_class.ticker(pair: 'BRLETH') }

      it_behaves_like 'a ticker object'
    end
  end

  describe '.orders' do
    subject { described_class.orders }

    shared_examples 'a bid collection' do
      it { is_expected.to be_a(Bitcointrade::API::Types::BidsCollection) }
    end

    it_behaves_like 'a bid collection'

    context 'with BRLETH pair' do
      subject { described_class.orders(pair: 'BRLETH') }

      it_behaves_like 'a bid collection'
    end
  end

  describe '.trades' do
    subject { described_class.trades }

    shared_examples 'a trade collection' do
      it { is_expected.to be_a(Bitcointrade::API::Types::TradesCollection) }
    end

    context 'when dates are not provided' do
      before { Timecop.freeze(Time.local(2020, 01, 02)) }

      it_behaves_like 'a trade collection'

      context 'with BRLETH pair' do
        subject { described_class.trades(pair: 'BRLETH') }

        it_behaves_like 'a trade collection'
      end

      after { Timecop.return }
    end

    context 'with custom dates' do
      let(:start_time) { Time.parse('2020-05-12 09:00:00') }
      let(:end_time) { Time.parse('2020-05-13 18:00:00') }

      subject { described_class.trades(start_time: start_time, end_time: end_time) }

      it_behaves_like 'a trade collection'

      context 'with BRLETH pair' do
        subject do
          described_class.trades(
            pair: 'BRLETH',
            start_time: start_time,
            end_time: end_time
          )
        end

        it_behaves_like 'a trade collection'
      end
    end
  end
end
