require 'spec_helper'

describe ClassOptions::Options, '#options' do
  subject { testclass }
  let (:function) { 'bar' }
  let (:value)    { 23 }

  shared_examples_for 'an option' do
    it { should respond_to(function) }       # check getter

    it 'saves the option' do
      subject.send(function, value)
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
        accept_options :bar
      end
    end

    it_behaves_like 'an option'
  end

  context 'with many options' do
    let(:testclass) do
      Class.new do
        extend ClassOptions::Options
        accept_options :foo, :bar
      end
    end

    it_behaves_like 'an option'
  end

  context 'with instances' do
    let(:testclass) do
      Class.new do
        extend ClassOptions::Options
        accept_options :foo

        def initialize
          @foo = self.class.foo
        end
        attr_reader :foo
      end
    end

    it "gets the value from the class" do
      testclass.foo(23)
      t = testclass.new
      expect(t.foo).to be(23)
    end
  end

  context 'with inheritance' do
    let(:primclass) do
      Class.new do
        extend ClassOptions::Options
        accept_options :foo
      end
    end
    let(:testclass) do
      Class.new(primclass) do
      end
    end
    it "gets the value from the inherited class" do
      primclass.foo(23)
      expect(testclass.foo).to be(23)
    end
  end
end
