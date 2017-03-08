require "rspec"
require "tdd"

describe "#my_uniq" do
  let(:arr) { [1,2,1,3,3] }
  it "returns an Array" do
    expect(my_uniq(arr).is_a?(Array)).to be true
  end

  it "takes an Array" do
    expect { my_uniq("1,2,3,4,5") }.to raise_error(TypeError)
  end

  it "removes duplicates from input array" do
    expect(my_uniq(arr)).to eq([1, 2, 3])
  end

  it "doesn't modify the original array" do
    original = arr
    my_uniq(original)
    expect(original).to eq(arr)
  end
end

describe "#two_sum" do
  let(:arr) { [-1, 0, 2, -2, 1] }
  let(:no_two_sums) { [1,2,3,4,5,6] }

  it "returns an array" do
    expect(arr.two_sum.is_a?(Array)).to be true
  end

  it "returns [] if no two sums" do
    expect(no_two_sums.two_sum).to be_empty
  end

  it "finds indices that sum to 0" do
    expect(arr.two_sum).to eq [[0,4], [2,3]]
  end

  it "returns smaller elements first" do
    expect(arr.two_sum).to eq arr.two_sum.sort
  end
end

describe "#my_transpose" do
  let(:arr) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it "returns an Array" do
    expect(my_transpose(arr).is_a?(Array)).to be true
  end

  it "takes an Array" do
    expect { my_transpose("1,2,3,4,5") }.to raise_error(TypeError)
  end

  it "transposes array" do
    expect(my_transpose(arr)).to eq([[0, 3, 6],
                                     [1, 4, 7],
                                     [2, 5, 8]])
  end

  it "transposes of a transposed array is the original array" do
    expect(my_transpose(my_transpose(arr))).to eq(arr)
  end
end

describe "#stock_picker" do
  let(:stock_prices) { [5, 4, 2, 7, 8] }

  it "outputs an array" do
    expect(stock_picker(stock_prices).is_a? Array).to be true
  end

  it "outputs an array of length 2" do
    expect(stock_picker(stock_prices).length).to eq(2)
  end

  it "returns the indices of the biggest gain" do
    expect(stock_picker(stock_prices)).to eq([2, 4])
  end 

end
