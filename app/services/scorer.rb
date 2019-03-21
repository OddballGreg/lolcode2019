class Scorer
  def self.test(problem_set, user_solution)
    photos = {}

    problem_set.split("\n").each.with_index do |line, index|
      if index.zero?
        next
      else
        parts = line.split(' ')
        photos[index - 1] = {orientation: parts[0], tags: parts[2..-1]}
      end
    end

    user_line_count = nil
    last_index = nil
    previous_slide_tags = []
    score = 0
    user_solution.split("\n").each.with_index do |line, index|
      if index.zero?
        user_line_count = line.to_i
      else
        return -42  if index > user_line_count
        slide_photos = line.split(' ').map(&:to_i)
        return -42  if slide_photos.any? {|photo_id| photos[photo_id].nil?}
        return -42  if slide_photos.size == 1 && slide_photos.any?{|photo_id| photos[photo_id][:orientation] == 'V'}
        return -42  if slide_photos.size > 1 && slide_photos.any?{|photo_id| photos[photo_id][:orientation] == 'H'}
        return -42  if slide_photos.size > 2
        
        slide_photos.each do |photo_id|
          return -42  if photos[photo_id][:used] 
          photos[photo_id][:used] = true
        end

        current_tags = slide_photos.map{ |photo_id| photos[photo_id][:tags] }.flatten.uniq 
        score += [(current_tags & previous_slide_tags).size, (current_tags - previous_slide_tags).size, (previous_slide_tags - current_tags).size].min
        previous_slide_tags = current_tags
      end
      last_index = index
    end

    return -42 if last_index != user_line_count

    score
  end
end
