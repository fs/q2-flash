module SexyTempPassword #:nodoc:
  module_function
  
  def generate
    path = File.join($sexy_plugin_path, 'sexy-passwords.txt')
    passwords = File.open(path).read.split(/\n/)
    random = passwords[rand(passwords.size - 1)]
    digits = ''
    4.times { |i| digits << (rand(9)+1).to_s }
    return "#{random}#{digits}"
  end
    
end
