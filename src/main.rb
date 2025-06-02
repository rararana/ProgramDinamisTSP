class String
    def red;          "\e[31m#{self}\e[0m" end
    def green;        "\e[32m#{self}\e[0m" end
    def yellow;       "\e[33m#{self}\e[0m" end
    def blue;         "\e[34m#{self}\e[0m" end
    def magenta;      "\e[35m#{self}\e[0m" end
    def cyan;         "\e[36m#{self}\e[0m" end
    def bold;         "\e[1m#{self}\e[22m" end
  end

  puts "TSP Path Finder".cyan.bold
  puts "oleh Ranashahira Reztaputri - 13523007".cyan.bold
  puts "-"*30
  
  print "Masukkan nama input file: ".yellow
  filename = gets.strip
  
  begin
    lines = File.readlines("../test/" + filename).map(&:strip)
  rescue
    puts "File tidak ditemukan!".red
    exit
  end
  
  N = lines[0].to_i
  if lines.length != N + 1
    puts "Error: Jumlah baris tidak sesuai dengan N.".red
    exit
  end
  
  adj = Array.new(N + 1) { Array.new(N + 1, 0) }
  
  (1..N).each do |i|
    row = lines[i].split.map do |x|
      if x.downcase == "infinity"
        1e9.to_i + 7
      else
        x.to_i
      end
    end
  
    if row.length != N
      puts "Error: Baris ke-#{i} tidak memiliki #{N} elemen.".red
      exit
    end
  
    (1..N).each do |j|
      adj[i][j] = row[j - 1]
    end
  end
  
  memo = {}
  next_path = {}
  
  def f(curr_vertex, vertex, adj, memo, next_path)
    key = [curr_vertex, vertex.sort]
    return memo[key] if memo.key?(key)
  
    if vertex.empty?
      return adj[curr_vertex][1]
    else
      val = 1e9.to_i + 7
      best_next = nil
      vertex.each_with_index do |v, i|
        tmp = vertex.dup
        tmp.delete_at(i)
        cost_edge = adj[curr_vertex][v]
        next if cost_edge >= val || cost_edge < 0
  
        cost = cost_edge + f(v, tmp, adj, memo, next_path)
        if cost < val
          val = cost
          best_next = v
        end
      end
  
      if best_next.nil?
        memo[key] = val
        return val
      end
  
      memo[key] = val
      next_path[key] = best_next
      return val
    end
  end  
  
  def print_path(curr_vertex, vertex, next_path)
    print "Path: ".green.bold
    print "#{curr_vertex}".magenta.bold + " "
    until vertex.empty?
      key = [curr_vertex, vertex.sort]
      next_v = next_path[key]
      if next_v.nil?
        print "[tidak ada path valid]".red.bold
        break
      end
      print "#{next_v}".magenta.bold + " "
      vertex.delete(next_v)
      curr_vertex = next_v
    end
    puts "1".magenta.bold
  end  
  
  vertex_list = (2..N).to_a
  total = f(1, vertex_list, adj, memo, next_path)
  
  print_path(1, vertex_list, next_path)
  print "Total bobot: ".green.bold  
  puts "#{total}".magenta.bold  
  puts "Terima kasih sudah menggunakan TSP Path Finder!".yellow