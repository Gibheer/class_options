require 'spec_helper'

describe ClassOptions::Options, '#options' do
  subject { testclass }
  let (:function) { 'bar' }
  let (:value)    { 23 }

  shared_examples_for 'an option' do
    it { should respond_to(function) }       # check getter
    it { should respond_to(function + '=') } # check setter

    it 'saves the option' do
      subject.send(function + '=', value)
      expect(subject.send(function)).to be(value)
    end

    it 'sets the default to Undefined' do
      expect(subject.send(function)).to be(ClassOptions::Undefined)
    end
  end

  context 'with a single option' do
    let(:testclass) do
      Class.new do
        extend ClassOptions::Options
        options :bar
      end
    end

    it_behaves_like 'an option'
  end

  context 'with many options' do
    let(:testclass) do
      Class.new do
        extend ClassOptions::Options
        options :foo, :bar
      end
    end

    it_behaves_like 'an option'
  end
end
