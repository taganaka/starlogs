#!/usr/bin/env ruby

payload = File.open('./README.txt').read.split(/\r?\n/)
m = payload.dup.reverse
File.open('./README.txt', 'w') do |file|
  payload.each_with_index do |p,i|
    file.puts p
    file.flush
    `git add . && git commit --allow-empty-message -m $'#{m[i].empty? ? ' \n ' : m[i].gsub(/'/,"\\\\'")}'`
  end
end