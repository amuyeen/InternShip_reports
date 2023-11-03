code_wars.rb

# Tạo một hàm nhận Chuỗi đầu vào và trả về một Chuỗi, trong đó tất cả các từ viết hoa của Chuỗi đầu vào ở phía trước và tất cả các từ viết thường ở cuối. Thứ tự của các từ viết hoa và viết thường phải theo thứ tự xuất hiện của chúng.
# Nếu một từ bắt đầu bằng một số hoặc ký tự đặc biệt, hãy bỏ qua từ đó và loại nó ra khỏi kết quả.
# Chuỗi đầu vào sẽ không trống.
# Đối với Chuỗi đầu vào: "hey You, Sort me Already!" hàm sẽ trả về: "You, Sort Already! hey me"

def capitals_first(string)
  valid_words = string.split(' ').select { |w| w =~ /\A[a-z]/i }
  valid_words.partition {|w| w =~ /\A[A-Z]/}.flatten.join(' ')
end


# Cho một chuỗi s. Bạn phải trả về một chuỗi khác sao cho các ký tự được lập chỉ mục chẵn và lập chỉ mục lẻ của s được nhóm lại và các nhóm được phân tách bằng dấu cách (xem mẫu bên dưới)
#đầu vào: 'CodeWars'
# đầu ra 'CdWr oeas'
# S[0] = 'C'
# S[1] = 'o'
# S[2] = 'd'
# S[3] = 'e'
# S[4] = 'W'
# S[5] = 'a'
# S[6] = 'r'
# S[7] = 's'

def sort_my_string(s)
  even_chars = []
  odd_chars = []
  s.chars.each_with_index do |char,index|
    if index.even? 
      even_chars << char
    else
      odd_chars << char
    end
  end
  even_chars.join + " " +   odd_chars.join 
end

# Sorting the Odd way!
# Cho một mảng số, hãy sắp xếp chúng theo cách sao cho tất cả các số lẻ trong mảng được sắp xếp theo thứ tự tăng dần và các số chẵn được sắp xếp theo thứ tự giảm dần sau số lẻ cuối cùng.
# Ví dụ: [1,2,3,4,5,6,7,8,9] tạo ra đầu ra [1,3,5,7,9,8,6,4,2]. Nếu mảng chứa số thập phân, hãy làm tròn chúng xuống trong khi kiểm tra số lẻ/chẵn. Đầu ra phải có số gốc!

# c1
def sort_it_out(array)
   odd_numbers = []
  even_numbers=[]
  array.each do |number|
    if number.floor % 2 == 0
      even_numbers << number
    else
      odd_numbers << number
    end
  end

  even_numbers.sort!.reverse!
  odd_numbers.sort!

  return odd_numbers + even_numbers
end

# c2
def sort_it_out array
    odd, even = array.partition{|n| n.to_i.odd?}
    odd.sort + even.sort.reverse
end



# Viết chương trình xuất ra n phần tử đầu tiên của một danh sách.
# largest(2, [7,6,5,4,3,2,1])
# => [6,7]

def largest(n,xs)
	xs.max(n).sort
end

