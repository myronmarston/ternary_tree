require 'spec_helper'

describe TernaryTree do
  it 'is initially empty' do
    tt = TernaryTree.new
    tt.root.should be_nil
    tt.left.should be_nil
    tt.middle.should be_nil
    tt.right.should be_nil
  end

  it 'makes the first item the root' do
    tt = TernaryTree.new
    tt.insert(7)
    tt.root.value.should == 7
  end

  context 'with a root of 7' do
    subject do
      tt = TernaryTree.new
      tt.insert(7)
      tt
    end

    it 'inserts a 5 to the left' do
      subject.insert(5)
      subject.left.value.should == 5
      subject.right.should be_nil
      subject.middle.should be_nil
    end

    it 'inserts a 7 in the middle' do
      subject.insert(7)
      subject.left.should be_nil
      subject.right.should be_nil
      subject.middle.value.should == 7
    end

    it 'inserts a 9 to the right' do
      subject.insert(9)
      subject.left.should be_nil
      subject.right.value.should == 9
      subject.middle.should be_nil
    end

    context 'and a left of 5' do
      before(:each) { subject.insert(5) }

      it 'inserts a 3 to the left of the 5' do
        subject.insert(3)
        subject.left.left.value.should == 3
      end

      it 'inserts a 6 to the right of the 5' do
        subject.insert(6)
        subject.left.right.value.should == 6
      end

      it 'inserts a 5 as the middle child of 5' do
        subject.insert(5)
        subject.left.middle.value.should == 5
      end
    end
  end

  it 'builds a complex tree properly' do
    tt = TernaryTree.new
    %w[ 5 4 9 5 7 2 2 ].each { |i| tt.insert(i.to_i) }

    tt.root.value.should == 5
    tt.left.value.should == 4
    tt.middle.value.should == 5
    tt.right.value.should == 9
    tt.left.left.value.should == 2
    tt.left.left.middle.value.should == 2
    tt.right.left.value.should == 7
  end
end
