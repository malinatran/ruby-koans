require File.expand_path(File.dirname(__FILE__) + '/neo')

def score(dice)
  points = 0
  set_of_threes = dice.detect { |num| dice.count(num) == 3 }

  if set_of_threes != nil
    if set_of_threes == 1
      points += 1000
    else 
      points += set_of_threes * 100
    end
    dice.delete(set_of_threes)
  end

  delete_array = []
  i = 0
  while delete_array.length < 3 do
    if a[i] == duplicate
      delete_arrya.push(a[i])
    end
    i += 1
  end  

  counts = {}
  dice.each do |die|
    if counts.key?(die) 
      counts[die] += 1
    else 
      counts[die] = 1
    end
  end

  counts.each do |num, quantity|
    if num == 1
      points += quantity * 100
    end
    if num == 5
      points += quantity * 50
    end
  end

  points
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
